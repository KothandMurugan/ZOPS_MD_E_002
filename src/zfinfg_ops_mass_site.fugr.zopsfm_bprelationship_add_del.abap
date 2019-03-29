FUNCTION zopsfm_bprelationship_add_del .
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_BUSINESSPARTNER1) LIKE  BAPIBUS1006_HEAD-BPARTNER
*"       OPTIONAL
*"     VALUE(IV_BUSINESSPARTNER2) LIKE  BAPIBUS1006_HEAD-BPARTNER
*"       OPTIONAL
*"     VALUE(IV_RELATIONSHIPCATEGORY) LIKE  BUT050-RELTYP OPTIONAL
*"     VALUE(IV_RELATIONSHIPTYPE) LIKE  BUT050-RELKIND OPTIONAL
*"     VALUE(IV_VALIDFROMDATE) LIKE
*"        BAPIBUS1006002_HEADER-VALIDFROMDATE DEFAULT SY-DATLO
*"     VALUE(IV_VALIDUNTILDATE) LIKE
*"        BAPIBUS1006002_HEADER-VALIDUNTILDATE DEFAULT '99991231'
*"     VALUE(IV_DIFFERENTIATIONTYPEVALUE) LIKE  BUT050-DFTVAL OPTIONAL
*"     VALUE(IV_XDFREL) LIKE  BUT050-XDFREL OPTIONAL
*"     VALUE(IV_QUEUE_NAME) TYPE  TRFCQNAM OPTIONAL
*"     VALUE(IV_REL_CAT_FLAG) TYPE  CHAR3 OPTIONAL
*"     VALUE(IT_RELSHIP_DATA) TYPE  ZTOPS_RELTYP OPTIONAL
*"     VALUE(IV_DB_OPERATION) TYPE  DB_ACCESS_MODE OPTIONAL
*"  TABLES
*"      T_RETURN STRUCTURE  BAPIRET2 OPTIONAL
*"----------------------------------------------------------------------
  DATA : lo_ref_ms TYPE REF TO zcl_ops_mass_site_creation,
         lo_rltyp TYPE REF TO zcl_ops_mass_site_relationship,
         ls_bapi_log                   TYPE cvis_bp_return,
         lt_bapi_log                   TYPE cvis_bp_return_t.

  CONSTANTS:
         lc_mtype_e TYPE bapi_mtype VALUE 'E',
         lc_mtype_s TYPE bapi_mtype VALUE 'S',
         lc_bp      TYPE char5    VALUE 'BP'.

  IF lo_ref_ms IS NOT BOUND.
    lo_ref_ms = NEW #( ).
  ENDIF.

  IF lo_rltyp IS NOT BOUND.
     lo_rltyp = NEW #( ).
  ENDIF.

*  CALL FUNCTION 'BUPR_RELATIONSHIP_CREATE'
*    EXPORTING
*      iv_partner_1                  = iv_businesspartner1
*      iv_partner_2                  = iv_businesspartner2
*      iv_relationship               = iv_relationshipcategory
*      iv_relationtype               = iv_relationshiptype
*      iv_date_from                  = iv_validfromdate
*      iv_date_to                    = iv_validuntildate
*      iv_differentiation_type_value = iv_differentiationtypevalue
*      iv_xdfrel                     = iv_xdfrel
*    TABLES
*      et_return                     = t_return[].
*
**--->"check later if any changes needs to be done
*  COMMIT WORK AND WAIT.
**--->Handle Application Log
*  IF lo_ref_ms IS BOUND AND t_return[] IS NOT INITIAL.
*    lo_ref_ms->save_appl_log(
*      EXPORTING
*        it_applog_commn = t_return[]
*    ).
*  ENDIF.

*>> Start
    DATA : lt_return                   TYPE TABLE OF bapiret2 INITIAL SIZE 1,
           lt_return_t                 TYPE TABLE OF bapiret2 INITIAL SIZE 1,
           ls_bapibus1006002_central   TYPE bapibus1006002_central,
           ls_bapibus1006002_central_x TYPE bapibus1006002_central_x,
           ls_return                   TYPE bapiret2.

    CONSTANTS:
           lc_success TYPE bapi_mtype VALUE 'S',
           lc_id      TYPE symsgid    VALUE 'ZOPS',
           lc_r1      TYPE symsgid    VALUE 'R1',
           lc_db_i    TYPE db_access_mode VALUE 'I',
           lc_db_d    TYPE db_access_mode VALUE 'D'.

  IF iv_rel_cat_flag IS NOT INITIAL.
    lo_rltyp->get_rel_cat_type(
      EXPORTING
        iv_rel_cat_flag = iv_rel_cat_flag
      IMPORTING
        ev_relcat       =  DATA(lv_relcat)
        ev_reltype      =  DATA(lv_reltype) ).
  ENDIF.

 IF iv_db_operation EQ lc_db_i.
    IF  ( lv_relcat IS NOT INITIAL AND lv_reltype IS NOT INITIAL ).
      LOOP AT it_relship_data ASSIGNING FIELD-SYMBOL(<lfs_relship_data>).

        CALL FUNCTION 'BAPI_BUPR_RELATIONSHIP_CREATE'
          EXPORTING
            businesspartner1     = <lfs_relship_data>-bpartner
            businesspartner2     = <lfs_relship_data>-bpartner_r
            relationshipcategory = lv_relcat
            relationshiptype     = lv_reltype
            validfromdate        = <lfs_relship_data>-bu_datfrom
            validuntildate       = <lfs_relship_data>-bu_datto
          TABLES
            return               = lt_return_t.
" Standard Success message wasn't carrying BP number, hence replaced ny custom message
        IF line_exists( lt_return_t[ type = lc_success id = lc_r1 number = 048 ] ).
          ls_return-type = lc_success.
          ls_return-id   = lc_id.
          ls_return-number = 033.
          ls_return-message_v1 = <lfs_relship_data>-bpartner.
          APPEND ls_return TO lt_return_t.
          CLEAR ls_return.
        ENDIF.
*        APPEND LINES OF lt_return_t TO lt_return.

      LOOP AT lt_return_t ASSIGNING FIELD-SYMBOL(<lfs_return_t>).
        ls_bapi_log-run_id = <lfs_relship_data>-bpartner.
        ls_bapi_log-type = <lfs_return_t>-type.
        ls_bapi_log-id = <lfs_return_t>-id.
        ls_bapi_log-number = <lfs_return_t>-number.
        ls_bapi_log-message_v1 = <lfs_return_t>-message_v1.
        ls_bapi_log-message_v2 = <lfs_return_t>-message_v2.
        ls_bapi_log-message_v3 = <lfs_return_t>-message_v3.
        ls_bapi_log-message_v4 = <lfs_return_t>-message_v4.
        APPEND ls_bapi_log TO lt_bapi_log.
        CLEAR:ls_bapi_log.
      ENDLOOP.

        CLEAR: lt_return_t.

        IF line_exists( lt_bapi_log[ type = lc_mtype_e ] ).

           ls_bapi_log-run_id = <lfs_relship_data>-bpartner.
           ls_bapi_log-type = lc_mtype_e.
           ls_bapi_log-id = lc_id.
           ls_bapi_log-number = 048.
           APPEND ls_bapi_log TO lt_bapi_log.
           CLEAR:ls_bapi_log.

          CONTINUE.
        ELSE.
          ls_bapibus1006002_central-department = <lfs_relship_data>-bu_abtnr.
          ls_bapibus1006002_central_x-department = abap_true.
          ls_bapibus1006002_central-function   = <lfs_relship_data>-bu_pafkt.
          ls_bapibus1006002_central_x-function = abap_true.
          ls_bapibus1006002_central-tel1_numbr = <lfs_relship_data>-ad_tlnmbr.
          ls_bapibus1006002_central_x-tel1_numbr = abap_true.
          ls_bapibus1006002_central-e_mail     = <lfs_relship_data>-ad_smtpadr.
          ls_bapibus1006002_central_x-e_mail = abap_true.

          CALL FUNCTION 'BAPI_BUPR_CONTP_CHANGE'
            EXPORTING
              businesspartner = <lfs_relship_data>-bpartner
              contactperson   = <lfs_relship_data>-bpartner_r
              centraldata     = ls_bapibus1006002_central
              centraldata_x   = ls_bapibus1006002_central_x
            TABLES
              return          = lt_return_t.
*          APPEND LINES OF lt_return_t TO lt_return.

          LOOP AT lt_return_t ASSIGNING <lfs_return_t>.
            ls_bapi_log-run_id = <lfs_relship_data>-bpartner.
            ls_bapi_log-type = <lfs_return_t>-type.
            ls_bapi_log-id = <lfs_return_t>-id.
            ls_bapi_log-number = <lfs_return_t>-number.
            ls_bapi_log-message_v1 = <lfs_return_t>-message_v1.
            ls_bapi_log-message_v2 = <lfs_return_t>-message_v2.
            ls_bapi_log-message_v3 = <lfs_return_t>-message_v3.
            ls_bapi_log-message_v4 = <lfs_return_t>-message_v4.
            APPEND ls_bapi_log TO lt_bapi_log.
            CLEAR:ls_bapi_log.
          ENDLOOP.
        AT END OF bpartner.
          IF line_exists( lt_bapi_log[ type = lc_mtype_e ] ).
           ls_bapi_log-run_id = <lfs_relship_data>-bpartner.
           ls_bapi_log-type = lc_mtype_e.
           ls_bapi_log-id = lc_id.
           ls_bapi_log-number = 048.
           APPEND ls_bapi_log TO lt_bapi_log.
           CLEAR:ls_bapi_log.
           ENDIF.
          ENDAT.
          CLEAR: lt_return_t.
        ENDIF.
      ENDLOOP.
*--->It's DONE
      IF line_exists( lt_bapi_log[ type = lc_mtype_s ] ).
        lo_rltyp->commit_relationship_data( ).
      ELSE.
*         MESSAGE
      ENDIF.
    ENDIF.

    IF lv_relcat IS NOT INITIAL AND lv_reltype IS INITIAL.
      LOOP AT it_relship_data  ASSIGNING <lfs_relship_data>.
        CALL FUNCTION 'BAPI_BUPR_RELATIONSHIP_CREATE'
          EXPORTING
            businesspartner1     = <lfs_relship_data>-bpartner
            businesspartner2     = <lfs_relship_data>-bpartner_r
            relationshipcategory = lv_relcat
            validfromdate        = <lfs_relship_data>-bu_datfrom
            validuntildate       = <lfs_relship_data>-bu_datto
          TABLES
            return               = lt_return_t.
" Standard Success message wasn't carrying BP number, hence adding custom message
        IF line_exists( lt_return_t[ type = lc_success id = lc_r1 number = 048 ] ).
          ls_return-type = lc_success.
          ls_return-id   = lc_id.
          ls_return-number = 033.
          ls_return-message_v1 = <lfs_relship_data>-bpartner.
          APPEND ls_return TO lt_return_t.

          LOOP AT lt_return_t ASSIGNING <lfs_return_t>.
            ls_bapi_log-run_id = <lfs_relship_data>-bpartner.
            ls_bapi_log-type = <lfs_return_t>-type.
            ls_bapi_log-id = <lfs_return_t>-id.
            ls_bapi_log-number = <lfs_return_t>-number.
            ls_bapi_log-message_v1 = <lfs_return_t>-message_v1.
            ls_bapi_log-message_v2 = <lfs_return_t>-message_v2.
            ls_bapi_log-message_v3 = <lfs_return_t>-message_v3.
            ls_bapi_log-message_v4 = <lfs_return_t>-message_v4.
            APPEND ls_bapi_log TO lt_bapi_log.
            CLEAR:ls_bapi_log.
          ENDLOOP.

          CLEAR ls_return.
        ENDIF.
        AT END OF bpartner.
          IF line_exists( lt_bapi_log[ type = lc_mtype_e ] ).
           ls_bapi_log-run_id = <lfs_relship_data>-bpartner.
           ls_bapi_log-type = lc_mtype_e.
           ls_bapi_log-id = lc_id.
           ls_bapi_log-number = 048.
           APPEND ls_bapi_log TO lt_bapi_log.
           CLEAR:ls_bapi_log.
           ENDIF.
          ENDAT.
*        APPEND LINES OF lt_return_t TO lt_return.
        CLEAR: lt_return_t.
      ENDLOOP.
*--->It's DONE
      IF line_exists( lt_bapi_log[ type = lc_mtype_s ] ).
        lo_rltyp->commit_relationship_data( ).
      ELSE.
*        MESSAGE
      ENDIF.
    ENDIF.

   ELSEIF iv_db_operation EQ lc_db_d. "Delete Relationship

    IF lv_relcat IS NOT INITIAL.
      LOOP AT it_relship_data ASSIGNING <lfs_relship_data>.
        CALL FUNCTION 'BAPI_BUPR_RELATIONSHIP_REMOVE'
          EXPORTING
            businesspartner1     = <lfs_relship_data>-bpartner
            businesspartner2     = <lfs_relship_data>-bpartner_r
            relationshipcategory = lv_relcat
            validfromdate        = <lfs_relship_data>-bu_datfrom
            validuntildate       = <lfs_relship_data>-bu_datto
          TABLES
            return               = lt_return_t.
        IF lt_return_t IS NOT INITIAL.
*          APPEND LINES OF lt_return_t TO lt_return.
          LOOP AT lt_return_t ASSIGNING <lfs_return_t>.
            ls_bapi_log-run_id = <lfs_relship_data>-bpartner.
            ls_bapi_log-type = <lfs_return_t>-type.
            ls_bapi_log-id = <lfs_return_t>-id.
            ls_bapi_log-number = <lfs_return_t>-number.
            ls_bapi_log-message_v1 = <lfs_return_t>-message_v1.
            ls_bapi_log-message_v2 = <lfs_return_t>-message_v2.
            ls_bapi_log-message_v3 = <lfs_return_t>-message_v3.
            ls_bapi_log-message_v4 = <lfs_return_t>-message_v4.
            APPEND ls_bapi_log TO lt_bapi_log.
            CLEAR:ls_bapi_log.
          ENDLOOP.
          CLEAR: lt_return_t.
        ELSE.
          ls_return-type = lc_success.
          ls_return-id   = lc_id.
          ls_return-number = 032.
          ls_return-message_v1 = <lfs_relship_data>-bpartner.
          APPEND ls_return TO lt_return.
          CLEAR ls_return.

          LOOP AT lt_return ASSIGNING <lfs_return_t>.
            ls_bapi_log-run_id = <lfs_relship_data>-bpartner.
            ls_bapi_log-type = <lfs_return_t>-type.
            ls_bapi_log-id = <lfs_return_t>-id.
            ls_bapi_log-number = <lfs_return_t>-number.
            ls_bapi_log-message_v1 = <lfs_return_t>-message_v1.
            ls_bapi_log-message_v2 = <lfs_return_t>-message_v2.
            ls_bapi_log-message_v3 = <lfs_return_t>-message_v3.
            ls_bapi_log-message_v4 = <lfs_return_t>-message_v4.
            APPEND ls_bapi_log TO lt_bapi_log.
            CLEAR:ls_bapi_log.
          ENDLOOP.

        ENDIF.
        AT END OF bpartner.
          IF line_exists( lt_bapi_log[ type = lc_mtype_e ] ).
           ls_bapi_log-run_id = <lfs_relship_data>-bpartner.
           ls_bapi_log-type = lc_mtype_e.
           ls_bapi_log-id = lc_id.
           ls_bapi_log-number = 048.
           APPEND ls_bapi_log TO lt_bapi_log.
           CLEAR:ls_bapi_log.
           ENDIF.
          ENDAT.

      ENDLOOP.

      IF line_exists( lt_bapi_log[ type = lc_mtype_s ] ).
        lo_rltyp->commit_relationship_data( ).
      ENDIF.
     ENDIF.
   ENDIF.

*    SORT lt_return.
*    DELETE ADJACENT DUPLICATES FROM lt_return.
*    IF lt_return IS NOT INITIAL  AND lo_rltyp IS BOUND.
*      lo_ref_ms->save_appl_log(
*        EXPORTING
*          it_applog_commn = lt_return ).

    SORT lt_bapi_log.
    DELETE ADJACENT DUPLICATES FROM lt_bapi_log.
    IF lt_bapi_log IS NOT INITIAL  AND lo_ref_ms IS BOUND.

      lo_ref_ms->save_appl_log(
        EXPORTING
          it_applog_bp    = lt_bapi_log
          iv_site_bp      = lc_bp ).

    ENDIF.
    CLEAR: ls_bapibus1006002_central,
           ls_bapibus1006002_central_x,
            lt_return_t,lt_return.

ENDFUNCTION.
