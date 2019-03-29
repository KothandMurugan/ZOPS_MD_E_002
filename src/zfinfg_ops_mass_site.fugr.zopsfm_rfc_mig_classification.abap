FUNCTION zopsfm_rfc_mig_classification .
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_OBJECTKEYNEW) LIKE  BAPI1003_KEY-OBJECT OPTIONAL
*"     VALUE(IV_OBJECTTABLENEW) LIKE  BAPI1003_KEY-OBJECTTABLE OPTIONAL
*"     VALUE(IV_CLASSNUMNEW) LIKE  BAPI1003_KEY-CLASSNUM OPTIONAL
*"     VALUE(IV_CLASSTYPENEW) LIKE  BAPI1003_KEY-CLASSTYPE OPTIONAL
*"     VALUE(IV_STATUS) LIKE  BAPI1003_KEY-STATUS DEFAULT '1'
*"     VALUE(IV_STANDARDCLASS) LIKE  BAPI1003_KEY-STDCLASS OPTIONAL
*"     VALUE(IV_CHANGENUMBER) LIKE  BAPI1003_KEY-CHANGENUMBER OPTIONAL
*"     VALUE(IV_KEYDATE) LIKE  BAPI1003_KEY-KEYDATE DEFAULT SY-DATUM
*"     VALUE(IV_NO_DEFAULT_VALUES) LIKE  BAPI1003_KEY-FLAG DEFAULT
*"       SPACE
*"     VALUE(IV_OBJECTKEYNEW_LONG) LIKE  BAPI1003_KEY-OBJECT_LONG
*"       OPTIONAL
*"     VALUE(IV_TESTRUN) LIKE  BAPIE1GLOBAL_DATA-TESTRUN OPTIONAL
*"     VALUE(IV_QUEUE_NAME) TYPE  TRFCQNAM OPTIONAL
*"     VALUE(IV_CLASS_NAME) TYPE  KLASSE_D OPTIONAL
*"  TABLES
*"      T_ALLOCVALUESNUM STRUCTURE  BAPI1003_ALLOC_VALUES_NUM OPTIONAL
*"      T_ALLOCVALUESCHAR STRUCTURE  BAPI1003_ALLOC_VALUES_CHAR
*"       OPTIONAL
*"      T_ALLOCVALUESCURR STRUCTURE  BAPI1003_ALLOC_VALUES_CURR
*"       OPTIONAL
*"      T_RETURN STRUCTURE  BAPIRET2 OPTIONAL
*"      T_CLASSF_DATA STRUCTURE  ZSOPS_CLASSIFICATION OPTIONAL
*"----------------------------------------------------------------------
*&----------------------------------------------------------------------*
*& Method     : ZOPSFM_RFC_MIG_CLASSIFICATION                           *
*& Description:1.This FM Is Created For Background Task Processing With *
*& Inbound Queue Creation.                                              *
*& 2.After BAPI Execution Commit DB and Save Application Logs           *
*&----------------------------------------------------------------------*
  DATA : lo_ref_ms      TYPE REF TO zcl_ops_mass_site_creation,
         lt_bapi1003_alloc_values_char TYPE TABLE OF bapi1003_alloc_values_char INITIAL SIZE 1,
         ls_bapi1003_alloc_values_char TYPE bapi1003_alloc_values_char,
         ls_bapi1003_key               TYPE bapi1003_key,
         lt_return_temp                TYPE STANDARD TABLE OF bapiret2,
*--->Prepare Log data for Site
           ls_bapi_log                   TYPE cvis_bp_return,
           lt_bapi_log                   TYPE cvis_bp_return_t.

  CONSTANTS:
         lc_objecttable TYPE tabelle VALUE 'BETR',
         lc_classtype   TYPE klassenart VALUE '030',
         lc_site TYPE char5    VALUE 'Site',
         lc_foursix TYPE symsgno VALUE '046',
         lc_fourseven TYPE symsgno VALUE '047',
         lc_msg_type_s TYPE bapi_mtype VALUE 'S',
         lc_msg_type_e TYPE bapi_mtype VALUE 'E',
         lc_message_cls TYPE symsgid VALUE 'ZOPS'.

  IF lo_ref_ms IS NOT BOUND.
    lo_ref_ms = NEW #( ).
  ENDIF.
*ZSOPS_CLASSIFICATION
**Start

      LOOP AT t_classf_data ASSIGNING FIELD-SYMBOL(<lfs_classf_data>).
        "If valid DB data and classification available
        IF iv_class_name IS NOT INITIAL AND <lfs_classf_data> IS ASSIGNED.
          ls_bapi1003_alloc_values_char-charact = <lfs_classf_data>-atnam.
          ls_bapi1003_alloc_values_char-value_char = <lfs_classf_data>-atwrt.
          APPEND ls_bapi1003_alloc_values_char TO lt_bapi1003_alloc_values_char.
          CLEAR: ls_bapi1003_alloc_values_char.

          AT END OF object. " For Every End Of Site
            CALL FUNCTION 'DMC_MIG_CLASSIFICATION'
              EXPORTING
                objectkeynew    = <lfs_classf_data>-object
                objecttablenew  = lc_objecttable
                classnumnew     = iv_class_name
                classtypenew    = lc_classtype
                keydate         = sy-datum
              IMPORTING
                classif_status  = ls_bapi1003_key-status
              TABLES
                allocvalueschar = lt_bapi1003_alloc_values_char
                return          = lt_return_temp.

            LOOP AT lt_return_temp ASSIGNING FIELD-SYMBOL(<lfs_return_temp>).

              IF <lfs_return_temp>-type EQ lc_msg_type_s.
                 DATA(lv_sucess) = abap_true.
              ENDIF.

              IF <lfs_return_temp>-type EQ lc_msg_type_e.
                 DATA(lv_error) = abap_true.
              ENDIF.

             ls_bapi_log-run_id = <lfs_classf_data>-object.
             ls_bapi_log-type = <lfs_return_temp>-type.
             ls_bapi_log-id = <lfs_return_temp>-id.
             ls_bapi_log-number = <lfs_return_temp>-number.
             ls_bapi_log-message_v1 = <lfs_return_temp>-message_v1.
             ls_bapi_log-message_v2 = <lfs_return_temp>-message_v2.
             ls_bapi_log-message_v3 = <lfs_return_temp>-message_v3.
             ls_bapi_log-message_v4 = <lfs_return_temp>-message_v4.
             APPEND ls_bapi_log TO lt_bapi_log.
             CLEAR:ls_bapi_log.
        ENDLOOP.

        IF lv_sucess EQ abap_true.
         ls_bapi_log-run_id = <lfs_classf_data>-object.
         ls_bapi_log-type = lc_msg_type_s.
         ls_bapi_log-id = lc_message_cls.
         ls_bapi_log-number = lc_foursix.
         APPEND ls_bapi_log TO lt_bapi_log.
         CLEAR:ls_bapi_log,
               lv_sucess.
       ELSEIF lv_error EQ abap_true.
         ls_bapi_log-run_id = <lfs_classf_data>-object.
         ls_bapi_log-type = lc_msg_type_e.
         ls_bapi_log-id = lc_message_cls.
         ls_bapi_log-number = lc_fourseven.
         APPEND ls_bapi_log TO lt_bapi_log.
         CLEAR:ls_bapi_log,
               lv_error.
        ENDIF.

            CLEAR: lt_return_temp.
          ENDAT.
        ENDIF.
      ENDLOOP.

*--->Handle Application Log
  IF lo_ref_ms IS BOUND AND lt_bapi_log IS NOT INITIAL.
    lo_ref_ms->save_appl_log(
      EXPORTING
        it_applog_bp    = lt_bapi_log
        iv_site_bp      = lc_site ).
  ENDIF.

ENDFUNCTION.
