class ZCL_OPS_MASS_SITE_RELATIONSHIP definition
  public
  final
  create public .

public section.

  data GV_REF_SITE type REF_WKFIL .
  data GO_MASS_SITE_API type ref to ZCL_OPS_MASS_SITE_CREATION .
  data GV_QUEUE type CHAR9 .
  data GO_MASS_SITE type ref to ZCL_OPS_MASS_SITE_CREATION .

  methods COMMIT_RELATIONSHIP_DATA .
  methods MAP_RELATIONSHIP_TYPES
    importing
      !IT_DATA type SOI_GENERIC_TABLE
    exporting
      !ET_RELSHIP_DATA type ZCL_OPS_MASS_SITE_CREATION=>GTT_REL_D
    exceptions
      NO_VALID_DATA_FOUND .
  methods VALIDATE_AND_START_PROCESS
    importing
      !IT_BP_REL type ZCL_OPS_MASS_SITE_CREATION=>GTT_REL_D
      !IV_REL_CAT_FLAG type CHAR3
      !IV_DB_OPERATION type DB_ACCESS_MODE
      !IV_BACKGROUND type XFELD optional
    exceptions
      NO_VALID_DATA_FOUND .
  methods CREATE_RELATIONSHIP_FOR_BP
    importing
      !IT_RELSHIP_DATA type ZCL_OPS_MASS_SITE_CREATION=>GTT_REL_D
      !IV_REL_CAT_FLAG type CHAR3
      !IV_BACKGROUND type XFELD optional
      !IV_DB_OPERATION type DB_ACCESS_MODE optional .
  methods DELETE_BP_RELATIONSHIP
    importing
      !IT_RELSHIP_DATA type ZCL_OPS_MASS_SITE_CREATION=>GTT_REL_D
      !IV_REL_CAT_FLAG type CHAR3
      !IV_BACKGROUND type XFELD optional
      !IV_DB_OPERATION type DB_ACCESS_MODE optional
    exceptions
      RELATIONSHIP_CAT_NOT_FOUND .
  methods GET_REL_CAT_TYPE
    importing
      !IV_REL_CAT_FLAG type CHAR3
    exporting
      !EV_RELCAT type BU_RELTYP
      !EV_RELTYPE type BU_RELKIND .
  methods CONSTRUCTOR .
  methods CHANGE_LOG .
protected section.
private section.

  constants GC_DB_I type DB_ACCESS_MODE value 'I' ##NO_TEXT.
  constants GC_DB_D type DB_ACCESS_MODE value 'D' ##NO_TEXT.
  constants GC_SRC_OBJNAME type ZSRC_OBJNAME value 'CM_BP_RELATIONSHIP' ##NO_TEXT.
  constants GC_RICEF_ID type ZRICEF_ID value 'OPS-MD-E-002' ##NO_TEXT.
  constants GC_REL_CAT_CPC type CHAR3 value 'CPC' ##NO_TEXT.
  constants GC_MTYPE_S type BAPI_MTYPE value 'S' ##NO_TEXT.
  constants GC_REL_CAT_CPV type CHAR3 value 'CPV' ##NO_TEXT.
  constants GC_REL_CAT_ICV type CHAR3 value 'ICV' ##NO_TEXT.
  constants GC_MTYPE_E type BAPI_MTYPE value 'E' ##NO_TEXT.
  constants GC_DESTINATION type CHAR4 value 'NONE' ##NO_TEXT.
ENDCLASS.



CLASS ZCL_OPS_MASS_SITE_RELATIONSHIP IMPLEMENTATION.


  METHOD change_log.
*&-------------------------------------------------------------------------------------------*
*& METHOD: CHANGE_LOG.                                                                       *
*& Description: Header Logs With All The Required Metods                                     *                          *
*&-------------------------------------------------------------------------------------------*
*& Program/Class : ZCL_OPS_MASS_SITE_RELATIONSHIP                                            *
*& Author      : Shyamkiran Nimbalpudi                                                       *
*& Created     : 26.11.2018 (DD.MM.YYYY)                                                     *
*& Reference   : OPS_MD_E_002 : Mass Site Creation(In Same FD This Requirement Is Updated)   *                                        *
*& Transport Request : SD2K900117                                                            *
*&-------------------------------------------------------------------------------------------*

* Method 1 :CHECK_DB_OPERATION  Instance Method Private
    "Flag Check for Database Operation(Currently Not Used Will Use It Later)
* Method 2 :COMMIT_RELATIONSHIP_DATA  Instance Method Private
    "Update Relationship Data for Business Partner(BP)
* Method 3 :MAP_RELATIONSHIP_TYPES  Instance Method Public
    "Relationship Types Data(Mapping Into Internal Table)
* Method 4 :VALIDATE_AND_START_PROCESS  Instance Method Public
    "Validate Relationship Data and Start Processing
* Method 5 :CREATE_RELATIONSHIP_FOR_BP  Instance Method Public
    "Create BP Relationship
* Method 6 :DELETE_BP_RELATIONSHIP  Instance Method Public
    "Delete existing BP Relationship
* Method 7 :GET_REL_CAT_TYPE  Static Method Public
    "Get Relationship Type and Category Details
* Method 8 :CONSTRUCTOR	Instance Method	Public
    "Contructor
* Method 9 :CHANGE_LOG  Instance Method Public
    "Change log
*&-------------------------------------------------------------------------------------------*
*&                  Change Log                                                               *
*&-------------------------------------------------------------------------------------------*
*& Changed On        :                                                                       *
*& Changed By        :                                                                       *
*& Transport Request :                                                                       *
*& Description       :                                                                       *
*&-------------------------------------------------------------------------------------------*

  ENDMETHOD.


  METHOD commit_relationship_data.
*&---------------------------------------------------------------------*
*& Method     : COMMIT_RELATIONSHIP_DATA                               *
*& Description: This Method Created For BAPI Commit Instead Of Using-  *
*& BAPI Transaction Commit FM                                          *                                                                *                                                            *
*&---------------------------------------------------------------------*
    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
      EXPORTING
        wait = abap_true.

  ENDMETHOD.


  METHOD constructor.
*&---------------------------------------------------------------------*
*& Method     : CONSTRUCTOR                                            *
*& Description: Instantiate While Initializing The Class And Use It    *
*& External Instantiation                                              *
*&---------------------------------------------------------------------*
    IF go_mass_site_api IS NOT BOUND.
      go_mass_site_api = NEW #( ).
    ENDIF.

    IF go_mass_site IS NOT BOUND.
      go_mass_site = NEW #( ).
    ENDIF.
  ENDMETHOD.


  METHOD create_relationship_for_bp.
*&---------------------------------------------------------------------*
*& Method     : CREATE_RELATIONSHIP_FOR_BP                             *
*& Description: 1.First Check Relationship Category Flag               *
*& 2.Get The BP Relationship Category And Type To Process              *
*& 3.Process With Relationship Data And Feed BAPI                      *
*& 4.First check for Relationship Category and Type for Creating-      *
*& Contact Person Either For Customer Or Vendor,If Yes Then Process.   *                              *
*& 5.If Not For Contact Person,Then Process For International-         *
*& Client/Vendor.                                                      *
*& 6.Commit DB and Save Application Logs Messages                      *
*&---------------------------------------------------------------------*
    DATA : lt_return                   TYPE TABLE OF bapiret2 INITIAL SIZE 1,
           lt_return_t                 TYPE TABLE OF bapiret2 INITIAL SIZE 1,
           ls_bapibus1006002_central   TYPE bapibus1006002_central,
           ls_bapibus1006002_central_x TYPE bapibus1006002_central_x,
           ls_return                   TYPE bapiret2,
           ls_bapi_log                   TYPE cvis_bp_return,
           lt_bapi_log                   TYPE cvis_bp_return_t.

    CONSTANTS:
           lc_success TYPE bapi_mtype VALUE 'S',
           lc_id      TYPE symsgid    VALUE 'ZOPS',
           lc_r1      TYPE symsgid    VALUE 'R1',
           lc_bp      TYPE char5    VALUE 'BP'.

  IF iv_background IS INITIAL. "Foreground
    CHECK iv_rel_cat_flag IS NOT INITIAL.

    get_rel_cat_type(
      EXPORTING
        iv_rel_cat_flag = iv_rel_cat_flag
      IMPORTING
        ev_relcat       =  DATA(lv_relcat)
        ev_reltype      =  DATA(lv_reltype) ).

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
        IF line_exists( lt_return_t[ type = gc_mtype_e id = lc_r1 number = 048 ] ).
          ls_return-type = lc_success.
          ls_return-id   = lc_id.
          ls_return-number = 033.
          ls_return-message_v1 = <lfs_relship_data>-bpartner.
          APPEND ls_return TO lt_return.
          CLEAR ls_return.
        ENDIF.

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

        IF line_exists( lt_bapi_log[ type = gc_mtype_e ] ).
           ls_bapi_log-run_id = <lfs_relship_data>-bpartner.
           ls_bapi_log-type = gc_mtype_e.
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
        ENDIF.
        AT END OF bpartner.
          IF line_exists( lt_bapi_log[ type = gc_mtype_e ] ).
           ls_bapi_log-run_id = <lfs_relship_data>-bpartner.
           ls_bapi_log-type = gc_mtype_e.
           ls_bapi_log-id = lc_id.
           ls_bapi_log-number = 048.
           APPEND ls_bapi_log TO lt_bapi_log.
           CLEAR:ls_bapi_log.
           ENDIF.
          ENDAT.
      ENDLOOP.
*--->It's DONE
      IF line_exists( lt_bapi_log[ type = gc_mtype_s ] ).
        commit_relationship_data( ).
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
          CLEAR ls_return.
        ENDIF.

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
          IF line_exists( lt_bapi_log[ type = gc_mtype_e ] ).
           ls_bapi_log-run_id = <lfs_relship_data>-bpartner.
           ls_bapi_log-type = gc_mtype_e.
           ls_bapi_log-id = lc_id.
           ls_bapi_log-number = 048.
           APPEND ls_bapi_log TO lt_bapi_log.
           CLEAR:ls_bapi_log.
           ENDIF.
          ENDAT.
        CLEAR: lt_return_t.
      ENDLOOP.
*--->It's DONE
      IF line_exists( lt_bapi_log[ type = gc_mtype_s ] ).
        commit_relationship_data( ).
      ELSE.
*        MESSAGE
      ENDIF.
    ENDIF.
    SORT lt_bapi_log.
    DELETE ADJACENT DUPLICATES FROM lt_bapi_log.
    IF lt_bapi_log IS NOT INITIAL  AND go_mass_site_api IS BOUND.

      go_mass_site_api->save_appl_log(
        EXPORTING
          it_applog_bp    = lt_bapi_log
          iv_site_bp      = lc_bp ).
    ENDIF.
    CLEAR: ls_bapibus1006002_central,
           ls_bapibus1006002_central_x,
            lt_return_t,lt_return.

  ELSE. " Background


    CLEAR gv_queue.
    gv_queue = TEXT-001.
*--->Call For Background
    go_mass_site->create_inbound_queue(
       EXPORTING
         iv_site_bp = gv_queue
       IMPORTING
         ev_name = DATA(lv_queue_name) ).

     CALL FUNCTION 'ZOPSFM_BPRELATIONSHIP_ADD_DEL' IN BACKGROUND TASK
      AS SEPARATE UNIT DESTINATION gc_destination
       EXPORTING
        iv_rel_cat_flag                   = iv_rel_cat_flag
        it_relship_data                   = it_relship_data
        iv_db_operation                   = iv_db_operation.

    COMMIT WORK.
  ENDIF.
  ENDMETHOD.


  METHOD delete_bp_relationship.
*&---------------------------------------------------------------------*
*& Method     : DELETE_BP_RELATIONSHIP                                 *
*& Description: 1.Get The BP Relationship Category To Process          *
*& 2.Check Relationship Category,If LV_RELCAT Is Not Initial Then Step3*
*& 3.Process With Relationship Data And Feed BAPI                      *
*& 4.Remove/Delete Existing Relationship & Commit DB                   *
*& 5.Save Messages In Application Logs                                 *
*&---------------------------------------------------------------------*
    DATA : lt_return   TYPE TABLE OF bapiret2 INITIAL SIZE 1,
           lt_return_t TYPE TABLE OF bapiret2 INITIAL SIZE 1,
           ls_return   TYPE bapiret2,
           ls_bapi_log                   TYPE cvis_bp_return,
           lt_bapi_log                   TYPE cvis_bp_return_t.

    CONSTANTS:
           lc_success TYPE bapi_mtype VALUE 'S',
           lc_id      TYPE symsgid    VALUE 'ZOPS',
           lc_bp      TYPE char5    VALUE 'BP'.
 IF iv_background IS INITIAL. "Foreground
    get_rel_cat_type(
      EXPORTING
        iv_rel_cat_flag = iv_rel_cat_flag
      IMPORTING
        ev_relcat       = DATA(lv_relcat)
        ev_reltype      = DATA(lv_reltype) ).

    IF lv_relcat IS NOT INITIAL.
      LOOP AT it_relship_data ASSIGNING FIELD-SYMBOL(<lfs_relship_data>).
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
          IF line_exists( lt_bapi_log[ type = gc_mtype_e ] ).
           ls_bapi_log-run_id = <lfs_relship_data>-bpartner.
           ls_bapi_log-type = gc_mtype_e.
           ls_bapi_log-id = lc_id.
           ls_bapi_log-number = 048.
           APPEND ls_bapi_log TO lt_bapi_log.
           CLEAR:ls_bapi_log.
           ENDIF.
          ENDAT.
      ENDLOOP.

*--->It's DONE
      commit_relationship_data( ).
*--->Handle Logs
      SORT lt_bapi_log BY type.
      DELETE ADJACENT DUPLICATES FROM lt_bapi_log COMPARING type id number.

      IF lt_bapi_log IS NOT INITIAL.
        go_mass_site_api->save_appl_log(
          EXPORTING
          it_applog_bp    = lt_bapi_log
          iv_site_bp      = lc_bp ).
*            it_applog_commn = lt_return ).
      ENDIF.
      REFRESH :lt_return, lt_return_t.
    ELSE.
      RAISE  relationship_cat_not_found.
    ENDIF.

   ELSE."BackGround

    CLEAR gv_queue.
    gv_queue = TEXT-001.
*--->Call For Background
    go_mass_site->create_inbound_queue(
       EXPORTING
         iv_site_bp = gv_queue
       IMPORTING
         ev_name = DATA(lv_queue_name) ).

     CALL FUNCTION 'ZOPSFM_BPRELATIONSHIP_ADD_DEL' IN BACKGROUND TASK
      AS SEPARATE UNIT DESTINATION gc_destination
       EXPORTING
        iv_rel_cat_flag                   = iv_rel_cat_flag
        it_relship_data                   = it_relship_data
        iv_db_operation                   = iv_db_operation.

    COMMIT WORK.
   ENDIF.
  ENDMETHOD.


  METHOD get_rel_cat_type.
*&---------------------------------------------------------------------*
*& Method     : GET_REL_CAT_TYPE                                       *
*& Description: 1. Get The Data From ZCM_CUSTCTRL_UTL TABLE, Process & *
*& Validate and Process Based On The Relationship Category,If No Errors*                                    *
*&2.Fill Relationship Category and Relationship Type To Exporting Para-*
*&---------------------------------------------------------------------*

    CALL METHOD zcl_cm_custctrl_utl=>get_parameter_value
      EXPORTING
        iv_objname       = gc_src_objname
        iv_ricef_id      = gc_ricef_id
      IMPORTING
        et_custctrl_utl  = DATA(lt_custctrl_utl)
        ev_no_data_found = DATA(lv_error).

    IF lv_error IS INITIAL.
      LOOP AT lt_custctrl_utl ASSIGNING FIELD-SYMBOL(<lfs_custctrl_utl>).
        IF iv_rel_cat_flag = gc_rel_cat_cpc.

          CASE <lfs_custctrl_utl>-seqnr.
            WHEN 1.
              ev_relcat = <lfs_custctrl_utl>-par1_value.
            WHEN 2.
              ev_reltype = <lfs_custctrl_utl>-par1_value.
            WHEN OTHERS.
          ENDCASE.
        ELSEIF iv_rel_cat_flag = gc_rel_cat_cpv.
          CASE <lfs_custctrl_utl>-seqnr.
            WHEN 1.
              ev_relcat = <lfs_custctrl_utl>-par1_value.
            WHEN 2.
              ev_reltype = <lfs_custctrl_utl>-par2_value.
            WHEN OTHERS.
          ENDCASE.
        ELSEIF iv_rel_cat_flag = gc_rel_cat_icv.
          CASE <lfs_custctrl_utl>-seqnr.
            WHEN 1.
              ev_relcat = <lfs_custctrl_utl>-par2_value.
            WHEN OTHERS.
          ENDCASE.
        ENDIF.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.


  METHOD map_relationship_types.
*&---------------------------------------------------------------------*
*& Method     : MAP_RELATIONSHIP_TYPES                                 *
*& Description: Fields & Data Mapping From The Excel Sheet Into-       *
*& Internal Table and Delete If any Duplicate Data Occurs              *
*&---------------------------------------------------------------------*
*1.Need to get the fields details and map it for BAPI
*2.Do validation like negative and positive validtions which we get from the excel sheet
*3.Check if any conversions require for the uploaded data
*4.Check whether provided data from the excel is proper or not
*5.Feed BAPI with all the proper/valid data set for all the structures and tables

*--->Local Data Declaration
    DATA : ls_data  TYPE zcl_ops_mass_site_creation=>gty_rel_typ,
           lt_rel_d TYPE zcl_ops_mass_site_creation=>gtt_rel_d.

*--->Extract Data From The Internal Table
    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      CASE <lfs_data>-column.
        WHEN 1.
          IF <lfs_data>-value IS NOT INITIAL.
            CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
              EXPORTING
                input  = <lfs_data>-value
              IMPORTING
                output = ls_data-bpartner.
          ENDIF.
        WHEN 2.
          IF <lfs_data>-value IS NOT INITIAL.
            CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
              EXPORTING
                input  = <lfs_data>-value
              IMPORTING
                output = ls_data-bpartner_r. "Relationship BP's
          ENDIF.
        WHEN 3.
          IF <lfs_data>-value IS NOT INITIAL.
*--->User Given Date To Internal Date Format
            CALL FUNCTION 'CONVERT_DATE_TO_INTERNAL'
              EXPORTING
                date_external            = <lfs_data>-value
*               ACCEPT_INITIAL_DATE      =
              IMPORTING
                date_internal            = ls_data-bu_datfrom
              EXCEPTIONS
                date_external_is_invalid = 1
                OTHERS                   = 2.
            IF sy-subrc <> 0.
* Implement suitable error handling here/logs
              CLEAR:ls_data-bu_datfrom.
            ENDIF.
          ENDIF.
        WHEN 4.
          IF <lfs_data>-value IS NOT INITIAL.
*  --->User Given Date To Internal Date Format
            CALL FUNCTION 'CONVERT_DATE_TO_INTERNAL'
              EXPORTING
                date_external            = <lfs_data>-value
              IMPORTING
                date_internal            = ls_data-bu_datto
              EXCEPTIONS
                date_external_is_invalid = 1
                OTHERS                   = 2.
            IF sy-subrc <> 0.
*  Implement suitable error handling here/logs
              CLEAR:ls_data-bu_datto.
            ENDIF.
          ENDIF.
        WHEN 5.
          ls_data-bu_abtnr = <lfs_data>-value.
        WHEN 6.
          IF <lfs_data>-value IS NOT INITIAL.
            CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
              EXPORTING
                input  = <lfs_data>-value
              IMPORTING
                output = ls_data-bu_pafkt. "Relationship BP's
          ENDIF.
        WHEN 7.
          ls_data-ad_tlnmbr = <lfs_data>-value.
        WHEN 8.
          ls_data-ad_smtpadr = <lfs_data>-value.
      ENDCASE.

      AT END OF row.
        APPEND ls_data TO et_relship_data.
        CLEAR: ls_data.
      ENDAT.
    ENDLOOP.

    SORT et_relship_data BY bpartner bpartner_r.
    DELETE et_relship_data WHERE bpartner IS INITIAL
                    AND bpartner_r IS INITIAL.

    IF et_relship_data IS INITIAL.
      RAISE no_valid_data_found.
    ENDIF.

  ENDMETHOD.


  METHOD validate_and_start_process.
*&---------------------------------------------------------------------*
*& Method     : VALIDATE_AND_START_PROCESS                             *
*& Description:                                                        *
*& 1.There Are Two Methods i.e. 1.CREATE_RELATIONSHIP_FOR_BP:          *
*& Create Relationship Contact Person and Internation Client/Vendor    *
*&2.DELETE_BP_RELATIONSHIP:This method will be used for deleting the-  *
*&Existing BP Relationship                                             *
*&---------------------------------------------------------------------*

    IF iv_db_operation = gc_db_i.
      create_relationship_for_bp(
        EXPORTING
          it_relship_data = it_bp_rel
          iv_rel_cat_flag = iv_rel_cat_flag
          iv_background   =  iv_background
          iv_db_operation =  iv_db_operation ).

    ELSEIF iv_db_operation = gc_db_d.
      delete_bp_relationship(
        EXPORTING
          it_relship_data = it_bp_rel
          iv_rel_cat_flag = iv_rel_cat_flag
          iv_background  = iv_background
          iv_db_operation =  iv_db_operation
        EXCEPTIONS
          relationship_cat_not_found = 1
          OTHERS                     = 2 ).
      IF sy-subrc <> 0.
       MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
         WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
