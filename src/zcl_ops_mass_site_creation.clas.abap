class ZCL_OPS_MASS_SITE_CREATION definition
  public
  final
  create public .

public section.

  types:
    gtt_site_status_sty TYPE STANDARD TABLE OF site_status_sty .
  types:
    BEGIN OF gty_tax,
            land1 TYPE land1.
            INCLUDE TYPE cvis_supplier_company_wtax.
    TYPES : END OF gty_tax .
  types:
    gtt_tax TYPE STANDARD TABLE OF gty_tax .
  types:
*    TYPES:
**  types:
**    tt_customer_contacts TYPE TABLE OF  cvis_customer_contacts .
*      tt_bp_address_faxno TYPE TABLE OF cvis_bp_address_faxno .
*    TYPES:
*      tt_supplier_cc_texts TYPE STANDARD TABLE OF cvis_supplier_cc_texts .
*    TYPES:
*      tt_supplier_company_wtax TYPE STANDARD TABLE OF cvis_supplier_company_wtax .
*    DATA:
*      gt_bp_ident_numbers TYPE STANDARD TABLE OF cvis_bp_ident_numbers .
*    TYPES:
*      tt_bp_tax_number TYPE STANDARD TABLE OF cvis_bp_tax_number .
*    TYPES:
*      tt_bp_industry  TYPE TABLE OF cvis_bp_industry .
*    TYPES:
*      tt_bp_address_email TYPE STANDARD TABLE OF cvis_bp_address_email .
*    TYPES:
*      tt_bp_address_uri TYPE STANDARD TABLE OF cvis_bp_address_url .
*    TYPES:
*      tt_bp_address_teleno TYPE STANDARD TABLE OF cvis_bp_address_teleno .
*    TYPES:
*      tt_site_status_sty TYPE STANDARD TABLE OF site_status_sty .
    BEGIN OF gty_msg, "Naming for global struct i.e. gty_t_msg?
        msgno TYPE syst-msgno,
        msgid TYPE syst-msgid,
        msgty TYPE syst-msgty,
        msgv1 TYPE syst-msgv1,
        msgv2 TYPE syst-msgv1,
        msgv3 TYPE syst-msgv1,
        msgv4 TYPE syst-msgv1,
      END OF gty_msg .
  types:
    BEGIN OF gty_tables,
        name TYPE char50, "string,
*        count TYPE i,
      END OF gty_tables .
  types:
*    TYPES:
*    TYPES:
*      gty_tables TYPE STANDARD TABLE OF gty_tables .
*      gt_msg TYPE STANDARD TABLE OF gty_msg .                                 " Naming for global table i.e.gty_t_msg
    gtt_bp_ident_numbers TYPE TABLE OF cvis_bp_ident_numbers .
  types:
    gtt_bp_tax_number TYPE TABLE OF cvis_bp_tax_number .
  types:
    gtt_customer_tax_indicator TYPE  TABLE OF cvis_customer_tax_indicator .
  types:
    gtt_bp_industry TYPE TABLE OF cvis_bp_industry .
  types:
    gtt_bp_bank_details TYPE TABLE OF cvis_bp_bank_details .
  types:
    gtt_bp_address_teleno TYPE TABLE OF cvis_bp_address_teleno .
  types:
    gtt_bp_address_email  TYPE TABLE OF cvis_bp_address_email .
  types:
    gtt_bp_address_faxno  TYPE TABLE OF cvis_bp_address_faxno .
  types:
    BEGIN OF gty_final, " Site Creation Fields From Template
        werks TYPE werks_d,
        bwmod TYPE bwmod,
        wbpro TYPE wbpro,
        uprof TYPE uprof_d,
        bwvko TYPE bwvko,
        bwvtw TYPE bwvtw,
        bdifp TYPE bdifp,
        spgr1 TYPE spgr1,
        spdab TYPE spdab,
        spdbi TYPE spdbi,
        wanid TYPE wanid,
        eroed TYPE eroed,
        schld TYPE schld,
      END OF gty_final .
  types:
    BEGIN OF gty_class_d,
        object TYPE objnum,
        atnam  TYPE atnam, "Characteristic name/number
        "Item number yet to decided
        atzis  TYPE atzis, "Instance cntr, this field considered as item numnber(Discussed Functionals)
*        atinn TYPE atinn , "Internal characteristic,considered as a Item number
        atwrt  TYPE atwrt30, "Characteristic value
      END OF  gty_class_d .
  types:
*      BEGIN OF gty_class_d, " Classification Data Old Template
*        werks    TYPE werks_d, "Site
*        statu    TYPE klstatus, " Class status
*        stdclass TYPE stdclass, " Indicator: Standard class
*        klart    TYPE klassenart, " Class Type
*        class    TYPE klasse_d, "Class number
*        datuv    TYPE datuv, "Valid from date
*        atstd    TYPE atstd,   "  Default value as per the table (Template: No default values (flag))
**        flag   TYPE flag , "No default values (flag) as per the FM used
*        aennr    TYPE aennr , "Change Number
*        atnam    TYPE atnam, "Characteristic Name
**      item TYPE "item number
*      END OF gty_class_d .
    BEGIN OF gty_rel_typ, " Site Creation Fields From Template
        bpartner   TYPE bu_partner, "Business Partner
        bpartner_r TYPE bu_partner, " Contact person/International client
        bu_datfrom TYPE bu_datfrom, " Date from
        bu_datto   TYPE bu_datto, " Date To
        bu_abtnr   TYPE bu_abtnr, " Department
        bu_pafkt   TYPE bu_pafkt, " Function
        ad_tlnmbr  TYPE ad_tlnmbr, "Telephone
        ad_smtpadr TYPE ad_smtpadr, "Email Address
      END OF gty_rel_typ .
  types:
    BEGIN OF gty_message ,
        werks   TYPE  werks_d,
        name1   TYPE  name1,
        status  TYPE  char4,
        message TYPE  bapi_msg,
        msgid   TYPE  symsgid,
      END OF gty_message .
  types:
    BEGIN OF gty_classf_s,
        class_name TYPE klasse_d,
        klart      TYPE klassenart,
        klschl     TYPE klschl,
        spras      TYPE spras,
      END OF gty_classf_s .
  types:
*  types:
*    BEGIN OF gty_bp_exists,
*      partner TYPE bu_partner,
*    END OF gty_bp_exists .
    gtt_site_final TYPE TABLE OF gty_final .
  types:
    gtt_class_d TYPE TABLE OF gty_class_d .
  types:
    gtt_rel_d TYPE TABLE OF gty_rel_typ .
  types:
*  types:
*    gt_message    TYPE TABLE OF ty_message .
    gtt_classf_data TYPE TABLE OF gty_classf_s .

  data:
*  types:
*    gtt_bp_exists TYPE TABLE OF gty_bp_exists .
    gt_bp_ident_numbers TYPE TABLE OF cvis_bp_ident_numbers .
*  data:
*    gt_message TYPE TABLE OF gty_message .  "site_status_tty ."
  class-data GT_CVIS_BP_GENERAL type CVIS_BP_GENERAL .
  data GT_SUPPLIER_GENERAL type CVIS_SUPPLIER_GENERAL_T .
  data GT_BP_ROLES type CVIS_BP_ROLE_T .
  data GT_BP_GENERAL type ZTCVIS_BP_GENERAL .
  data GV_REF_SITE type REF_WKFIL .
  data GV_BP_GROUP type BP_GRP_SITE .
  data GT_BP_ADDRESS_TELENO type GTT_BP_ADDRESS_TELENO .
  data:
    gt_bp_address_uri TYPE TABLE OF cvis_bp_address_url .
  data GT_BP_ADDRESS_EMAIL type GTT_BP_ADDRESS_EMAIL .
  data GT_CUSTOMER_SALES type CVIS_CUSTOMER_SALES_T .
  data GT_CUSTOMER_CONTACTS_T type CVIS_CUSTOMER_CONTACTS_T .
  data GT_CUSTOMER_SALES_FUNC type CVIS_CUSTOMER_SALES_FUNC_T .
  data GT_CUSTOMER_SALES_TEXTS type CVIS_CUSTOMER_SALES_TEXTS_T .
  data GT_CUSTOMER_TAX_INDICATOR type CVIS_CUSTOMER_TAX_INDICATOR_T .
  data:
    gt_bp_tax_number TYPE TABLE OF cvis_bp_tax_number .
  data:
*    DATA gt_bp_ident_numbers TYPE tt_bp_ident_numbers .
    gt_supplier_company_wtax TYPE TABLE OF cvis_supplier_company_wtax .
  data:
    gt_supplier_cc_texts TYPE TABLE OF cvis_supplier_cc_texts .
  data GT_SUPPLIER_PURCH_FUNC_T type CVIS_SUPPLIER_PURCH_FUNC_T .
  data GT_SUPPLIER_CONTACTS type CVIS_SUPPLIER_CONTACTS_T .
  constants GC_MSG_TYPE_E type BAPI_MTYPE value 'E' ##NO_TEXT.
  data GO_REL_REF type ref to ZCL_OPS_MASS_SITE_RELATIONSHIP .
  constants GC_CLASSTYPE type KLASSENART value '030' ##NO_TEXT.
  data GO_BP_RELTYP type ref to ZCL_OPS_MASS_SITE_RELATIONSHIP .
  data GT_MESSAGE type GTT_SITE_STATUS_STY .
  data GT_SITE_FINAL type ZTMSITE_FINAL .
  data GT_SUPPLIER_PURCHASING type CVIS_SUPPLIER_PURCHASING_T .
  data GT_SUPPLIER_PURCHASING2 type CVIS_SUPPLIER_PURCHASING2_T .
  data GT_SUPPLIER_PORG_TEXTS type CVIS_SUPPLIER_PORG_TEXTS_T .
  data GT_CUSTOMER_COMP_DUNNING type CVIS_CUSTOMER_COMP_DUNNING_T .
  data GT_SUPPLIER_COMPANY type CVIS_SUPPLIER_COMPANY_T .
  data GT_CUSTOMER_GENERAL type CVIS_CUSTOMER_GENERAL_T .
  data GT_CUSTOMER_GEN_TEXTS type CVIS_CUSTOMER_GEN_TEXTS_T .
  data GT_CUSTOMER_COMPANY type CVIS_CUSTOMER_COMPANY_T .
  class-data GV_INSTANCE type ref to ZCL_OPS_MASS_SITE_CREATION .
  data GT_RETURN type CVIS_BP_RETURN_T .
  data GV_QUEUE type CHAR9 .
  class-data GT_BP_EXISTS type ZTOPS_BP .
  constants GC_MSG_TYPE_W type CHAR1 value 'W' ##NO_TEXT.

  methods CREATE_INBOUND_QUEUE
    importing
      !IV_SITE_BP type CHAR9 optional
    exporting
      !EV_NAME type TRFCQNAM .
  methods FETCH_CLASSIFICATION_DATA
    exporting
      !ES_CLASSF_DATA type GTY_CLASSF_S .
  methods PREPARE_DATA_CREATE_CLASSIFICA
    importing
      !IV_BACKGROUND type XFELD optional
      !IT_CLASSF_DATA type GTT_CLASS_D .
  methods PREPARE_DATA_CREATE_BP
    importing
      !IV_BACKGROUND type XFELD optional .
  methods PREPARE_DATA_CREATE_SITE
    importing
      !IV_SITE_PROF type BETRP
      !IV_BACKGROUND type XFELD optional .
  methods UPLOAD_FILE
    changing
      !CV_F_PATH type LOCALFILE .
  class-methods AUTHORITY_CHECK
    importing
      !IV_BUKRS type BUKRS
    exporting
      !EV_VIM_ABORT_SAVING type C .
  methods GET_EXCEL_DATA
    importing
      !IV_FLAG type XFELD optional
      !IV_SITE_PROF type BETRP optional
      !IT_DATA type SOI_GENERIC_TABLE optional
      !IV_BACKGROUND type XFELD optional
      !IV_F_PATH type LOCALFILE
    exporting
      !ET_RELSHIP_DATA type GTT_REL_D
    exceptions
      NO_VALID_DATA_FOUND .
  methods VALIDATION_FOR_BP_CREATE
    importing
      !IV_BACKGROUND type XFELD .
  methods VALIDATION_FOR_SITE_CREATE .
  methods DISPLAY_LOG .
  methods SAVE_APPL_LOG
    importing
      !IT_APPLOG_COMMN type BAPIRET2_T optional
      !IT_APPLOG_BP type CVIS_BP_RETURN_T optional
      !IV_SITE_BP type CHAR5 optional .
  methods SAVE_APPL_LOG_1
    importing
      !IT_APIS_LOG type BAPIRET2_T .
  methods PREPARE_LOG_DATA
    importing
      !IT_SITE_STATUS type GTT_SITE_STATUS_STY
      !IT_RESULT type CVIS_BP_RETURN_T optional .
  PROTECTED SECTION.
private section.

  data GT_TAX type GTT_TAX .
  constants GC_HAS_FLAG_Y type CHAR1 value 'Y' ##NO_TEXT.
  data:
    gt_bp_bank_details TYPE TABLE OF cvis_bp_bank_details .
  constants GC_W_TITLE type STRING value 'Select Excel File' ##NO_TEXT.
  constants GC_FILE_TYP type STRING value '.xls' ##NO_TEXT.
  constants GC_ROWS type I value '1000' ##NO_TEXT.
  constants GC_COLS type I value '76' ##NO_TEXT.
  constants GC_HAS_FLAG_X type CHAR1 value 'X' ##NO_TEXT.
  constants GC_MSG_TYPE_I type CHAR1 value 'I' ##NO_TEXT.
  constants GC_CONT type CHAR6 value 'CONT' ##NO_TEXT.
  constants GC_APP_NAME type CHAR16 value 'EXCEL CONTAINER' ##NO_TEXT.
  constants GC_DOC_TITLE type CHAR10 value 'Excel' ##NO_TEXT.
  constants GC_FILE type CHAR16 value 'FILE://' ##NO_TEXT.
  constants GC_SHEET_1_GD type STRING value 'General data' ##NO_TEXT.
  constants GC_SHEET_2_GT type STRING value 'General text' ##NO_TEXT.
  constants GC_SHEET_3_SD type STRING value 'Sales data' ##NO_TEXT.
  constants GC_SHEET_4_SP type STRING value 'Sales partner' ##NO_TEXT.
  constants GC_SHEET_5_ST type STRING value 'Sales texts' ##NO_TEXT.
  constants GC_SHEET_6_CC type STRING value 'Company code' ##NO_TEXT.
  constants GC_SHEET_7_CT type STRING value 'Company text' ##NO_TEXT.
  constants GC_SHEET_8_B type STRING value 'Bank' ##NO_TEXT.
  constants GC_SHEET_9_I type STRING value 'Industries' ##NO_TEXT.
  constants GC_SHEET_10_D type STRING value 'Dunning' ##NO_TEXT.
  constants GC_SHEET_11_TC type STRING value 'Tax classification' ##NO_TEXT.
  constants GC_SHEET_12_TNS type STRING value 'Tax numbers' ##NO_TEXT.
  constants GC_SHEET_13_ID type STRING value 'Identification' ##NO_TEXT.
  constants GC_SHEET_14_VC type STRING value 'Vendor Company' ##NO_TEXT.
  constants GC_SHEET_15_VWT type STRING value 'Vendor witholding tax' ##NO_TEXT.
  constants GC_SHEET_16_VCT type STRING value 'Vendor company text' ##NO_TEXT.
  constants GC_SHEET_17_PD type STRING value 'Puchasing data' ##NO_TEXT.
  constants GC_SHEET_18_VP type STRING value 'Vendor partner' ##NO_TEXT.
  constants GC_SHEET_19_PT type STRING value 'Purchasing text' ##NO_TEXT.
  data GT_CUSTOMER_CC_TEXTS type CVIS_CUSTOMER_CC_TEXTS_T .
  data GT_BP_ADDRESS type ZTCVIS_BP_ADDRESS .
  constants GC_MESSAGE_CLS type SYMSGID value 'ZOPS' ##NO_TEXT.
  constants GC_MSG type BAPI_MSG value 'Plant created Succesfully' ##NO_TEXT.
  constants GC_MESSAGE_CLS1 type SYMSGID value 'WN' ##NO_TEXT.
  data GV_APP_FLAG type XFELD .
  data GT_BP_INDUSTRY type ZTCVIS_BP_INDUSTRY . "tt_bp_industry .
  constants GC_OPTION_EQ type DDOPTION value 'EQ' ##NO_TEXT.
  constants GC_STATUS type CHAR4 value 'E021' ##NO_TEXT.
  constants GC_MESSAGE_021 type CHAR4 value '021' ##NO_TEXT.
  constants GC_COMMUNICATION type CHAR7 value 'S4H_S4H' ##NO_TEXT.
  constants GC_MSG_TYPE_A type CHAR1 value 'A' ##NO_TEXT.
  constants GC_MSG_TYPE_S type CHAR1 value 'S' ##NO_TEXT.
  constants GC_PRAST type PRAST value 'S' ##NO_TEXT.
  data:
    gt_bp_address_faxno TYPE TABLE OF cvis_bp_address_faxno .
  constants GC_VALID_DATE_TO type BU_VALID_TO_DATS value '99991231' ##NO_TEXT.
  constants GC_BP_CATEGORY type BU_TYPE value '2' ##NO_TEXT.
  data GT_CUSTOMER_CONTACTS type CVIS_CUSTOMER_CONTACTS_T .
  constants GC_APPL_OBJECT type BALOBJ_D value 'ZOPS' ##NO_TEXT.
  constants GC_APPL_SOBJECT type BALSUBOBJ value 'MASS_SITE' ##NO_TEXT.
  constants GC_ALMODE type BALMODE value 'B' ##NO_TEXT.
  constants GC_ALSTATE type ALSTATE value '3' ##NO_TEXT.
  constants GC_DESTINATION type CHAR4 value 'NONE' ##NO_TEXT.
  constants GC_OBJECTTABLE type TABELLE value 'BETR' ##NO_TEXT.
  constants GC_BP_RELATIONSHIP type XFELD value 'R' ##NO_TEXT.
  constants GC_NAME1_F type LVC_FNAME value 'NAME1' ##NO_TEXT.
  constants GC_WERKS_F type LVC_FNAME value 'WERKS' ##NO_TEXT.
  constants GC_STATUS_F type LVC_FNAME value 'STATUS' ##NO_TEXT.
  constants GC_MSGID_F type LVC_FNAME value 'MSGID' ##NO_TEXT.

  methods MAP_CLASSIFICATION_DATA
    importing
      !IT_DATA type SOI_GENERIC_TABLE optional
    exporting
      !ET_CLASSF_DATA type GTT_CLASS_D
    exceptions
      NO_VALID_DATA_FOUND .
  methods MAP_RELATIONSHIP_TYPES
    importing
      !IT_DATA type SOI_GENERIC_TABLE
    exporting
      !ET_CLASSF_DATA type GTT_CLASS_D .
  methods START_BAPI_PROCESS
    importing
      !IV_SITE_PROF type BETRP optional
      !IV_BACKGROUND type XFELD optional
      !IT_CLASSF_DATA type GTT_CLASS_D .
  methods MAP_GENERAL_DATA_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE
      !IV_SITE_PROF type REF_WKFIL optional .
  methods MAP_GENERAL_TEXT_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods MAP_SALES_DATA_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE
    exporting
      !ET_CUSTOMER_SALES type CVIS_CUSTOMER_SALES_T .
  methods MAP_SALES_PARTNER_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods MAP_SALES_TEXTS_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods MAP_COMPANY_CODE_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods MAP_COMPANY_TEXT_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods MAP_BANK_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods MAP_INDUSTRIES_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods MAP_DUNNING_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods MAP_TAX_CLASSIFICATION_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods MAP_TAX_NUMBERS_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods MAP_IDENTIFICATION_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods MAP_VENDOR_COMPANY_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods MAP_VENDOR_WITHHOLDING_TAX_SHT
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods MAP_VENDOR_COMPANY_TEXT_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods MAP_PURCHASING_DATA_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods MAP_VENDOR_PARTNER_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods MAP_PURCHASING_TEXT_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods MAP_SITE_DATA_SHEET
    importing
      !IT_DATA type SOI_GENERIC_TABLE .
  methods CHANGE_LOG .
ENDCLASS.



CLASS ZCL_OPS_MASS_SITE_CREATION IMPLEMENTATION.


  METHOD authority_check.
* Authority Check for User at Company Code level

  CONSTANTS:
   lc_auth_obj TYPE char10 VALUE 'ZOPS_BUKRS',
   lc_one      TYPE char2  VALUE '01',
   lc_two      TYPE char2  VALUE '02',
   lc_comp     TYPE char5  VALUE 'BUKRS',
   lc_action   TYPE char5  VALUE 'ACTVT'.

  IF iv_bukrs IS NOT INITIAL.
    AUTHORITY-CHECK OBJECT lc_auth_obj
      ID lc_comp FIELD iv_bukrs
      ID lc_action  FIELD lc_one
      ID lc_action  FIELD lc_two.
    IF sy-subrc <> 0.
      MESSAGE s049(zops) WITH iv_bukrs DISPLAY LIKE gc_msg_type_e.
      ev_vim_abort_saving = abap_true.
      EXIT.
    ENDIF.
  ENDIF.

  ENDMETHOD.


  METHOD change_log.
*&-------------------------------------------------------------------------------------------*
*&                  Header Log                                                               *                          *
*&-------------------------------------------------------------------------------------------*
*& Program/Class : Class ZCL_OPS_MASS_SITE_CREATION                                          *
*& Author      : Shyamkiran Nimbalpudi                                                       *
*& Created     : 16.09.2018 (DD.MM.YYYY)                                                     *
*& Reference   : OPS_MD_E_002 : Mass Site Creation                                           *
*& Transport Request : SD2K900117                                                            *
*&-------------------------------------------------------------------------------------------*

* Method 1 : CREATE_INBOUND_QUEUE           Instance Method Public
    "Create Inbound RFC
* Method 2 : FETCH_CLASSIFICATION_DATA      Instance Method Public
    "Get classification data
* Method 3 : PREPARE_DATA_CREATE_CLASSIFICA Instance Method Public
    "Create Classification Data
* Method 4 : PREPARE_DATA_CREATE_BP         Instance Method Public
    "Create Data & Creaet BP(Business Partner Creation)
* Method 5 : PREPARE_DATA_CREATE_SITE       Instance Method Public
    "Prepare Data  & Create Site(Site Creation)
* Method 6 : UPLOAD_FILE                    Instance Method Public
    "File Upload for BP & Site
* Method 7 : GET_EXCEL_DATA                 Instance Method Public
    "Get Excel Data for BP & Site
* Method 8 : VALIDATION_FOR_BP_CREATE       Instance Method Public
    "Validation for BP Create
* Method 9 : VALIDATION_FOR_SITE_CREATE     Instance Method Public
    "Validation for Site Create
* Method 10 :DISPLAY_LOG                    Instance Method Public
    "Report Message Output Logs
* Method 11 : SAVE_APPL_LOG                 Instance Method Public
    "Save Application Log
* Method 13 :SAVE_DATA_TO_APP_SERVER        Instance Method Private
    "Write Data to Application Server
* Method 14 : READ_DATA_FROM_APP_SERVER     Instance Method Private
    "Read Data from Application Server
* Method 15 : INTERNAL_DATE_CONVERSION      Instance Method Private
    "Conversion: External to internal date
* Method 16 :MAP_CLASSIFICATION_DATA        Instance Method Private
    "Map Classification Data
* Method 17 :MAP_RELATIONSHIP_TYPES         Instance Method Private
    "Map Relationship Types
* Method 18 :START_BAPI_PROCESS             Instance Method Private
    "Start BAPI process
* Method 19 :MAP_GENERAL_DATA_SHEET         Instance Method Private
    "General Data
* Method 20 :MAP_GENERAL_TEXT_SHEET         Instance Method Private
    "General Text
* Method 21 :MAP_SALES_DATA_SHEET           Instance Method Private
    "Sales Data
* Method 22 :MAP_SALES_PARTNER_SHEET        Instance Method Private
    "Sales Partner
* Method 23 :MAP_SALES_TEXTS_SHEET          Instance Method Private
    "Sales Texts
* Method 24 :MAP_COMPANY_CODE_SHEET         Instance Method Private
    "Company Code
* Method 25 :MAP_COMPANY_TEXT_SHEET         Instance Method Private
    "Company Text
* Method 26 :MAP_BANK_SHEET                 Instance Method Private
    "Bank Details
* Method 27 :MAP_INDUSTRIES_SHEET           Instance Method Private
    "Industries Details
* Method 28 :MAP_DUNNING_SHEET              Instance Method Private
    "Dunning Details
* Method 29 :MAP_TAX_CLASSIFICATION_SHEET   Instance Method Private
    "Tax Classification
* Method 30 :MAP_TAX_NUMBERS_SHEET          Instance Method Private
    "Tax Numbers
* Method 31 :MAP_IDENTIFICATION_SHEET       Instance Method Private
    "Identification Details
* Method 32 :MAP_VENDOR_COMPANY_SHEET       Instance Method Private
    "Vendor Company Details
* Method 33 :MAP_VENDOR_WITHHOLDING_TAX_SHT Instance Method Private
    "Vendor with Holding Tax
* Method 34 :MAP_VENDOR_COMPANY_TEXT_SHEET  Instance Method Private
    "Vendor Company Text
* Method 35 :MAP_PURCHASING_DATA_SHEET      Instance Method Private
    "Purchasing Data
* Method 36 :MAP_VENDOR_PARTNER_SHEET       Instance Method Private
    "Vendor Partner
* Method 37 :MAP_PURCHASING_TEXT_SHEET      Instance Method Private
    "Purchasing Text
* Method 38 :MAP_SITE_DATA_SHEET            Instance Method Private
    "Site Data Mapping to final structure
* Method 39 :PREPARE_LOG_DATA               Instance Method Private
    "Handle Aplplication Log
* Method 40: AUTHORITY_CHECK                Static Method Public
*           : Authority check at Company Code Level
* Method 41 :CHANGE_LOG	Instance Method	Public
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


  METHOD create_inbound_queue.
*&---------------------------------------------------------------------*
*& Method     : CREATE_INBOUND_QUEUE                                   *
*& Description:1.This method will be creating an inbound queue for -   *
*& Background Task Processing.                                         *
*& 2.Create Queue And Export To EV_NAME                                *
*&---------------------------------------------------------------------*
    DATA:lv_queue_name    TYPE trfcqout-qname. "queue name variable

*--->Queue Name
      lv_queue_name = |{ iv_site_bp }{ sy-datum }{ sy-uzeit }|.

*--->Create An Inboud Queue By Passing Created Queue Name
    CALL FUNCTION 'TRFC_SET_QIN_PROPERTIES'
      EXPORTING
        qout_name          = lv_queue_name
        qin_name           = lv_queue_name
      EXCEPTIONS
        invalid_queue_name = 1
        OTHERS             = 2.
    IF sy-subrc EQ 0.
      ev_name = lv_queue_name.
    ENDIF.

  ENDMETHOD.


  METHOD display_log.
*&---------------------------------------------------------------------*
*& Method     : DISPLAY_LOG                                            *
*& Description: Method Will Display Logs In The Report Output          *
*&---------------------------------------------------------------------*
*--->Data Declaration
    DATA:
      lo_table   TYPE REF TO cl_salv_table,
      lo_columns TYPE REF TO cl_salv_columns_table,
      lo_column  TYPE REF TO cl_salv_column,
      lt_message TYPE TABLE OF gty_message.

    IF gt_message IS NOT INITIAL.
*--->Delet If Any Blank Records Added Into lt_message
      DELETE gt_message WHERE werks IS INITIAL.
      lt_message[] = gt_message[].
    ENDIF.
*--->If Relationship Type Data Then Set flag and skip site creation logs
*Handle logic accordingly and process
    IF gt_message IS INITIAL.
      MESSAGE i034.
      RETURN.
    ENDIF.

    TRY.
*--->Method To Display Output
        CALL METHOD cl_salv_table=>factory
          EXPORTING
            list_display = if_salv_c_bool_sap=>false
          IMPORTING
            r_salv_table = lo_table
          CHANGING
            t_table      = gt_return."lt_message.
      CATCH cx_salv_msg.                                "#EC NO_HANDLER
        "Do nothing
    ENDTRY.

    lo_columns = lo_table->get_columns( ).
    lo_columns->set_optimize( ).

    TRY.
*--->To Hide The Column
        lo_column = lo_columns->get_column( gc_name1_f ).
        lo_column->set_visible( if_salv_c_bool_sap=>false ).

        lo_column = lo_columns->get_column( gc_msgid_f ).
        lo_column->set_visible( if_salv_c_bool_sap=>false ).
      CATCH cx_salv_not_found.                          "#EC NO_HANDLER
        "Do nothing
    ENDTRY.

    TRY.
*--->To Give Column Heading
        lo_column = lo_columns->get_column( gc_werks_f ).
        lo_column->set_long_text( TEXT-008 ).

        lo_column = lo_columns->get_column( gc_status_f ).
        lo_column->set_long_text( TEXT-007 ).

      CATCH cx_salv_not_found.                          "#EC NO_HANDLER
        "Do nothing
    ENDTRY.

*--->Display Table With Messages
    CALL METHOD lo_table->display.

  ENDMETHOD.


  METHOD fetch_classification_data.
*&---------------------------------------------------------------------*
*& Method     : FETCH_CLASSIFICATION_DATA                              *
*& Description: Fetch Required Classification Data from DB and Use-    *
*& LV_OBJ_CLASS and Feed FM-CLMA_CLASS_READ and get the for further-   *
*& processing To Create Classification                                 *
*&---------------------------------------------------------------------*
*--->Check If The Refere Site
    IF me->gv_ref_site IS NOT INITIAL.

      SELECT  clint INTO @DATA(lv_obj_class) FROM kssk UP TO 1 ROWS
        WHERE objek = @me->gv_ref_site
        AND klart = @gc_classtype.
      ENDSELECT.

      IF sy-subrc = 0.
*--->Get The Classification Details From The FM
        CALL FUNCTION 'CLMA_CLASS_READ'
          EXPORTING
            classnumber     = lv_obj_class
            language        = sy-langu
            buffer          = ' '
          IMPORTING
            classname       = es_classf_data-class_name
            classtype       = es_classf_data-klart
            description     = es_classf_data-klschl
            language        = es_classf_data-spras
          EXCEPTIONS
            class_not_found = 1
            OTHERS          = 2.
        IF sy-subrc <> 0.
          MESSAGE e038 WITH lv_obj_class sy-langu.
        ENDIF.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD get_excel_data.
*&---------------------------------------------------------------------*
*& Method     :  GET_EXCEL_DATA                                        *
*& Description: Excel File Data Mapping Mapping Into Internal Tables   *
*&---------------------------------------------------------------------*

    CLEAR : et_relship_data.
    DATA:
      lo_container    TYPE REF TO cl_gui_custom_container,
      lo_control      TYPE REF TO i_oi_container_control,
      lo_document     TYPE REF TO i_oi_document_proxy,
      lo_spreadsheet  TYPE REF TO i_oi_spreadsheet,
      lo_error        TYPE REF TO i_oi_error,
      lv_retcode      TYPE soi_ret_string,
      lv_document_url TYPE c LENGTH 256,
      lt_data         TYPE soi_generic_table,
      lt_ranges       TYPE soi_range_list,
*--->File Related Parameters
      lt_range        TYPE soi_dimension_table,
      ls_range        TYPE soi_dimension_item,
      lt_sheets       TYPE soi_sheets_table.

    FIELD-SYMBOLS : <lfs_sheets_tab> TYPE soi_sheets_table.

    IF <lfs_sheets_tab>  IS NOT ASSIGNED.
      ASSIGN lt_sheets TO <lfs_sheets_tab> .
    ENDIF.

*--->Initialize And Create Container
    CALL METHOD c_oi_container_control_creator=>get_container_control
      IMPORTING
        control = lo_control
        error   = lo_error.
    IF lo_error->has_failed = abap_true.
      CALL METHOD lo_error->raise_message
        EXPORTING
          type = gc_msg_type_e.
    ENDIF.

*--->Create Object reference for Custom container
    CREATE OBJECT lo_container
      EXPORTING
        container_name              = gc_cont
      EXCEPTIONS
        cntl_error                  = 1
        cntl_system_error           = 2
        create_error                = 3
        lifetime_error              = 4
        lifetime_dynpro_dynpro_link = 5
        OTHERS                      = 6.
    IF sy-subrc <> 0.
      MESSAGE TEXT-004 TYPE gc_msg_type_e.
    ENDIF.

    CALL METHOD lo_control->init_control
      EXPORTING
        r3_application_name      = gc_app_name
        inplace_enabled          = abap_true
        inplace_scroll_documents = abap_true
        parent                   = lo_container
        register_on_close_event  = abap_true
        register_on_custom_event = abap_true
        no_flush                 = abap_true
      IMPORTING
        error                    = lo_error
      EXCEPTIONS
        javabeannotsupported     = 1
        OTHERS                   = 2.

    IF sy-subrc NE 0 OR lo_error->has_failed = abap_true.
      CALL METHOD lo_error->raise_message
        EXPORTING
          type = gc_msg_type_e.
    ENDIF.

    CALL METHOD lo_control->get_document_proxy
      EXPORTING
        document_type  = soi_doctype_excel_sheet
      IMPORTING
        document_proxy = lo_document
        error          = lo_error.
    IF lo_error->has_failed = gc_has_flag_x.
      CALL METHOD lo_error->raise_message
        EXPORTING
          type = gc_msg_type_e.
    ENDIF.

*--->Start Data Selection From Excel File
    lv_document_url =  |{ gc_file }{ iv_f_path }|.

    CALL METHOD lo_document->open_document
      EXPORTING
        document_title = gc_doc_title
        document_url   = lv_document_url
        open_inplace   = gc_has_flag_x
      IMPORTING
        error          = lo_error.
    IF lo_error->has_failed = gc_has_flag_x.
      CALL METHOD lo_error->raise_message
        EXPORTING
          type = gc_msg_type_i.
      LEAVE LIST-PROCESSING.
    ENDIF.

    CALL METHOD lo_document->get_spreadsheet_interface
      EXPORTING
        no_flush        = ' '
      IMPORTING
        error           = lo_error
        sheet_interface = lo_spreadsheet.

    IF lo_error->has_failed = gc_has_flag_x.
      CALL METHOD lo_error->raise_message
        EXPORTING
          type = gc_msg_type_i.
      LEAVE LIST-PROCESSING.
    ENDIF.

    CALL METHOD lo_spreadsheet->get_sheets
      EXPORTING
        no_flush = ' '
      IMPORTING
        sheets   = <lfs_sheets_tab>
        error    = lo_error.
    IF lo_error->has_failed = gc_has_flag_x.
      CALL METHOD lo_error->raise_message
        EXPORTING
          type = gc_msg_type_i.
      LEAVE LIST-PROCESSING.
    ENDIF.

    ls_range-row     = 6.
    ls_range-column  = 1.
    ls_range-rows    = gc_rows.
    ls_range-columns = gc_cols.
    APPEND ls_range TO lt_range.

*--->Handle Sheets With Data
    IF <lfs_sheets_tab>  IS ASSIGNED.
      LOOP AT <lfs_sheets_tab>  ASSIGNING FIELD-SYMBOL(<lfs_sheets>).
        IF <lfs_sheets_tab>  IS ASSIGNED.
          CALL METHOD lo_spreadsheet->select_sheet
            EXPORTING
              name  = <lfs_sheets>-sheet_name
            IMPORTING
              error = lo_error.
          IF lo_error->has_failed = gc_has_flag_x.
            CONTINUE.
          ENDIF.
          CALL METHOD lo_spreadsheet->set_selection
            EXPORTING
              top     = 1 "1"1 "4
              left    = 1
              rows    = gc_rows
              columns = gc_cols.

          CALL METHOD lo_spreadsheet->insert_range
            EXPORTING
              name     = gc_doc_title "Range Name
              rows     = gc_rows
              columns  = gc_cols
              no_flush = ''
            IMPORTING
              error    = lo_error.
          IF lo_error->has_failed = gc_has_flag_x.
            EXIT.
          ENDIF.

          REFRESH lt_data.

          CALL METHOD lo_spreadsheet->get_ranges_data
            EXPORTING
              rangesdef = lt_range
            IMPORTING
              contents  = lt_data
              error     = lo_error
              retcode   = lv_retcode
            CHANGING
              ranges    = lt_ranges.
          IF lt_data IS NOT INITIAL. " Check LT_DATA and Delete Empty Entries
            DELETE lt_data WHERE value IS INITIAL OR value = space.
          ELSE.
            CONTINUE.
          ENDIF.
*--->Start file processing
          IF iv_flag IS INITIAL. " Business Partner(BP) Data
            IF lt_data IS NOT INITIAL.
              CASE <lfs_sheets>-sheet_name. "Sheet Name
                WHEN gc_sheet_1_gd. "'General data'.
                  me->map_general_data_sheet(
                 EXPORTING
                   it_data              = lt_data
                   iv_site_prof         = iv_site_prof ).
                WHEN gc_sheet_2_gt. "'General text'
                  me->map_general_text_sheet( it_data = lt_data ).
                WHEN gc_sheet_3_sd. "'Sales data'
                  me->map_sales_data_sheet( it_data = lt_data ).
                WHEN  gc_sheet_4_sp."'Sales partner'
                  me->map_sales_partner_sheet( it_data = lt_data ).
                WHEN gc_sheet_5_st."'Sales texts'
                  me->map_sales_texts_sheet( it_data = lt_data ).
                WHEN gc_sheet_6_cc."'Company code'.
                  me->map_company_code_sheet( it_data = lt_data ).
                WHEN gc_sheet_7_ct."'Company text'.
                  me->map_company_text_sheet( it_data = lt_data ).
                WHEN gc_sheet_8_b ."'Bank'.
                  me->map_bank_sheet( it_data = lt_data ).
                WHEN gc_sheet_9_i."'Industries'.
                  me->map_industries_sheet( it_data = lt_data ).
                WHEN gc_sheet_10_d ."'Dunning '.
* Dunning data is repeated in COMPANY CODE sheet and DUNNING sheet, Hence Mailed Sujith for clarification
* and it's confirmed that Dunning sheet is no more required in the input file
* and it will be removed from FS as past FAT defect
*                  me->map_dunning_sheet( it_data = lt_data ).
                WHEN gc_sheet_11_tc. "'Tax classification'.
                  me->map_tax_classification_sheet( it_data = lt_data ).
                WHEN gc_sheet_12_tns. "'Tax numbers'.
                  me->map_tax_numbers_sheet( it_data = lt_data ).
                WHEN gc_sheet_13_id. "Idenfication.
                  me->map_identification_sheet( it_data = lt_data ).
                WHEN gc_sheet_14_vc. "  'Vendor Company'.
                  me->map_vendor_company_sheet( it_data = lt_data ).
                WHEN gc_sheet_15_vwt. "'Vendor witholding tax '.
                  me->map_vendor_withholding_tax_sht( it_data = lt_data ).
                WHEN gc_sheet_16_vct. "'Vendor company text'.
                  me->map_vendor_company_text_sheet( it_data = lt_data ).
                WHEN gc_sheet_17_pd. "'Purchasing data'.
                  me->map_purchasing_data_sheet( it_data = lt_data ).
                WHEN gc_sheet_18_vp. "'Vendor partner'.
                  me->map_vendor_partner_sheet( it_data = lt_data ).
                WHEN gc_sheet_19_pt. "'Purchasing text'.
                  me->map_purchasing_text_sheet( it_data = lt_data ).
                WHEN OTHERS.
              ENDCASE.
            ENDIF.
          ENDIF.
          IF iv_flag IS NOT INITIAL.
            CASE iv_flag.
              WHEN gc_has_flag_x. "Site Data Into Internal Table
                me->map_site_data_sheet( it_data = lt_data ).
                gv_app_flag = gc_has_flag_x.
              WHEN gc_has_flag_y."Map Classification Data Into Internal Table
                me->map_classification_data(
                  EXPORTING
                    it_data             = lt_data
                  IMPORTING
                    et_classf_data      = DATA(lt_classf_data)
                  EXCEPTIONS
                    no_valid_data_found = 1
                    OTHERS              = 2 ).
                IF sy-subrc = 0.
                  gv_app_flag = gc_has_flag_y.
                ENDIF.
              WHEN OTHERS.
            ENDCASE.
          ENDIF.
*--->Business Partner Relationship Excel Data Mapping
          IF iv_flag = gc_bp_relationship. " BP Relationship Data Update
            IF go_bp_reltyp IS NOT BOUND.
              go_bp_reltyp = NEW #( ).
              go_bp_reltyp->gv_ref_site = me->gv_ref_site.
            ENDIF.
            IF go_bp_reltyp IS BOUND. " Map Data Into Internal Table
              go_bp_reltyp->map_relationship_types(
                EXPORTING
                  it_data             = lt_data
                IMPORTING
                  et_relship_data     = et_relship_data
                EXCEPTIONS
                  no_valid_data_found = 1
                  OTHERS              = 2 ).
              IF sy-subrc = 0.
                RETURN.
              ELSE.
                RAISE no_valid_data_found.
              ENDIF.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDLOOP.
      UNASSIGN: <lfs_sheets_tab> , <lfs_sheets>.
    ENDIF.
*--->Close The Opened File And Release It Further Use
    CALL METHOD lo_document->close_document
      IMPORTING
        error = lo_error.
    IF lo_error->has_failed = gc_has_flag_x.
      CALL METHOD lo_error->raise_message
        EXPORTING
          type = gc_msg_type_i.
      LEAVE LIST-PROCESSING.
    ENDIF.

    CALL METHOD lo_document->release_document
      IMPORTING
        error = lo_error.
    IF lo_error->has_failed = gc_has_flag_x.
      CALL METHOD lo_error->raise_message
        EXPORTING
          type = gc_msg_type_i.
      LEAVE LIST-PROCESSING.
    ENDIF.

*--->Start BAPI process For All The Applications
    IF iv_site_prof IS NOT INITIAL.
      start_bapi_process(
        EXPORTING
          iv_site_prof   = iv_site_prof
          iv_background  = iv_background
          it_classf_data = lt_classf_data ).
    ENDIF.

  ENDMETHOD.


  METHOD map_bank_sheet.
*&---------------------------------------------------------------------*
*& Method     :MAP_BANK_SHEET                                          *
*& Description: Bank Data mapping to SAP structures and internal tables*
*&                                                                     *
*&---------------------------------------------------------------------*
*--->Valid Sheet With Proper mapping
    CLEAR:gt_bp_bank_details.
    DATA: ls_bp_bank_details TYPE cvis_bp_bank_details,
          lv_key TYPE i.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      CASE <lfs_data>-column.
        WHEN 1.
          IF <lfs_data>-value IS NOT INITIAL. "Check and change to upper case
            DATA(lv_werks_t) = <lfs_data>-value.
            TRANSLATE lv_werks_t TO UPPER CASE.
            ls_bp_bank_details-run_id = lv_werks_t.
            CLEAR:lv_werks_t.
          ENDIF.
        WHEN 2.
          ls_bp_bank_details-bank_ctry = <lfs_data>-value.
        WHEN 3.
          ls_bp_bank_details-bank_key = <lfs_data>-value.
        WHEN 4.
          ls_bp_bank_details-bank_acct = <lfs_data>-value.
        WHEN 5.
          ls_bp_bank_details-iban = <lfs_data>-value.
        WHEN 6.
          ls_bp_bank_details-ctrl_key = <lfs_data>-value.
        WHEN 7.
          ls_bp_bank_details-accountholder = <lfs_data>-value.
        WHEN 8.
          "Account Name
          ls_bp_bank_details-bankaccountname = <lfs_data>-value.
        WHEN 9.
          ls_bp_bank_details-bank_ref = <lfs_data>-value.
        WHEN 10.
          ls_bp_bank_details-coll_auth = <lfs_data>-value.
        WHEN OTHERS.
      ENDCASE.
      AT END OF row.
        lv_key = lv_key + 1.
        ls_bp_bank_details-data_key = lv_key.
        APPEND :ls_bp_bank_details TO gt_bp_bank_details.
        CLEAR:ls_bp_bank_details.
      ENDAT.
    ENDLOOP.
      CLEAR lv_key.
  ENDMETHOD.


  METHOD map_classification_data.
*&---------------------------------------------------------------------*
*& Method     :MAP_CLASSIFICATION_DATA                                 *
*& Description: Fields And Data Mapping From The Excel Sheet           *
*&---------------------------------------------------------------------*
*2.Do validation like negative and positive validtions which we get from the excel sheet
*3.Check if any conversions require for the uploaded data
*4.Check whether provided data from the excel is proper or not
*5.Feed BAPI with all the proper/valid data set for all the structures and tables

    DATA : ls_data TYPE gty_class_d.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_cls_data>).
*
      CASE <lfs_cls_data>-column.
        WHEN 1."Check Site Value And Change To Uppercase
          IF <lfs_cls_data>-value IS NOT INITIAL.
            DATA(lv_object_t) = <lfs_cls_data>-value.
            TRANSLATE lv_object_t TO UPPER CASE.
            ls_data-object = lv_object_t.
            CLEAR:lv_object_t.
          ENDIF.
        WHEN 2."Class Name
          ls_data-atnam = <lfs_cls_data>-value.
        WHEN 3."Item number
          ls_data-atzis = <lfs_cls_data>-value.
        WHEN 4."Characteristic value
          ls_data-atwrt = <lfs_cls_data>-value.
        WHEN OTHERS.
      ENDCASE.

      AT END OF row.
        APPEND ls_data TO et_classf_data.
        CLEAR: ls_data.
      ENDAT.
    ENDLOOP.
*---Delete if key fields data missing
    SORT et_classf_data BY object.
    DELETE et_classf_data WHERE object IS INITIAL.

  ENDMETHOD.


  METHOD map_company_code_sheet.
*&---------------------------------------------------------------------*
*& Method     : MAP_COMPANY_CODE_SHEET                                 *
*& Description:1.Fields & Data Mapping From The Excel Sheet Into-      *
*& Internal Tables and Delete If any Duplicate Data Occurs             *
*& 2.FEW FIELDS YET TO CONFIRM FUNCTION FROM OWNERS(See Tempalte)      *
*&---------------------------------------------------------------------*
    DATA : ls_customer_company      TYPE cvis_customer_company,
           ls_customer_comp_dunning TYPE cvis_customer_comp_dunning.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).

      CASE <lfs_data>-column.
        WHEN 1.
          IF <lfs_data>-value IS NOT INITIAL.
            DATA(lv_werks_t) = <lfs_data>-value.
            TRANSLATE lv_werks_t TO UPPER CASE.
            ls_customer_company-run_id = lv_werks_t.
            ls_customer_comp_dunning-run_id = lv_werks_t.
            CLEAR:lv_werks_t.
          ENDIF.
        WHEN 2.
          ls_customer_company-bukrs = <lfs_data>-value.
          ls_customer_comp_dunning-bukrs = <lfs_data>-value.
        WHEN 3."Posting Block
          ls_customer_company-sperr = <lfs_data>-value.
        WHEN 4."Payment Block
          ls_customer_company-zahls = <lfs_data>-value.
        WHEN 5.
          ls_customer_company-altkn = <lfs_data>-value.
        WHEN 6.
          ls_customer_comp_dunning-mahna = <lfs_data>-value.
        WHEN 7.
          ls_customer_comp_dunning-mansp = <lfs_data>-value.
        WHEN 8.
          ls_customer_comp_dunning-knrma = <lfs_data>-value.
        WHEN 9.
            DATA(lv_year) = <lfs_data>-value+6(4).
            DATA(lv_month) = <lfs_data>-value+3(2).
            DATA(lv_day) = <lfs_data>-value+0(2).
            DATA(lv_newdate) = |{ lv_year }| && |{ lv_month }| &&  |{ lv_day } |.
          ls_customer_comp_dunning-madat = lv_newdate.
        WHEN 10.
          ls_customer_comp_dunning-gmvdt = <lfs_data>-value.
        WHEN 11.
          ls_customer_comp_dunning-mahns = <lfs_data>-value.
        WHEN 12.
          ls_customer_comp_dunning-busab = <lfs_data>-value.
        WHEN 13.
          ls_customer_company-busab = <lfs_data>-value.
        WHEN 14.
          ls_customer_company-zsabe = <lfs_data>-value.
        WHEN 15.
          ls_customer_company-tlfns  = <lfs_data>-value.
        WHEN 16.
          ls_customer_company-tlfxs  = <lfs_data>-value.
        WHEN 17.
          ls_customer_company-xdezv  = <lfs_data>-value.
        WHEN 18.
          ls_customer_company-kverm  = <lfs_data>-value.
        WHEN 19.
          ls_customer_company-perkz = <lfs_data>-value.
        WHEN 20.
          ls_customer_company-zterm = <lfs_data>-value.
        WHEN 21.
          ls_customer_company-zwels = <lfs_data>-value.
        WHEN 22.
          ls_customer_company-hbkid = <lfs_data>-value.
        WHEN 23.
          ls_customer_company-togru = <lfs_data>-value.
        WHEN 24.
          ls_customer_company-zahls = <lfs_data>-value.
        WHEN 25.
          ls_customer_company-xzver = <lfs_data>-value.
        WHEN 26.
          ls_customer_company-xpore = <lfs_data>-value.

        WHEN 27.
          ls_customer_company-xedip = <lfs_data>-value.
        WHEN 28.
          ls_customer_company-knrzb = <lfs_data>-value.
        WHEN 29.
*--->Call FM(Conversion Exit)
          IF <lfs_data>-value IS NOT INITIAL.
            CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
              EXPORTING
                input  = <lfs_data>-value
              IMPORTING
                output = ls_customer_company-akont.
          ENDIF.
        WHEN 30.
          ls_customer_company-knrze = <lfs_data>-value.
        WHEN 31.
          ls_customer_company-zuawa = <lfs_data>-value.
        WHEN 32.
          ls_customer_company-fdgrv = <lfs_data>-value.
        WHEN OTHERS.
      ENDCASE.

      AT END OF row.
        APPEND: ls_customer_company TO gt_customer_company.
        IF ls_customer_comp_dunning-mahna IS NOT INITIAL.
         APPEND ls_customer_comp_dunning  TO gt_customer_comp_dunning.
        ENDIF.
        CLEAR : ls_customer_company,ls_customer_comp_dunning.
      ENDAT.
    ENDLOOP.
  ENDMETHOD.


  METHOD map_company_text_sheet.
*&---------------------------------------------------------------------*
*& Method     : MAP_COMPANY_TEXT_SHEET                                 *
*& Description: Company code text data mapping                         *
*&---------------------------------------------------------------------*
    DATA : ls_customer_cc_texts TYPE cvis_customer_cc_texts.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      IF <lfs_data> IS ASSIGNED.
        CASE <lfs_data>-column.

          WHEN 1.
            IF <lfs_data>-value IS NOT INITIAL. "Check and change to upper case
              DATA(lv_werks_t) = <lfs_data>-value.
              TRANSLATE lv_werks_t TO UPPER CASE.
              ls_customer_cc_texts-run_id = lv_werks_t.
              CLEAR:lv_werks_t.
            ENDIF.
          WHEN 2.
            ls_customer_cc_texts-bukrs = <lfs_data>-value.
          WHEN 3.
            ls_customer_cc_texts-text_id = <lfs_data>-value.
          WHEN 4.
            ls_customer_cc_texts-langu = <lfs_data>-value.
          WHEN 5.
            ls_customer_cc_texts-tdline = <lfs_data>-value.
          WHEN OTHERS.
        ENDCASE.
      ENDIF.
      AT END OF row.
        APPEND: ls_customer_cc_texts TO gt_customer_cc_texts.
        CLEAR : ls_customer_cc_texts.
      ENDAT.
    ENDLOOP.
  ENDMETHOD.


  METHOD map_dunning_sheet.
*&---------------------------------------------------------------------*
*& Method     :MAP_DUNNING_SHEET                                       *
*& Description: Dunning Data                                           *
*&---------------------------------------------------------------------*
*--->Valid Sheet With Proper Mapping
*--->Fields Are Available In Other Sheet As Well Like Company Code
    DATA : ls_customer_comp_dunning TYPE cvis_customer_comp_dunning.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      IF <lfs_data> IS ASSIGNED.
        CASE <lfs_data>-column.
          WHEN 1.
            ls_customer_comp_dunning-run_id  = <lfs_data>-value.
          WHEN 2.
            ls_customer_comp_dunning-bukrs  = <lfs_data>-value.
          WHEN 3.
            ls_customer_comp_dunning-maber = <lfs_data>-value.
          WHEN 4.
            ls_customer_comp_dunning-mahna = <lfs_data>-value.
          WHEN 5.
            ls_customer_comp_dunning-mansp = <lfs_data>-value.
          WHEN 6.
            ls_customer_comp_dunning-mahns = <lfs_data>-value.
          WHEN OTHERS.
        ENDCASE.
      ENDIF.
      AT END OF row.
        IF ( ls_customer_comp_dunning-bukrs IS NOT INITIAL OR
             ls_customer_comp_dunning-maber IS NOT INITIAL OR
             ls_customer_comp_dunning-mahna IS NOT INITIAL OR
             ls_customer_comp_dunning-mansp IS NOT INITIAL OR
             ls_customer_comp_dunning-mahns IS NOT INITIAL ).
          APPEND: ls_customer_comp_dunning TO gt_customer_comp_dunning.
        ENDIF.
        CLEAR : ls_customer_comp_dunning.
      ENDAT.
    ENDLOOP.

  ENDMETHOD.


  METHOD map_general_data_sheet.
*&---------------------------------------------------------------------*
*& Method     : MAP_GENERAL_DATA_SHEET                                 *
*& Description:1.Fields & Data Mapping From The Excel Sheet Into-      *
*& Internal Tables and Delete If any Duplicate Data Occurs             *
*& 2.FEW FIELDS YET TO CONFIRM FUNCTION OWNERS                         *
*&---------------------------------------------------------------------*
    DATA: ls_bp_general            TYPE cvis_bp_general,
          lt_bp_general            TYPE TABLE OF cvis_bp_general,
          ls_customer_general      TYPE cvis_customer_general,
          ls_bp_address            TYPE cvis_bp_address,
          lt_bp_address            TYPE TABLE OF cvis_bp_address,
          ls_bp_address_teleno     TYPE cvis_bp_address_teleno,
          lt_bp_address_teleno     TYPE  TABLE OF cvis_bp_address_teleno,
          ls_bp_address_faxno      TYPE cvis_bp_address_faxno,
          lt_bp_address_faxno      TYPE TABLE OF cvis_bp_address_faxno,
          ls_bp_address_email      TYPE cvis_bp_address_email,
          lt_bp_address_email      TYPE TABLE OF cvis_bp_address_email,
          ls_sup_general           TYPE cvis_supplier_general,
          ls_sup_general_alt_payee TYPE cvis_supplier_alt_payee,
          ls_sup_company_alt_payee TYPE cvis_supplier_alt_payee,
          ls_customer_alt_payee    TYPE cvis_customer_alt_payee,
          ls_bp_address_uri        TYPE cvis_bp_address_url,
          ls_bp_roles              TYPE cvis_bp_role,
          lt_bp_roles_read         TYPE TABLE OF bapibus1006_bproles INITIAL SIZE 1,
          lv_ref_site              TYPE bu_partner,
          lt_return_roles          TYPE TABLE OF bapiret2,
          ls_bp_messages           TYPE site_status_sty.

    CONSTANTS:
          lc_web                   TYPE ad_uritype VALUE 'HPG'.

*--->Create(Try To Delete Before Coming To This Logic )
    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      IF <lfs_data> IS ASSIGNED.
        CASE <lfs_data>-column.
          WHEN 1."Site
            IF <lfs_data>-value IS NOT INITIAL. "Check and change to upper case
              DATA(lv_werks_t) = <lfs_data>-value.
              TRANSLATE lv_werks_t TO UPPER CASE.
              ls_bp_general-run_id = lv_werks_t.
              ls_customer_general-run_id = lv_werks_t.
              ls_bp_general-bpartner   = lv_werks_t. " Business Partner
              ls_customer_general-kunnr =  lv_werks_t.
              ls_sup_general-run_id = lv_werks_t.
              ls_bp_address-run_id = lv_werks_t.
              ls_bp_address_uri-run_id = lv_werks_t.
              ls_bp_address_teleno-run_id = lv_werks_t.
              ls_bp_address_email-run_id = lv_werks_t.
              ls_sup_general-lifnr = lv_werks_t.
              ls_bp_general-object_task = gc_msg_type_i.
              CLEAR:lv_werks_t.
            ENDIF.
          WHEN 2."Name
            ls_bp_general-name1 = <lfs_data>-value.
          WHEN 3.
            ls_bp_general-name2 = <lfs_data>-value.
          WHEN 4.
            ls_bp_general-name3 = <lfs_data>-value.
          WHEN 5.
            ls_bp_general-name4 = <lfs_data>-value.
          WHEN 6.
            ls_bp_general-title_key = <lfs_data>-value.
          WHEN 7."Search Term
            ls_bp_general-searchterm1 = <lfs_data>-value.
          WHEN 8.
            ls_bp_general-searchterm2 = <lfs_data>-value.
          WHEN 9.
*-- Sujit Confirmed that Supplier field will be removed from the FS as a defect later
            "mapped to both customer and supplier
            ls_customer_general-lifnr = <lfs_data>-value.
*            ls_sup_general-lifnr = <lfs_data>-value.
          WHEN 10."Group Key
            " mapped to both customer and supplier
            ls_customer_general-konzs = <lfs_data>-value.
            ls_sup_general-konzs  = <lfs_data>-value.
          WHEN 11. "Date Found
            DATA(lv_year) = <lfs_data>-value+6(4).
            DATA(lv_month) = <lfs_data>-value+3(2).
            DATA(lv_day) = <lfs_data>-value+0(2).
            DATA(lv_newdate) = |{ lv_year }| && |{ lv_month }| &&  |{ lv_day } |.
            ls_bp_general-foundationdate = lv_newdate.
          WHEN 12.
            "Trading Partner , mapped to both customer and supplier
            ls_customer_general-vbund = <lfs_data>-value.
            ls_sup_general-vbund = <lfs_data>-value.
          WHEN 13."Street
            ls_bp_address-street = <lfs_data>-value.
          WHEN 14."House number
            ls_bp_address-house_no = <lfs_data>-value.
          WHEN 15."district
            ls_bp_address-district = <lfs_data>-value.
          WHEN 16."City (different from postal city)
            ls_bp_address-home_city = <lfs_data>-value.
          WHEN 17." Postal code
            ls_bp_address-postl_cod1 = <lfs_data>-value.
          WHEN 18." City
            ls_bp_address-city = <lfs_data>-value.
          WHEN 19."Country
            ls_bp_address-country = <lfs_data>-value.
          WHEN 20.
            "State
            ls_bp_address-region = <lfs_data>-value.
          WHEN 21.
            ls_bp_address-building = <lfs_data>-value.
          WHEN 22.
            ls_bp_address-room_no = <lfs_data>-value.
          WHEN 23.
            ls_bp_address-floor = <lfs_data>-value.
          WHEN 24."C/O Name
            ls_bp_address-c_o_name = <lfs_data>-value.
          WHEN 25.
            "Street 2
            ls_bp_address-str_suppl1 = <lfs_data>-value.
          WHEN 26.
            "Street 3
            ls_bp_address-str_suppl2 = <lfs_data>-value.
          WHEN 27.
            "Street 4
            ls_bp_address-str_suppl3 = <lfs_data>-value.
          WHEN 28.
            "Street 5
            ls_bp_address-location = <lfs_data>-value.
          WHEN 29.
            ls_bp_address-po_box = <lfs_data>-value.
          WHEN 30. "Postal code
            ls_bp_address-postl_cod2 = <lfs_data>-value.
          WHEN 31."Company Postal Code (for Large Customers)
            ls_bp_address-postl_cod3 = <lfs_data>-value.
          WHEN 32."Language
            ls_bp_address-langu = <lfs_data>-value.

          WHEN 33.
            "Telephone(r_3_user it is one char1)
            IF <lfs_data>-value IS NOT INITIAL.
            ls_bp_address_teleno-run_id = lv_werks_t.
            ls_bp_address_teleno-country = ls_bp_address-country.
            ls_bp_address_teleno-telephone = <lfs_data>-value.
            ls_bp_address_teleno-tel_no = <lfs_data>-value.
            ls_bp_address_teleno-caller_no  = <lfs_data>-value.
            ls_bp_address_teleno-std_no = abap_true.
            ls_bp_address_teleno-r_3_user = 1.
            APPEND ls_bp_address_teleno TO gt_bp_address_teleno.
            CLEAR ls_bp_address_teleno.
            ENDIF.

          WHEN 34."Additional Telephone 2
            IF <lfs_data>-value IS NOT INITIAL.
            ls_bp_address_teleno-run_id = lv_werks_t.
            ls_bp_address_teleno-country = ls_bp_address-country.
*            ls_bp_address_teleno-extension = <lfs_data>-value. " Telephone 2 & 3 Should Be Decided
            ls_bp_address_teleno-telephone = <lfs_data>-value.
            ls_bp_address_teleno-tel_no = <lfs_data>-value.
            ls_bp_address_teleno-caller_no  = <lfs_data>-value.
            APPEND ls_bp_address_teleno TO gt_bp_address_teleno.
            CLEAR ls_bp_address_teleno.
            ENDIF.

          WHEN 35."Additional Telephone 3
            IF <lfs_data>-value IS NOT INITIAL.
            ls_bp_address_teleno-run_id = lv_werks_t.
            ls_bp_address_teleno-country = ls_bp_address-country.
            ls_bp_address_teleno-telephone = <lfs_data>-value.
            ls_bp_address_teleno-tel_no = <lfs_data>-value.
            ls_bp_address_teleno-caller_no  = <lfs_data>-value.
            APPEND ls_bp_address_teleno TO gt_bp_address_teleno.
            CLEAR ls_bp_address_teleno.
            ENDIF.

          WHEN 36."Mobile flag for mobile number
            IF <lfs_data>-value IS NOT INITIAL.
              ls_bp_address_teleno-run_id = lv_werks_t.
              ls_bp_address_teleno-country = ls_bp_address-country.
              ls_bp_address_teleno-telephone = <lfs_data>-value.
              ls_bp_address_teleno-tel_no = <lfs_data>-value.
              ls_bp_address_teleno-caller_no  = <lfs_data>-value.
              ls_bp_address_teleno-r_3_user = 3.
              APPEND ls_bp_address_teleno TO gt_bp_address_teleno.
              CLEAR ls_bp_address_teleno.
            ENDIF.

          WHEN 37."Additional Mobile 2
            IF <lfs_data>-value IS NOT INITIAL.
            ls_bp_address_teleno-run_id = lv_werks_t.
            ls_bp_address_teleno-country = ls_bp_address-country.
            ls_bp_address_teleno-telephone = <lfs_data>-value.
            ls_bp_address_teleno-tel_no = <lfs_data>-value.
            ls_bp_address_teleno-caller_no  = <lfs_data>-value.
            ls_bp_address_teleno-r_3_user = 2.
            APPEND ls_bp_address_teleno TO gt_bp_address_teleno.
            CLEAR ls_bp_address_teleno.
            ENDIF.

          WHEN 38. "Additional Mobile 3
            IF <lfs_data>-value IS NOT INITIAL.
            ls_bp_address_teleno-country = ls_bp_address-country.
            ls_bp_address_teleno-run_id = lv_werks_t.
            ls_bp_address_teleno-telephone = <lfs_data>-value.
            ls_bp_address_teleno-tel_no = <lfs_data>-value.
            ls_bp_address_teleno-caller_no  = <lfs_data>-value.
            ls_bp_address_teleno-r_3_user = 2.
            APPEND ls_bp_address_teleno TO gt_bp_address_teleno.
            CLEAR ls_bp_address_teleno.
            ENDIF.

          WHEN 39. "Fax ==Fields are fine " This should be checked y repeated fields given in the tempalte
            IF <lfs_data>-value IS NOT INITIAL.
            ls_bp_address_faxno-run_id = lv_werks_t.
            ls_bp_address_faxno-country = ls_bp_address-country.
            ls_bp_address_faxno-fax = <lfs_data>-value.
            ls_bp_address_faxno-fax_no = <lfs_data>-value.
            APPEND ls_bp_address_faxno TO gt_bp_address_faxno.
            CLEAR ls_bp_address_faxno.
            ENDIF.

          WHEN 40."Additional Fax 2
            IF <lfs_data>-value IS NOT INITIAL.
            ls_bp_address_faxno-run_id = lv_werks_t.
            ls_bp_address_faxno-country = ls_bp_address-country.
            ls_bp_address_faxno-fax = <lfs_data>-value.
            ls_bp_address_faxno-fax_no = <lfs_data>-value.
            APPEND ls_bp_address_faxno TO gt_bp_address_faxno.
              ENDIF.

          WHEN 41."Additional Fax 3
            IF <lfs_data>-value IS NOT INITIAL.
            ls_bp_address_faxno-run_id = lv_werks_t.
            ls_bp_address_faxno-country = ls_bp_address-country.
            ls_bp_address_faxno-fax = <lfs_data>-value.
            ls_bp_address_faxno-fax_no = <lfs_data>-value.
            APPEND ls_bp_address_faxno TO gt_bp_address_faxno.
            CLEAR ls_bp_address_faxno.
              ENDIF.
          WHEN 42."Additional Email
            IF <lfs_data>-value IS NOT INITIAL.
            ls_bp_address_email-run_id = lv_werks_t.
            ls_bp_address_email-e_mail = <lfs_data>-value.
            APPEND ls_bp_address_email TO gt_bp_address_email.
            CLEAR ls_bp_address_email.
            ENDIF.

          WHEN 43.
            IF <lfs_data>-value IS NOT INITIAL.
               ls_bp_address_email-run_id = lv_werks_t.
               ls_bp_address_email-e_mail = <lfs_data>-value.
               APPEND ls_bp_address_email TO gt_bp_address_email.
               CLEAR ls_bp_address_email.
              ENDIF.

          WHEN 44.
            IF <lfs_data>-value IS NOT INITIAL.
             ls_bp_address_email-run_id = lv_werks_t.
             ls_bp_address_email-e_mail = <lfs_data>-value.
             APPEND ls_bp_address_email TO gt_bp_address_email.
             CLEAR ls_bp_address_email.
            ENDIF.

          WHEN 45."Communication Type
            ls_bp_address-comm_type = <lfs_data>-value.
          WHEN 46."Web Site ADR12(URI_ADDR)
            IF  <lfs_data>-value IS NOT INITIAL.
             ls_bp_address_uri-uri = <lfs_data>-value.
             ls_bp_address_uri-uri_type = lc_web.
            ENDIF.
          WHEN 47."DME indicator
            ls_customer_general-dtams = <lfs_data>-value.
          WHEN 48."Instructuion Key
            ls_customer_general-dtaws = <lfs_data>-value.
          WHEN 49."Alternative Payer
            ls_customer_general-knrza = <lfs_data>-value.
          WHEN 50."Central Posting Block
            ls_customer_general-aufsd = <lfs_data>-value.
          WHEN 51."Site band calssification "Some validaton
            IF <lfs_data>-value IS NOT INITIAL.
              ls_customer_general-katr1 = <lfs_data>-value.
            ENDIF.
          WHEN 52."POS type
            ls_customer_general-katr2 = <lfs_data>-value.
          WHEN 53."Inventory model
            ls_customer_general-katr3 = <lfs_data>-value.
          WHEN 54."Site Type
            ls_customer_general-katr4 = <lfs_data>-value.
          WHEN 55."Matrix Go Live Status/Go live status
            ls_customer_general-katr5 = <lfs_data>-value.
        ENDCASE.

        AT END OF row.
          ls_bp_general-category = gc_bp_category.
          ls_bp_general-grouping = me->gv_bp_group.

          APPEND :
                  ls_bp_general        TO gt_bp_general,
                  ls_bp_address        TO gt_bp_address,
                  ls_customer_general  TO gt_customer_general,
                  ls_sup_general       TO gt_supplier_general.
        IF ls_bp_address_uri-uri IS NOT INITIAL.
         APPEND ls_bp_address_uri    TO gt_bp_address_uri.
        ENDIF.

          CLEAR: ls_bp_general,ls_bp_address,ls_customer_general,ls_sup_general,
                 ls_bp_address_teleno,ls_bp_address_uri,ls_bp_address_email,
                 ls_bp_address_faxno,ls_bp_address_uri,ls_sup_general.
        ENDAT.
      ENDIF.
    ENDLOOP.
*--->Get BP Roles For The BP Groping
    "Validating  Reference Site In The Selection Screen As Well
    IF me->gv_ref_site IS NOT INITIAL.
      lv_ref_site = me->gv_ref_site.
      CALL FUNCTION 'BAPI_BUPA_ROLES_GET_2'
        EXPORTING
          businesspartner      = lv_ref_site
          validdate            = sy-datlo
        TABLES
          businesspartnerroles = lt_bp_roles_read
          return               = lt_return_roles.

      IF lt_bp_roles_read IS NOT INITIAL.
        "Need To Raise An Exemption As We Can Not Avoid
        LOOP AT gt_bp_general ASSIGNING FIELD-SYMBOL(<lfs_bp_general>).
          LOOP AT lt_bp_roles_read ASSIGNING FIELD-SYMBOL(<lfs_bp_roles_read>).
            ls_bp_roles-run_id =  <lfs_bp_general>-bpartner.
            ls_bp_roles-data_key = <lfs_bp_roles_read>-partnerrole.
            ls_bp_roles-rolecategory = <lfs_bp_roles_read>-partnerrolecategory.
            ls_bp_roles-valid_to = gc_valid_date_to.
            APPEND ls_bp_roles TO gt_bp_roles.
            CLEAR ls_bp_roles.
          ENDLOOP.
        ENDLOOP.
      ENDIF.
    ELSE.
      LOOP AT lt_return_roles ASSIGNING FIELD-SYMBOL(<lfs_roles>)
                              WHERE type =  gc_msg_type_e.
        IF sy-subrc = 0 AND <lfs_roles> IS ASSIGNED.
          CALL FUNCTION 'MESSAGE_TEXT_BUILD'
            EXPORTING
              msgid               = <lfs_roles>-id " ZOPS
              msgnr               = <lfs_roles>-number
              msgv1               = <lfs_roles>-message
            IMPORTING
              message_text_output = ls_bp_messages-message.
          INSERT ls_bp_messages INTO TABLE gt_message.
          CLEAR:ls_bp_messages .
          EXIT.
        ENDIF.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.


  METHOD map_general_text_sheet.
*&---------------------------------------------------------------------*
*& Method     :MAP_GENERAL_TEXT_SHEET                                  *
*& Description: General data text mapping                              *
*&---------------------------------------------------------------------*
    DATA : ls_customer_gen_texts TYPE cvis_customer_gen_texts.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      CASE <lfs_data>-column.
        WHEN 1.
          ls_customer_gen_texts-run_id = <lfs_data>-value.
        WHEN 2.
          ls_customer_gen_texts-text_id = <lfs_data>-value.
        WHEN 3.
          ls_customer_gen_texts-langu = <lfs_data>-value.
        WHEN 4.
          ls_customer_gen_texts-tdline = <lfs_data>-value.
        WHEN OTHERS.
      ENDCASE.
      AT END OF row.
        APPEND:
                ls_customer_gen_texts TO gt_customer_gen_texts.
        CLEAR : ls_customer_gen_texts.
      ENDAT.
    ENDLOOP.
  ENDMETHOD.


  METHOD map_identification_sheet.
*&---------------------------------------------------------------------*
*& Method     : MAP_IDENTIFICATION_SHEET                               *
*& Description:Identification Data Mapping                             *
*&---------------------------------------------------------------------*
*--->Valid Sheet With Proper Mapping
    CLEAR:gt_bp_ident_numbers.
    DATA : ls_bp_ident_numbers TYPE cvis_bp_ident_numbers.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      IF <lfs_data> IS ASSIGNED.
        CASE <lfs_data>-column.
          WHEN 1.
            IF <lfs_data>-value IS NOT INITIAL.
              DATA(lv_werks_t) = <lfs_data>-value.
              TRANSLATE lv_werks_t TO UPPER CASE.
              ls_bp_ident_numbers-run_id = lv_werks_t.
              CLEAR:lv_werks_t.
            ENDIF.
          WHEN 2.
            "Identification Type
            ls_bp_ident_numbers-identificationcategory = <lfs_data>-value.
          WHEN 3.
            ls_bp_ident_numbers-identificationnumber = <lfs_data>-value.
        WHEN OTHERS.
        ENDCASE.
      ENDIF.
      AT END OF row.
        APPEND: ls_bp_ident_numbers  TO gt_bp_ident_numbers.
        CLEAR : ls_bp_ident_numbers .
      ENDAT.
    ENDLOOP.
  ENDMETHOD.


  METHOD map_industries_sheet.
*&---------------------------------------------------------------------*
*& Method     :  MAP_INDUSTRIES_SHEET                                  *
*& Description:Industries Data Mapping                                 *
*&---------------------------------------------------------------------*
*--->Valid Sheet With Proper mapping
    CLEAR:gt_bp_industry.
    DATA:ls_bp_industry TYPE cvis_bp_industry.
    CONSTANTS: lc_key TYPE bu_istype VALUE '0001'.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      CASE <lfs_data>-column.
        WHEN 1.
          IF <lfs_data>-value IS NOT INITIAL. "Check and change to upper case
            DATA(lv_werks_t) = <lfs_data>-value.
            TRANSLATE lv_werks_t TO UPPER CASE.
            ls_bp_industry-run_id = lv_werks_t.
            CLEAR:lv_werks_t.
          ENDIF.
        WHEN 2.
          ls_bp_industry-ind_sector   = <lfs_data>-value.
        WHEN 3.
          ls_bp_industry-ind_default = <lfs_data>-value.
        WHEN OTHERS.
      ENDCASE.
      AT END OF row.
        ls_bp_industry-keysystem = lc_key.
        APPEND ls_bp_industry TO gt_bp_industry.
        CLEAR: ls_bp_industry.
      ENDAT.
    ENDLOOP.
  ENDMETHOD.


  METHOD map_purchasing_data_sheet.
*&---------------------------------------------------------------------*
*& Method     :  MAP_PURCHASING_DATA_SHEET                             *
*& Description: Fields & Data Mapping From The Excel Sheet Into-       *
*& Internal Table                                                      *
*& Supplier Data Was Not Updating , Need To Check Again                *                                                  *
*&---------------------------------------------------------------------*
    DATA:
      ls_sup_purchasing  TYPE cvis_supplier_purchasing,
      ls_sup_purchasing2 TYPE cvis_supplier_purchasing2.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      CASE <lfs_data>-column.
        WHEN 1.
          ls_sup_purchasing-run_id = <lfs_data>-value.

        WHEN 2.
          ls_sup_purchasing-ekorg  = <lfs_data>-value.

        WHEN 3.
          ls_sup_purchasing-ekgrp = <lfs_data>-value.

        WHEN 4.
          ls_sup_purchasing-waers = <lfs_data>-value.
          ls_sup_purchasing2-waers = <lfs_data>-value.

        WHEN 5.
          ls_sup_purchasing-telf1 = <lfs_data>-value.

        WHEN 6.
          ls_sup_purchasing-minbw = <lfs_data>-value.
        WHEN 7.
          ls_sup_purchasing-zterm = <lfs_data>-value.
        WHEN 8.
          ls_sup_purchasing-incov = <lfs_data>-value.
        WHEN 9.
          ls_sup_purchasing-inco1 = <lfs_data>-value.
        WHEN 10.
          ls_sup_purchasing-inco2_l = <lfs_data>-value.
        WHEN 11.
          ls_sup_purchasing-inco3_l = <lfs_data>-value.
        WHEN 12.
          ls_sup_purchasing-kalsk = <lfs_data>-value.
        WHEN 13.
          IF <lfs_data>-value IS NOT INITIAL.
            DATA(lv_year) = <lfs_data>-value+6(4).
            DATA(lv_month) = <lfs_data>-value+3(2).
            DATA(lv_day) = <lfs_data>-value+0(2).
            DATA(lv_newdate) = |{ lv_year }| && |{ lv_month }| &&  |{ lv_day } |.
            ls_sup_purchasing-plifz = lv_newdate.
            CLEAR:
                   lv_year,
                   lv_month,
                   lv_day,
                   lv_newdate.
          ENDIF.
        WHEN 14.
          ls_sup_purchasing-vsbed = <lfs_data>-value.
        WHEN 15.
          ls_sup_purchasing-webre = <lfs_data>-value.
        WHEN 16.
          ls_sup_purchasing-kzaut = <lfs_data>-value.
        WHEN 17.
          ls_sup_purchasing-bstae = <lfs_data>-value.
        WHEN 18.
          ls_sup_purchasing-xersy = <lfs_data>-value.
        WHEN 19.
          ls_sup_purchasing-kzabs = <lfs_data>-value.
        WHEN 20.
          ls_sup_purchasing-z_ven_cat = <lfs_data>-value.
        WHEN 21.
          ls_sup_purchasing-z_ven_detail = <lfs_data>-value.
        WHEN 22.
          ls_sup_purchasing-z_ven_type = <lfs_data>-value.
* Confirmed from Sujith that below fields will be removed from FS as part of FAT defect
*        WHEN 23.
*          ls_sup_purchasing2-ltsnr  = <lfs_data>-value.
*        WHEN 24.
*          ls_sup_purchasing2-werks = <lfs_data>-value.
*        WHEN 25.
*          ls_sup_purchasing2-zmon = <lfs_data>-value.
*        WHEN 26.
*          ls_sup_purchasing2-ztue = <lfs_data>-value.
*        WHEN 27.
*          ls_sup_purchasing2-zwed = <lfs_data>-value.
*        WHEN 28.
*          ls_sup_purchasing2-zthur = <lfs_data>-value.
*        WHEN 29.
*          ls_sup_purchasing2-zfri = <lfs_data>-value.
*        WHEN 30.
*          ls_sup_purchasing2-zsat = <lfs_data>-value.
*        WHEN 31.
*          ls_sup_purchasing2-zsun = <lfs_data>-value.
        WHEN OTHERS.
      ENDCASE.
      AT END OF row.
        IF ls_sup_purchasing-ekorg IS NOT INITIAL.
          APPEND ls_sup_purchasing TO  gt_supplier_purchasing.
        ENDIF.

        IF ls_sup_purchasing2-ekorg IS NOT INITIAL.
          APPEND ls_sup_purchasing2 TO gt_supplier_purchasing2.
        ENDIF.

        CLEAR: ls_sup_purchasing,
               ls_sup_purchasing2.
      ENDAT.
    ENDLOOP.
  ENDMETHOD.


  METHOD map_purchasing_text_sheet.
*&---------------------------------------------------------------------*
*& Method     :  MAP_PURCHASING_TEXT_SHEET                             *
*& Description: Data Purchasing Mapping                                *
*&---------------------------------------------------------------------*
    CLEAR: gt_supplier_porg_texts.
    DATA : ls_supplier_porg_texts TYPE cvis_supplier_porg_texts.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).

      IF <lfs_data> IS ASSIGNED.
        CASE <lfs_data>-column.
          WHEN 1.
            ls_supplier_porg_texts-run_id  = <lfs_data>-value.
          WHEN 2.
            ls_supplier_porg_texts-ekorg = <lfs_data>-value.
          WHEN 3.
            ls_supplier_porg_texts-text_id = <lfs_data>-value.
          WHEN 4.
            ls_supplier_porg_texts-langu = <lfs_data>-value.
          WHEN 5.
            ls_supplier_porg_texts-tdline  = <lfs_data>-value.
          WHEN OTHERS.
        ENDCASE.
      ENDIF.
      AT END OF row.
        APPEND:  ls_supplier_porg_texts  TO gt_supplier_porg_texts.
        CLEAR : ls_supplier_porg_texts.
      ENDAT.
    ENDLOOP.
  ENDMETHOD.


  METHOD map_relationship_types.
*&---------------------------------------------------------------------*
*& Method     :  MAP_RELATIONSHIP_TYPES                                *
*& Description: Map Relationship Types Data(Not used)                  *
*&---------------------------------------------------------------------*
*1.Need to get the fields details and map it for BAPI
*2.Do validation like negative and positive validtions which we get from the excel sheet
*3.Check if any conversions require for the uploaded data
*4.Check whether provided data from the excel is proper or not
*5.Feed BAPI with all the proper/valid data set for all the structures and tables

    DATA : ls_data TYPE gty_rel_typ . "gty_class_d.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).

      CASE <lfs_data>-column.
        WHEN 1.
          ls_data-bpartner = <lfs_data>-value.
        WHEN 2.
          ls_data-bpartner_r = <lfs_data>-value.
        WHEN 3.
          ls_data-bu_datfrom = <lfs_data>-value.
        WHEN 4.
          ls_data-bu_datto = <lfs_data>-value.
        WHEN 5.
          ls_data-bu_abtnr = <lfs_data>-value.
        WHEN 6.
          ls_data-bu_pafkt = <lfs_data>-value.
        WHEN 7.
          ls_data-ad_tlnmbr = <lfs_data>-value.
        WHEN 8.
          ls_data-ad_smtpadr = <lfs_data>-value.
        WHEN OTHERS.
      ENDCASE.

      AT END OF row.
        APPEND ls_data TO et_classf_data.
        CLEAR: ls_data.
      ENDAT.
    ENDLOOP.

  ENDMETHOD.


  METHOD map_sales_data_sheet.
*&---------------------------------------------------------------------*
*& Method     :  MAP_SALES_DATA_SHEET                                  *
*& Description: Map Sales Data                                         *
*&---------------------------------------------------------------------*
    CLEAR: gt_customer_sales.

    DATA : ls_customer_sales TYPE cvis_customer_sales.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      CASE <lfs_data>-column.
        WHEN 1.
          IF <lfs_data>-value IS NOT INITIAL.
            DATA(lv_werks_t) = <lfs_data>-value.
            TRANSLATE lv_werks_t TO UPPER CASE.
            ls_customer_sales-run_id = lv_werks_t.
            CLEAR:lv_werks_t.
          ENDIF.
        WHEN 2.
          ls_customer_sales-vkorg = <lfs_data>-value.
        WHEN 3.
          ls_customer_sales-vtweg = <lfs_data>-value.
        WHEN 4.
          ls_customer_sales-spart = <lfs_data>-value.
        WHEN 5.
          ls_customer_sales-kdgrp = <lfs_data>-value.
        WHEN 6.
          ls_customer_sales-bzirk = <lfs_data>-value.
        WHEN 7.
          ls_customer_sales-vkbur = <lfs_data>-value.
        WHEN 8.
          ls_customer_sales-vkgrp = <lfs_data>-value.
        WHEN 9.
          ls_customer_sales-eikto = <lfs_data>-value.
        WHEN 10.
          ls_customer_sales-awahr = <lfs_data>-value.
        WHEN 11.
          ls_customer_sales-klabc = <lfs_data>-value.
        WHEN 12.
          ls_customer_sales-waers = <lfs_data>-value.
        WHEN 13.
          ls_customer_sales-konda = <lfs_data>-value.
        WHEN 14.
          ls_customer_sales-pltyp = <lfs_data>-value.
        WHEN 15.
          ls_customer_sales-kalks = <lfs_data>-value.
        WHEN 16.
          ls_customer_sales-versg = <lfs_data>-value.
        WHEN 17.
          ls_customer_sales-lprio = <lfs_data>-value.
        WHEN 18.
          ls_customer_sales-kzazu = <lfs_data>-value.
        WHEN 19.
          ls_customer_sales-vsbed = <lfs_data>-value.
        WHEN 20.
          ls_customer_sales-vwerk = <lfs_data>-value.
        WHEN 21.
          ls_customer_sales-autlf = <lfs_data>-value.
        WHEN 22.
          ls_customer_sales-kztlf = <lfs_data>-value.
        WHEN 23.
          ls_customer_sales-perfk = <lfs_data>-value.
        WHEN 24.
          ls_customer_sales-incov = <lfs_data>-value.
        WHEN 25.
          ls_customer_sales-inco1 = <lfs_data>-value.
        WHEN 26.
          ls_customer_sales-inco2_l = <lfs_data>-value.
        WHEN 27.
          ls_customer_sales-inco3_l = <lfs_data>-value.
        WHEN 28.
          ls_customer_sales-zterm = <lfs_data>-value.
        WHEN 29.
          ls_customer_sales-ktgrd = <lfs_data>-value.
        WHEN 30.
          ls_customer_sales-aufsd = <lfs_data>-value.
        WHEN 31.
          ls_customer_sales-lifsd = <lfs_data>-value.
        WHEN 32.
          ls_customer_sales-faksd = <lfs_data>-value.
        WHEN OTHERS.
      ENDCASE.
      AT END OF row.
        APPEND:
                ls_customer_sales TO gt_customer_sales.
        CLEAR : ls_customer_sales.
      ENDAT.
    ENDLOOP.

  ENDMETHOD.


  METHOD map_sales_partner_sheet.
*&---------------------------------------------------------------------*
*& Method     : MAP_SALES_PARTNER_SHEET                                *
*& Description:1.Fields & Data Mapping From The Excel Sheet Into-      *
*& Internal Tables and Delete If any Duplicate Data Occurs             *
*& 2.FEW FIELDS YET TO CONFIRM FUNCTION OWNERS                         *
*&---------------------------------------------------------------------*
    CLEAR: gt_customer_sales_func.
    DATA : ls_customer_sales_func TYPE cvis_customer_sales_func.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      CASE <lfs_data>-column.
        WHEN 1.
          IF <lfs_data>-value IS NOT INITIAL.
            DATA(lv_werks_t) = <lfs_data>-value.
            TRANSLATE lv_werks_t TO UPPER CASE.
            ls_customer_sales_func-run_id = lv_werks_t.
            CLEAR:lv_werks_t.
          ENDIF.
        WHEN 2.
          ls_customer_sales_func-vkorg = <lfs_data>-value.
        WHEN 3.
          ls_customer_sales_func-vtweg = <lfs_data>-value.
        WHEN 4.
          ls_customer_sales_func-spart = <lfs_data>-value.
        WHEN 5.
          IF <lfs_data>-value IS NOT INITIAL.
            CALL FUNCTION 'CONVERSION_EXIT_PARVW_INPUT'
              EXPORTING
                input  = <lfs_data>-value
              IMPORTING
                output = ls_customer_sales_func-parvw.
          ENDIF.
        WHEN 6."Customer ID
          ls_customer_sales_func-partner = <lfs_data>-value.
        WHEN 7."Vendor ID
          IF <lfs_data>-value IS NOT INITIAL.
             ls_customer_sales_func-partner = <lfs_data>-value.
          ENDIF.

        WHEN 8."Employee ID
          IF <lfs_data>-value IS NOT INITIAL.
             ls_customer_sales_func-partner = <lfs_data>-value.
          ENDIF.

        WHEN 9."Contact Person ID
          IF <lfs_data>-value IS NOT INITIAL.
             ls_customer_sales_func-partner = <lfs_data>-value.
          ENDIF.

        WHEN 10.
          ls_customer_sales_func-defpa = <lfs_data>-value.
        WHEN 11."Partner description
          ls_customer_sales_func-knref = <lfs_data>-value.
        WHEN OTHERS.
      ENDCASE.

      AT END OF row.
        APPEND: ls_customer_sales_func TO gt_customer_sales_func.
        CLEAR : ls_customer_sales_func.
      ENDAT.
    ENDLOOP.
  ENDMETHOD.


  METHOD map_sales_texts_sheet.
*&---------------------------------------------------------------------*
*& Method     : MAP_SALES_TEXTS_SHEET                                  *
*& Description:1.Fields & Data Mapping From The Excel Sheet Into-      *
*& Internal Tables                                                     *
*&---------------------------------------------------------------------*
    CLEAR:gt_customer_sales_texts.
    DATA: ls_customer_sales_texts TYPE cvis_customer_sales_texts.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      IF <lfs_data> IS ASSIGNED.
        CASE <lfs_data>-column.
          WHEN 1.
            ls_customer_sales_texts-run_id = <lfs_data>-value.
          WHEN 2.
            ls_customer_sales_texts-vkorg = <lfs_data>-value.
          WHEN 3.
            ls_customer_sales_texts-vtweg = <lfs_data>-value.
          WHEN 4.
            ls_customer_sales_texts-spart = <lfs_data>-value.
          WHEN 5.
            ls_customer_sales_texts-text_id = <lfs_data>-value.
          WHEN 6.
            ls_customer_sales_texts-langu = <lfs_data>-value.
          WHEN 7.
            ls_customer_sales_texts-tdline = <lfs_data>-value.
          WHEN OTHERS.
        ENDCASE.
      ENDIF.
      AT END OF row.
        APPEND: ls_customer_sales_texts TO gt_customer_sales_texts.
        CLEAR : ls_customer_sales_texts.
      ENDAT.
    ENDLOOP.

  ENDMETHOD.


  METHOD map_site_data_sheet.
*&---------------------------------------------------------------------*
*& Method     : MAP_SITE_DATA_SHEET                                    *
*& Description: Fields & Data Mapping From The Excel Sheet Into-       *
*& Internal Table and Do Required Validation                           *                               *
*&---------------------------------------------------------------------*

*--->Data Declaration
    DATA: ls_site_data TYPE gty_final.
*--->Prepare Data From Excel To Internal Table
    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      CASE <lfs_data>-column.
        WHEN 1. "Plant/Site
          IF <lfs_data>-value IS NOT INITIAL.
            DATA(lv_werks_t) = <lfs_data>-value.
            TRANSLATE lv_werks_t TO UPPER CASE.
            ls_site_data-werks = lv_werks_t.
            CLEAR:lv_werks_t.
          ENDIF.
        WHEN 2.
          ls_site_data-spgr1 = <lfs_data>-value. "Blocking Reason
        WHEN 3. "Block from
          IF <lfs_data>-value IS NOT INITIAL.
            DATA(lv_year) = <lfs_data>-value+6(4).
            DATA(lv_month) = <lfs_data>-value+3(2).
            DATA(lv_day) = <lfs_data>-value+0(2).
            DATA(lv_newdate) = |{ lv_year }| && |{ lv_month }| &&  |{ lv_day } |.
            ls_site_data-spdab = lv_newdate.
            CLEAR:
                   lv_year,
                   lv_month,
                   lv_day,
                   lv_newdate.
          ENDIF.
        WHEN 4. "Block to
          IF <lfs_data>-value IS NOT INITIAL.
            lv_year = <lfs_data>-value+6(4).
            lv_month = <lfs_data>-value+3(2).
            lv_day = <lfs_data>-value+0(2).
            lv_newdate = |{ lv_year }| && |{ lv_month }| &&  |{ lv_day } |.
            ls_site_data-spdbi = lv_newdate.
            CLEAR:
                   lv_year,
                   lv_month,
                   lv_day,
                   lv_newdate.
          ENDIF.
        WHEN 5. "Goods receiving hours ID (default value)( i.e.Time Key)
          ls_site_data-wanid = <lfs_data>-value.
        WHEN 6."Opening Date
          IF <lfs_data>-value IS NOT INITIAL.
            lv_year = <lfs_data>-value+6(4).
            lv_month = <lfs_data>-value+3(2).
            lv_day = <lfs_data>-value+0(2).
            lv_newdate = |{ lv_year }| && |{ lv_month }| &&  |{ lv_day } |.
            ls_site_data-eroed = lv_newdate.
            CLEAR:
                   lv_year,
                   lv_month,
                   lv_day,
                   lv_newdate.
          ENDIF.
        WHEN 7. "Closing Date
          IF <lfs_data>-value IS NOT INITIAL.
            lv_year = <lfs_data>-value+6(4).
            lv_month = <lfs_data>-value+3(2).
            lv_day = <lfs_data>-value+0(2).
            lv_newdate = |{ lv_year }| && |{ lv_month }| &&  |{ lv_day } |.
            ls_site_data-schld =  lv_newdate.
            CLEAR:
                   lv_year,
                   lv_month,
                   lv_day,
                   lv_newdate.
          ENDIF.
        WHEN OTHERS.
      ENDCASE.

      AT END OF row.
        APPEND: ls_site_data TO gt_site_final.
        CLEAR: ls_site_data.
      ENDAT.
    ENDLOOP.
*--->Delete Blank Rows From Final Table
    SORT gt_site_final BY werks.
    DELETE ADJACENT DUPLICATES FROM gt_site_final COMPARING werks.
    DELETE gt_site_final WHERE werks IS INITIAL.
*--->Do Site Data Validation & Process For The BAPI Feeding
    IF gt_site_final IS NOT INITIAL.
      validation_for_site_create( ).
    ENDIF.
  ENDMETHOD.


  METHOD map_tax_classification_sheet.
*&---------------------------------------------------------------------*
*& Method     :  MAP_TAX_CLASSIFICATION_SHEET                          *
*& Description: Tax Classification Data Mapping                        *
*&---------------------------------------------------------------------*
*--->Valid Sheet With Proper Mapping
    CLEAR:gt_customer_tax_indicator.
    DATA : ls_customer_tax_indicator TYPE cvis_customer_tax_indicator.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      CASE <lfs_data>-column.
        WHEN 1.
          IF <lfs_data>-value IS NOT INITIAL. "Check and change to upper case
            DATA(lv_werks_t) = <lfs_data>-value.
            TRANSLATE lv_werks_t TO UPPER CASE.
            ls_customer_tax_indicator-run_id = lv_werks_t.
            CLEAR:lv_werks_t.
          ENDIF.
        WHEN 2.
          ls_customer_tax_indicator-aland  = <lfs_data>-value.
        WHEN 3.
          ls_customer_tax_indicator-tatyp = <lfs_data>-value.
        WHEN 4.
          ls_customer_tax_indicator-taxkd = <lfs_data>-value.
        WHEN OTHERS.
      ENDCASE.
      AT END OF row.
        APPEND: ls_customer_tax_indicator TO gt_customer_tax_indicator.
        CLEAR : ls_customer_tax_indicator.
      ENDAT.
    ENDLOOP.

  ENDMETHOD.


  METHOD map_tax_numbers_sheet.
*&---------------------------------------------------------------------*
*& Method     : MAP_TAX_NUMBERS_SHEET                                  *
*& Description: Tax Number Data Mapping                                *
*&---------------------------------------------------------------------*
    CLEAR:gt_bp_tax_number.
    DATA : ls_bp_tax_number TYPE cvis_bp_tax_number.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      IF <lfs_data> IS ASSIGNED.
        CASE <lfs_data>-column.
          WHEN 1.
            IF <lfs_data>-value IS NOT INITIAL. "Check and change to upper case
              DATA(lv_werks_t) = <lfs_data>-value.
              TRANSLATE lv_werks_t TO UPPER CASE.
              ls_bp_tax_number-run_id = lv_werks_t.
              CLEAR:lv_werks_t.
            ENDIF.
          WHEN 2.
            ls_bp_tax_number-taxtype = <lfs_data>-value.
          WHEN 3.
            ls_bp_tax_number-taxnumber = <lfs_data>-value.
         WHEN OTHERS.
        ENDCASE.
      ENDIF.
      AT END OF row.
        APPEND: ls_bp_tax_number TO gt_bp_tax_number.
        CLEAR : ls_bp_tax_number.
      ENDAT.
    ENDLOOP.

  ENDMETHOD.


  METHOD map_vendor_company_sheet.
*&---------------------------------------------------------------------*
*& Method     : MAP_VENDOR_COMPANY_SHEET                              *
*& Description: Fields & Data Mapping From The Excel Sheet Into-       *
*& Internal Table                                                      *
*&---------------------------------------------------------------------*
    CLEAR:gt_supplier_company.
    DATA : ls_supplier_company   TYPE cvis_supplier_company.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      IF <lfs_data> IS ASSIGNED.
        CASE <lfs_data>-column.
          WHEN 1.
            IF <lfs_data>-value IS NOT INITIAL. "Check and change to upper case
              DATA(lv_werks_t) = <lfs_data>-value.
              TRANSLATE lv_werks_t TO UPPER CASE.
              ls_supplier_company-run_id  = lv_werks_t.
              CLEAR:lv_werks_t.
            ENDIF.
          WHEN 2.
            ls_supplier_company-bukrs = <lfs_data>-value.
          WHEN 3.
            ls_supplier_company-zuawa = <lfs_data>-value.
          WHEN 4.
            IF <lfs_data>-value IS NOT INITIAL.
              CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
                EXPORTING
                  input  = <lfs_data>-value
                IMPORTING
                  output = ls_supplier_company-akont.
            ENDIF.
          WHEN 5.
            ls_supplier_company-fdgrv = <lfs_data>-value.
          WHEN 6.
            ls_supplier_company-zwels = <lfs_data>-value.
          WHEN 7.
            ls_supplier_company-hbkid = <lfs_data>-value.
          WHEN 8.
            ls_supplier_company-lnrzb = <lfs_data>-value.
          WHEN 9.
            "Clearing with Customer
            ls_supplier_company-xverr = <lfs_data>-value.
          WHEN 10.
            ls_supplier_company-zahls = <lfs_data>-value.
          WHEN 11.
            ls_supplier_company-zterm  = <lfs_data>-value.
          WHEN 12.
            ls_supplier_company-reprf = <lfs_data>-value.
          WHEN 13.
            "Previous Account Number
            ls_supplier_company-altkn = <lfs_data>-value.
          WHEN 14.
            ls_supplier_company-eikto = <lfs_data>-value.
          WHEN 15.
            ls_supplier_company-busab = <lfs_data>-value.
          WHEN 16.
            ls_supplier_company-zsabe = <lfs_data>-value.
          WHEN 17.
            ls_supplier_company-tlfns = <lfs_data>-value.
          WHEN 18.
            ls_supplier_company-tlfxs  = <lfs_data>-value.
          WHEN 19.
            ls_supplier_company-intad = <lfs_data>-value.
          WHEN OTHERS.
        ENDCASE.
      ENDIF.
      AT END OF row.
        APPEND: ls_supplier_company  TO gt_supplier_company.
        CLEAR : ls_supplier_company .
      ENDAT.
    ENDLOOP.

  ENDMETHOD.


  METHOD map_vendor_company_text_sheet.
*&---------------------------------------------------------------------*
*& Method     : MAP_VENDOR_COMPANY_TEXT_SHEET                          *
*& Description: Vendor Company Text mapping                            *
*&---------------------------------------------------------------------*
    CLEAR: gt_supplier_cc_texts.
    DATA : ls_supplier_cc_texts   TYPE cvis_supplier_cc_texts.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      IF <lfs_data> IS ASSIGNED.
        CASE <lfs_data>-column.
          WHEN 1.
            ls_supplier_cc_texts-run_id  = <lfs_data>-value.
          WHEN 2.
            ls_supplier_cc_texts-bukrs = <lfs_data>-value.
          WHEN 3.
            ls_supplier_cc_texts-text_id = <lfs_data>-value.
          WHEN 4.
            ls_supplier_cc_texts-langu  = <lfs_data>-value.
          WHEN 5.
            ls_supplier_cc_texts-tdline = <lfs_data>-value.
         WHEN OTHERS.
        ENDCASE.
      ENDIF.
      AT END OF row.
        APPEND: ls_supplier_cc_texts  TO gt_supplier_cc_texts.
        CLEAR : ls_supplier_cc_texts .
      ENDAT.
    ENDLOOP.
  ENDMETHOD.


  METHOD map_vendor_partner_sheet.
*&---------------------------------------------------------------------*
*& Method     :  MAP_VENDOR_PARTNER_SHEET                              *
*& Description:1.Fields & Data Mapping From The Excel Sheet Into-      *
*& Internal Table                                                      *
*&2.As Per The Earlier Discussoion 5 & 6Th Column Should Be Removed    *
*&---------------------------------------------------------------------*

    CLEAR: gt_supplier_purch_func_t.
    DATA : ls_supplier_purch_func TYPE cvis_supplier_purch_func. "Supplier Purchasing Functions

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      IF <lfs_data> IS ASSIGNED.
        CASE <lfs_data>-column.
          WHEN 1.
            ls_supplier_purch_func-run_id  = <lfs_data>-value.
          WHEN 2.
            ls_supplier_purch_func-ekorg = <lfs_data>-value.
          WHEN 3.
            IF <lfs_data>-value IS NOT INITIAL.
              CALL FUNCTION 'CONVERSION_EXIT_PARVW_INPUT'
                EXPORTING
                  input  = <lfs_data>-value
                IMPORTING
                  output = ls_supplier_purch_func-parvw.
            ENDIF.
          WHEN 4.
            "Vendor ID
            ls_supplier_purch_func-partner = <lfs_data>-value.
          WHEN 5.
            "Employee ID
            ls_supplier_purch_func-partner = <lfs_data>-value.
          WHEN 6.
            "Contact Person ID
            ls_supplier_purch_func-partner = <lfs_data>-value.
          WHEN 7.
            ls_supplier_purch_func-defpa  = <lfs_data>-value.
          WHEN OTHERS.
        ENDCASE.
      ENDIF.
      AT END OF row.
        APPEND: ls_supplier_purch_func  TO gt_supplier_purch_func_t.
        CLEAR : ls_supplier_purch_func.
      ENDAT.
    ENDLOOP.

  ENDMETHOD.


  METHOD map_vendor_withholding_tax_sht.
*&---------------------------------------------------------------------*
*& Method     : MAP_VENDOR_WITHHOLDING_TAX_SHT                         *
*& Description: Fields & Data Mapping From The Excel Sheet Into-       *
*& Internal Table                                                      *
*&---------------------------------------------------------------------*
    CLEAR:gt_supplier_company_wtax.

    DATA :
           ls_tax                     TYPE gty_tax.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      IF <lfs_data> IS ASSIGNED.
        CASE <lfs_data>-column.
          WHEN 1.
            ls_tax-run_id  = <lfs_data>-value.
          WHEN 2.
            ls_tax-bukrs = <lfs_data>-value.
          WHEN 3.
            ls_tax-land1 = <lfs_data>-value.
          WHEN 4.
            ls_tax-witht  = <lfs_data>-value.
          WHEN 5.
            ls_tax-wt_withcd = <lfs_data>-value.
          WHEN 6.
            ls_tax-wt_wtstcd = <lfs_data>-value.
          WHEN 7.
* Functional(Sujit) Confirmed that it is not required and will be removed from FS as
* as part of FAT defect
            "Short key for a house bank
*            ls_supplier_company_wtax- = <lfs_data>-value.
          WHEN OTHERS.
        ENDCASE.
      ENDIF.
      AT END OF row.
        IF ls_tax-bukrs IS NOT INITIAL.
        APPEND:
                ls_tax TO gt_tax.
        ENDIF.
        CLEAR :
                ls_tax.
      ENDAT.
    ENDLOOP.

  ENDMETHOD.


  METHOD prepare_data_create_bp.
*&---------------------------------------------------------------------*
*& Method     : PREPARE_DATA_CREATE_BP                                 *
*& Description: Creating Business Partner in Online and Background mode*
*&---------------------------------------------------------------------*
*--->Create Business Partner(BP)
    DATA:
      lt_return      TYPE cvis_bp_return_t,
      lt_return_tmp  TYPE cvis_bp_return_t,
      ls_return      TYPE cvis_bp_return,
      ls_bp_messages TYPE site_status_sty,
      ls_supplier_company_wtax   TYPE cvis_supplier_company_wtax,
      ls_bp_exists   TYPE zsops_bp.

    CONSTANTS:
      lc_messageid TYPE symsgid VALUE 'ZOPS',
      lc_number    TYPE symsgno VALUE '022',
      lc_error_num TYPE symsgno VALUE '037',
      lc_bp_exists TYPE symsgno VALUE '036',
      lc_type      TYPE bapi_mtype VALUE 'S',
      lc_error     TYPE bapi_mtype VALUE 'E',
      lc_bp        TYPE char5    VALUE 'BP'.

    DATA(lt_tax_tmp) = gt_tax.
    SORT lt_tax_tmp BY land1 witht.
    DELETE ADJACENT DUPLICATES FROM lt_tax_tmp COMPARING land1 witht.
    IF lt_tax_tmp IS NOT INITIAL.
    SELECT land1, witht FROM t059z INTO TABLE @DATA(lt_tax_val)
                                   FOR ALL ENTRIES IN @lt_tax_tmp
                                   WHERE land1 EQ @lt_tax_tmp-land1
                                   AND   witht EQ @lt_tax_tmp-witht.
     IF sy-subrc EQ 0.
        LOOP AT gt_tax ASSIGNING FIELD-SYMBOL(<lfs_tax>).
          ls_supplier_company_wtax-run_id = <lfs_tax>-run_id.
          ls_supplier_company_wtax-bukrs = <lfs_tax>-bukrs.
          IF <lfs_tax>-land1 IS INITIAL.
           ls_supplier_company_wtax-witht = <lfs_tax>-witht.
          ELSE.
            IF line_exists( lt_tax_val[ land1 = <lfs_tax>-land1 witht = <lfs_tax>-witht ] ).
              ls_supplier_company_wtax-witht = <lfs_tax>-witht.
            ENDIF.
          ENDIF.

          ls_supplier_company_wtax-wt_withcd = <lfs_tax>-wt_withcd.
          ls_supplier_company_wtax-wt_wtstcd = <lfs_tax>-wt_wtstcd.

          APPEND ls_supplier_company_wtax TO gt_supplier_company_wtax.
          CLEAR ls_supplier_company_wtax.
        ENDLOOP.
     ENDIF.
   ENDIF.

    SELECT partner FROM but000 INTO TABLE gt_bp_exists FOR ALL ENTRIES IN gt_bp_general WHERE partner = gt_bp_general-bpartner.
      IF sy-subrc EQ 0.
      LOOP AT gt_bp_general ASSIGNING FIELD-SYMBOL(<lfs_bp_general>).
        IF line_exists( gt_bp_exists[ partner = <lfs_bp_general>-run_id ] ).

* Populate Message table saying 'BP already exists'
           ls_return-run_id = <lfs_bp_general>-run_id.
           ls_return-type = lc_error.
           ls_return-id = lc_messageid.
           ls_return-number = lc_bp_exists.
           ls_return-message_v1 = <lfs_bp_general>-run_id.
           APPEND ls_return TO lt_return_tmp.
           CLEAR ls_return.
* Clear Run ID and delete it outside the loop
           CLEAR <lfs_bp_general>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_bp_roles ASSIGNING FIELD-SYMBOL(<lfs_bp_roles>).
        IF line_exists( gt_bp_exists[ partner = <lfs_bp_roles>-run_id ] ).
           CLEAR <lfs_bp_roles>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_bp_industry ASSIGNING FIELD-SYMBOL(<lfs_bp_industry>).
        IF line_exists( gt_bp_exists[ partner = <lfs_bp_industry>-run_id ] ).
           CLEAR <lfs_bp_industry>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_bp_ident_numbers ASSIGNING FIELD-SYMBOL(<lfs_bp_ident_numbers>).
        IF line_exists( gt_bp_exists[ partner = <lfs_bp_ident_numbers>-run_id ] ).
           CLEAR <lfs_bp_ident_numbers>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_bp_bank_details ASSIGNING FIELD-SYMBOL(<lfs_bp_bank_details>).
        IF line_exists( gt_bp_exists[ partner = <lfs_bp_bank_details>-run_id ] ).
           CLEAR <lfs_bp_bank_details>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_bp_tax_number ASSIGNING FIELD-SYMBOL(<lfs_bp_tax_number>).
        IF line_exists( gt_bp_exists[ partner = <lfs_bp_tax_number>-run_id ] ).
           CLEAR <lfs_bp_tax_number>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_bp_address ASSIGNING FIELD-SYMBOL(<lfs_bp_address>).
        IF line_exists( gt_bp_exists[ partner = <lfs_bp_address>-run_id ] ).
           CLEAR <lfs_bp_address>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_bp_address_teleno ASSIGNING FIELD-SYMBOL(<lfs_bp_address_teleno>).
        IF line_exists( gt_bp_exists[ partner = <lfs_bp_address_teleno>-run_id ] ).
           CLEAR <lfs_bp_address_teleno>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_bp_address_email ASSIGNING FIELD-SYMBOL(<lfs_bp_address_email>).
        IF line_exists( gt_bp_exists[ partner = <lfs_bp_address_email>-run_id ] ).
           CLEAR <lfs_bp_address_email>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_bp_address_uri ASSIGNING FIELD-SYMBOL(<lfs_bp_address_uri>).
        IF line_exists( gt_bp_exists[ partner = <lfs_bp_address_uri>-run_id ] ).
           CLEAR <lfs_bp_address_uri>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_customer_general ASSIGNING FIELD-SYMBOL(<lfs_customer_general>).
        IF line_exists( gt_bp_exists[ partner = <lfs_customer_general>-run_id ] ).
           CLEAR <lfs_customer_general>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_customer_gen_texts ASSIGNING FIELD-SYMBOL(<lfs_customer_gen_texts>).
        IF line_exists( gt_bp_exists[ partner = <lfs_customer_gen_texts>-run_id ] ).
           CLEAR <lfs_customer_gen_texts>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_customer_company ASSIGNING FIELD-SYMBOL(<lfs_customer_company>).
        IF line_exists( gt_bp_exists[ partner = <lfs_customer_company>-run_id ] ).
           CLEAR <lfs_customer_company>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_customer_cc_texts ASSIGNING FIELD-SYMBOL(<lfs_customer_cc_texts>).
        IF line_exists( gt_bp_exists[ partner = <lfs_customer_cc_texts>-run_id ] ).
           CLEAR <lfs_customer_cc_texts>-run_id.
        ENDIF.
      ENDLOOP.
      ENDIF.

      LOOP AT gt_customer_sales ASSIGNING FIELD-SYMBOL(<lfs_customer_sales>).
        IF line_exists( gt_bp_exists[ partner = <lfs_customer_sales>-run_id ] ).
           CLEAR <lfs_customer_sales>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_customer_sales_texts ASSIGNING FIELD-SYMBOL(<lfs_customer_sales_texts>).
        IF line_exists( gt_bp_exists[ partner = <lfs_customer_sales_texts>-run_id ] ).
           CLEAR <lfs_customer_sales_texts>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_customer_comp_dunning ASSIGNING FIELD-SYMBOL(<lfs_customer_comp_dunning>).
        IF line_exists( gt_bp_exists[ partner = <lfs_customer_comp_dunning>-run_id ] ).
           CLEAR <lfs_customer_comp_dunning>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_customer_sales_func ASSIGNING FIELD-SYMBOL(<lfs_customer_sales_func>).
        IF line_exists( gt_bp_exists[ partner = <lfs_customer_sales_func>-run_id ] ).
           CLEAR <lfs_customer_sales_func>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_customer_tax_indicator ASSIGNING FIELD-SYMBOL(<lfs_customer_tax_indicator>).
        IF line_exists( gt_bp_exists[ partner = <lfs_customer_tax_indicator>-run_id ] ).
           CLEAR <lfs_customer_tax_indicator>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_supplier_general ASSIGNING FIELD-SYMBOL(<lfs_supplier_general>).
        IF line_exists( gt_bp_exists[ partner = <lfs_supplier_general>-run_id ] ).
           CLEAR <lfs_supplier_general>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_supplier_company ASSIGNING FIELD-SYMBOL(<lfs_supplier_company>).
        IF line_exists( gt_bp_exists[ partner = <lfs_supplier_company>-run_id ] ).
           CLEAR <lfs_supplier_company>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_supplier_cc_texts ASSIGNING FIELD-SYMBOL(<lfs_supplier_cc_texts>).
        IF line_exists( gt_bp_exists[ partner = <lfs_supplier_cc_texts>-run_id ] ).
           CLEAR <lfs_supplier_cc_texts>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_supplier_company_wtax ASSIGNING FIELD-SYMBOL(<lfs_supplier_company_wtax>).
        IF line_exists( gt_bp_exists[ partner = <lfs_supplier_company_wtax>-run_id ] ).
           CLEAR <lfs_supplier_company_wtax>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_supplier_porg_texts ASSIGNING FIELD-SYMBOL(<lfs_supplier_porg_texts>).
        IF line_exists( gt_bp_exists[ partner = <lfs_supplier_porg_texts>-run_id ] ).
           CLEAR <lfs_supplier_porg_texts>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_supplier_purchasing ASSIGNING FIELD-SYMBOL(<lfs_supplier_purchasing>).
        IF line_exists( gt_bp_exists[ partner = <lfs_supplier_purchasing>-run_id ] ).
           CLEAR <lfs_supplier_purchasing>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_supplier_purchasing2 ASSIGNING FIELD-SYMBOL(<lfs_supplier_purchasing2>).
        IF line_exists( gt_bp_exists[ partner = <lfs_supplier_purchasing2>-run_id ] ).
           CLEAR <lfs_supplier_purchasing2>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_supplier_purch_func_t ASSIGNING FIELD-SYMBOL(<lfs_supplier_purch_func_t>).
        IF line_exists( gt_bp_exists[ partner = <lfs_supplier_purch_func_t>-run_id ] ).
           CLEAR <lfs_supplier_purch_func_t>-run_id.
        ENDIF.
      ENDLOOP.

      LOOP AT gt_supplier_contacts ASSIGNING FIELD-SYMBOL(<lfs_supplier_contacts>).
        IF line_exists( gt_bp_exists[ partner = <lfs_supplier_contacts>-run_id ] ).
           CLEAR <lfs_supplier_contacts>-run_id.
        ENDIF.
      ENDLOOP.

*--->Delete Blank Entries From The Internal Tables
    DELETE:
              gt_bp_general WHERE run_id IS INITIAL,
              gt_bp_roles WHERE run_id IS INITIAL,
              gt_bp_industry WHERE run_id IS INITIAL,
              gt_bp_ident_numbers WHERE run_id IS INITIAL,
              gt_bp_bank_details WHERE run_id IS INITIAL,
              gt_bp_tax_number WHERE run_id IS INITIAL,
              gt_bp_address WHERE run_id IS INITIAL,
              gt_bp_address_teleno WHERE run_id IS INITIAL,
              gt_bp_address_email WHERE run_id IS INITIAL,
              gt_bp_address_uri WHERE run_id IS INITIAL,
              gt_customer_general WHERE run_id IS INITIAL,
              gt_customer_gen_texts WHERE run_id IS INITIAL,
              gt_customer_company WHERE run_id IS INITIAL,
              gt_customer_cc_texts WHERE run_id IS INITIAL,
              gt_customer_sales WHERE run_id IS INITIAL,
              gt_customer_sales_texts WHERE run_id IS INITIAL,
              gt_customer_comp_dunning WHERE run_id IS INITIAL,
              gt_customer_sales_func WHERE run_id IS INITIAL,
              gt_customer_tax_indicator WHERE run_id IS INITIAL,
              gt_supplier_general WHERE run_id IS INITIAL,
              gt_supplier_company WHERE run_id IS INITIAL,
              gt_supplier_cc_texts WHERE run_id IS INITIAL,
              gt_supplier_company_wtax WHERE run_id IS INITIAL,
              gt_supplier_porg_texts WHERE run_id IS INITIAL,
              gt_supplier_purchasing WHERE run_id IS INITIAL,
              gt_supplier_purchasing2 WHERE run_id IS INITIAL,
              gt_supplier_purch_func_t WHERE run_id IS INITIAL,
              gt_supplier_contacts WHERE run_id IS INITIAL,
*--->If Email Id Is Not Available Then Delete From The Internal Table
              gt_bp_address_email WHERE e_mail IS INITIAL.

    IF iv_background = abap_false.
      IF gt_bp_general IS NOT INITIAL.
*--->Call  RFC FM To Create Busines Partners
      CALL FUNCTION 'RFC_CVI_EI_INBOUND_MAIN'
        EXPORTING
          iv_docommit             = abap_true
        TABLES
          it_bp_general           = gt_bp_general " General Data
          it_bp_role              = gt_bp_roles
          it_bp_industry          = gt_bp_industry "Industries
          it_bp_ident_numbers     = gt_bp_ident_numbers "Identification
          it_bp_bank_details      = gt_bp_bank_details "Bank
          it_bp_tax_number        = gt_bp_tax_number "Tax numbers
          it_bp_address           = gt_bp_address "General data
          it_bp_address_teleno    = gt_bp_address_teleno "General data
          it_bp_address_faxno     = gt_bp_address_faxno " Fax
          it_bp_address_email     = gt_bp_address_email "General data
          it_bp_address_uri       = gt_bp_address_uri
          it_cust_general         = gt_customer_general "General Data
          it_cust_general_texts   = gt_customer_gen_texts "General Text
          it_cust_company         = gt_customer_company "Company code
          it_cust_company_texts   = gt_customer_cc_texts "Company text
          it_cust_sales           = gt_customer_sales "Sales Data
          it_cust_sales_texts     = gt_customer_sales_texts "Sales texts
          it_cust_comp_dunning    = gt_customer_comp_dunning "Company code "This Also existing in Dunning - Verify
          it_cust_sales_functions = gt_customer_sales_func "Sales partner
          it_cust_tax_indicator   = gt_customer_tax_indicator "Tax classification
          it_cust_contacts        = gt_customer_contacts_t "Sales partner
          it_sup_general          = gt_supplier_general "General data
          it_sup_company          = gt_supplier_company "Company code & Vendor Company
          it_sup_company_texts    = gt_supplier_cc_texts "Vendor company text
          it_sup_company_wtax     = gt_supplier_company_wtax "Vendor witholding tax
          it_sup_purchasing_texts = gt_supplier_porg_texts "Purchasing text
          it_sup_purchasing       = gt_supplier_purchasing "Purchasing data
          it_sup_purchasing2      = gt_supplier_purchasing2 "Purchasing data & vendor subrange
          it_sup_purch_functions  = gt_supplier_purch_func_t "Vendor partner
          it_supplier_contacts    = gt_supplier_contacts "Vendor partner
          ct_return               = lt_return.
          ENDIF.

           IF lt_return_tmp IS NOT INITIAL. "Existing BPs
              APPEND LINES OF lt_return_tmp TO lt_return.
              REFRESH lt_return_tmp.
           ENDIF.

           IF lt_return IS NOT INITIAL.
             LOOP AT lt_return ASSIGNING FIELD-SYMBOL(<lfs_return>).
               IF <lfs_return>-type = lc_type.
                <lfs_return>-id = lc_messageid.
                <lfs_return>-number = lc_number.
                <lfs_return>-message_v1 = <lfs_return>-run_id.
                DATA(lv_flag) = abap_true.
               ENDIF.
               AT END OF run_id.
                 IF lv_flag IS INITIAL.
                    DATA(ls_return_n) = <lfs_return>.
                    CLEAR ls_return_n.
                    ls_return_n-run_id = <lfs_return>-run_id.
                    ls_return_n-id = lc_messageid.
                    ls_return_n-type = lc_error.
                    ls_return_n-number = lc_error_num.
                    ls_return_n-message_v1 = <lfs_return>-run_id.
                    APPEND ls_return_n TO lt_return_tmp.
                    CLEAR: ls_return_n.
                 ENDIF.
                 CLEAR: lv_flag.
               ENDAT.
             ENDLOOP.

             IF lt_return_tmp IS NOT INITIAL. "Existing BPs
                APPEND LINES OF lt_return_tmp TO lt_return.
                REFRESH lt_return_tmp.
             ENDIF.

             SORT lt_return BY run_id.
*             gt_return = lt_return.
*--->Application Log For Foreground Call
             save_appl_log(
             EXPORTING
             it_applog_bp = lt_return
             iv_site_bp   = lc_bp ).
           ENDIF.
    ELSE.
*--->Call For Background
        CLEAR gv_queue.
        gv_queue = TEXT-002.
*--->Create Inbound Queue
      create_inbound_queue(
         EXPORTING
           iv_site_bp = gv_queue
        IMPORTING
          ev_name = DATA(lv_queue_name) ).

      IF lt_return_tmp IS NOT INITIAL. "Existing BPs
         APPEND LINES OF lt_return_tmp TO lt_return.
      ENDIF.

      CALL FUNCTION 'ZOPSFM_RFC_BP_INBOUND_MAIN' IN BACKGROUND TASK
        AS SEPARATE UNIT DESTINATION 'NONE'
        EXPORTING
          iv_docommit             = abap_true
          iv_queue_name           = lv_queue_name
        TABLES
          t_bp_general           = gt_bp_general " General Data
          t_bp_role              = gt_bp_roles
          t_bp_industry          = gt_bp_industry "Industries
          t_bp_ident_numbers     = gt_bp_ident_numbers "Identification
          t_bp_bank_details      = gt_bp_bank_details "Bank
          t_bp_tax_number        = gt_bp_tax_number "Tax numbers
          t_bp_address           = gt_bp_address
          t_bp_address_teleno    = gt_bp_address_teleno
          t_bp_address_faxno     = gt_bp_address_faxno " Fax
          t_bp_address_email     = gt_bp_address_email
          t_bp_address_uri       = gt_bp_address_uri
          t_cust_general         = gt_customer_general
          t_cust_general_texts   = gt_customer_gen_texts "General Text
          t_cust_company         = gt_customer_company "Company code
          t_cust_company_texts   = gt_customer_cc_texts "Company text
          t_cust_sales           = gt_customer_sales "Sales Data
          t_cust_sales_texts     = gt_customer_sales_texts "Sales texts
          t_cust_comp_dunning    = gt_customer_comp_dunning "Company code "This Also existing in Dunning - Verify
          t_cust_sales_functions = gt_customer_sales_func "Sales partner
          t_cust_tax_indicator   = gt_customer_tax_indicator "Tax classification
          t_cust_contacts        = gt_customer_contacts_t "Sales partner
          t_sup_general          = gt_supplier_general "General data
          t_sup_company          = gt_supplier_company "Company code & Vendor Company
          t_sup_company_texts    = gt_supplier_cc_texts "Vendor company text
          t_sup_company_wtax     = gt_supplier_company_wtax "Vendor witholding tax
          t_sup_purchasing_texts = gt_supplier_porg_texts "Purchasing text
          t_sup_purchasing       = gt_supplier_purchasing "Purchasing data
          t_sup_purchasing2      = gt_supplier_purchasing2 "Purchasing data & vendor subrange
          t_sup_purch_functions  = gt_supplier_purch_func_t "Vendor partner
          t_supplier_contacts    = gt_supplier_contacts "Vendor partner
          t_return               = lt_return.
          COMMIT WORK.

    ENDIF.
  ENDMETHOD.


  METHOD prepare_data_create_classifica.
*&---------------------------------------------------------------------*
*& Method     : PREPARE_DATA_CREATE_CLASSIFICA                         *
*& Description: 1.Create Classification Data For Site                  *
*&2.Get Required Classification Data, Check If It Is Online or         *
*& Background Run , If It Is Online Then Call FM-DMC_MIG_CLASSIFICATION*
*& Else Check For Background Run.                                      *
*&3.Get Return Messages and Save App. Log and Display Messages In Output*
*&---------------------------------------------------------------------*
*--->Data Declaration
    DATA : lt_bapi1003_alloc_values_char TYPE TABLE OF bapi1003_alloc_values_char INITIAL SIZE 1,
           ls_bapi1003_alloc_values_char TYPE bapi1003_alloc_values_char,
           ls_bapi1003_key               TYPE bapi1003_key,
           lt_return_temp                TYPE TABLE OF bapiret2 INITIAL SIZE 1,
           ls_bp_messages                TYPE site_status_sty,
*--->Prepare Log data for Site
           ls_bapi_log                   TYPE cvis_bp_return,"
           lt_bapi_log                   TYPE cvis_bp_return_t.

    CONSTANTS:
         lc_site TYPE char5    VALUE 'Site',
         lc_foursix TYPE symsgno VALUE '046',
         lc_fourseven TYPE symsgno VALUE '047'.

*--->Get Classification Data
    fetch_classification_data(
      IMPORTING
        es_classf_data = DATA(ls_clsfdb_data) ).

    CHECK ls_clsfdb_data IS NOT INITIAL.
*--->Call FM for Foreground
    IF iv_background = abap_false.

      LOOP AT it_classf_data ASSIGNING FIELD-SYMBOL(<lfs_classf_data>).
        "If valid DB data and classification available
        IF ls_clsfdb_data IS NOT INITIAL AND <lfs_classf_data> IS ASSIGNED.
          ls_bapi1003_alloc_values_char-charact = <lfs_classf_data>-atnam.
          ls_bapi1003_alloc_values_char-value_char = <lfs_classf_data>-atwrt.
          APPEND ls_bapi1003_alloc_values_char TO lt_bapi1003_alloc_values_char.
          CLEAR: ls_bapi1003_alloc_values_char.

          AT END OF object. " For Every End Of Site
            CALL FUNCTION 'DMC_MIG_CLASSIFICATION'
              EXPORTING
                objectkeynew    = <lfs_classf_data>-object
                objecttablenew  = gc_objecttable
                classnumnew     = ls_clsfdb_data-class_name
                classtypenew    = gc_classtype
                keydate         = sy-datum
              IMPORTING
                classif_status  = ls_bapi1003_key-status
              TABLES
                allocvalueschar = lt_bapi1003_alloc_values_char
                return          = lt_return_temp.

        LOOP AT lt_return_temp ASSIGNING FIELD-SYMBOL(<lfs_return_temp>).
         IF <lfs_return_temp>-type EQ gc_msg_type_s.
            DATA(lv_sucess) = abap_true.
         ENDIF.

         IF <lfs_return_temp>-type EQ gc_msg_type_e.
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
         ls_bapi_log-type = gc_msg_type_s.
         ls_bapi_log-id = gc_message_cls.
         ls_bapi_log-number = lc_foursix.
         APPEND ls_bapi_log TO lt_bapi_log.
         CLEAR:ls_bapi_log,
               lv_sucess.
       ELSEIF lv_error EQ abap_true.
         ls_bapi_log-run_id = <lfs_classf_data>-object.
         ls_bapi_log-type = gc_msg_type_e.
         ls_bapi_log-id = gc_message_cls.
         ls_bapi_log-number = lc_fourseven.
         APPEND ls_bapi_log TO lt_bapi_log.
         CLEAR:ls_bapi_log,
               lv_error.
        ENDIF.
            REFRESH : lt_return_temp.
          ENDAT.
        ENDIF.
      ENDLOOP.

*--->Handle Application Log
    IF lt_bapi_log IS NOT INITIAL.
      save_appl_log(
            EXPORTING
        it_applog_bp    = lt_bapi_log
        iv_site_bp      = lc_site ).
    ENDIF.

   ELSE. "Background
         CLEAR gv_queue.
         gv_queue = TEXT-003.
*--->Trigger Inbound Queue And Get The Queue Created In The Queue List
            create_inbound_queue(
          EXPORTING
            iv_site_bp = gv_queue
          IMPORTING
            ev_name = DATA(lv_queue_name) ).

            CALL FUNCTION 'ZOPSFM_RFC_MIG_CLASSIFICATION' IN BACKGROUND TASK
              AS SEPARATE UNIT DESTINATION gc_destination
              EXPORTING
                iv_class_name      = ls_clsfdb_data-class_name
              TABLES
                t_classf_data     = it_classf_data.

            COMMIT WORK.
    ENDIF.

  ENDMETHOD.


  METHOD prepare_data_create_site.
*&---------------------------------------------------------------------*
*& Method     : PREPARE_DATA_CREATE_SITE                               *
*& Description: This method Will Create Site By Taking The Data From-  *
*& Reference Site From Given Template User Data                        *
*&---------------------------------------------------------------------*
*--->Data Declaration
    DATA:
      lt_site_data        TYPE  site_distr_site_tty,
      lt_address_data     TYPE  site_distr_address_tty,
      lt_address_data_tgt TYPE  site_distr_address_tty,
      ls_add              TYPE  site_distr_address_sty,
      ls_customer_out     TYPE  cmds_ei_main,
      ls_supplier_out     TYPE  vmds_ei_main,
      lt_site_tables      TYPE  site_distr_tabs_tty,
      lt_site             TYPE STANDARD TABLE OF site_status_sty,
      lt_site_tmp         TYPE site_status_tty,
      lt_site_collect     TYPE ztops_site_status_tty,
      ls_site_messages    TYPE site_status_sty,
      ls_site_range       TYPE site_distr_site_range_sty,
      lt_site_range       TYPE site_distr_site_range_tty,
      lv_index            TYPE sy-index,
      ls_return           TYPE cvis_bp_return,
      lt_site_exists      TYPE ztmsite_final.

    CONSTANTS:
      lc_site_exists TYPE char4 VALUE 'E036',
      lc_no_bp_exists TYPE char4 VALUE 'E044'.

      DATA(lt_site_final_tmp) = gt_site_final.
      SORT lt_site_final_tmp BY werks.
      DELETE ADJACENT DUPLICATES FROM lt_site_final_tmp COMPARING werks.
      IF lt_site_final_tmp IS NOT INITIAL.
        SELECT werks FROM t001w INTO TABLE lt_site_exists
                                FOR ALL ENTRIES IN lt_site_final_tmp
                                WHERE werks EQ lt_site_final_tmp-werks.
          IF sy-subrc EQ 0.
              SORT lt_site_exists.
          ENDIF.
      ENDIF.
*--->Site Creation Check For Reference Site And Validation
    IF me->gv_ref_site IS NOT INITIAL.
      ls_site_range-sign = gc_msg_type_i.
      ls_site_range-option = gc_option_eq.
      ls_site_range-low  = me->gv_ref_site.
      APPEND ls_site_range TO  lt_site_range.
      CLEAR: ls_site_range.
    ELSE.
      ls_site_messages-werks = iv_site_prof.
      ls_site_messages-status = gc_status.
      ls_site_messages-msgid  = gc_message_cls.
      CALL FUNCTION 'MESSAGE_TEXT_BUILD'
        EXPORTING
          msgid               = gc_message_cls
          msgnr               = gc_message_021
        IMPORTING
          message_text_output = ls_site_messages-message.
      INSERT ls_site_messages INTO TABLE gt_message.
      CLEAR ls_site_messages.
      EXIT.
    ENDIF.

*--->Collect Site Data for Site Creation
    IF lt_site_range IS NOT INITIAL. "Site
      CALL FUNCTION 'COLLECT_SITE_DATA' DESTINATION gc_destination
        EXPORTING
          it_site_range    = lt_site_range
          ip_src           = abap_true
          ip_communication = gc_communication
        IMPORTING
          et_site_data     = lt_site_data
          et_address_data  = lt_address_data
          es_customer_out  = ls_customer_out
          es_supplier_out  = ls_supplier_out
          et_site_tables   = lt_site_tables.

    REFRESH gt_bp_exists.
    DATA(lt_site_final_dup) = gt_site_final.
    LOOP AT lt_site_final_dup ASSIGNING FIELD-SYMBOL(<lfs_site_final_dup>).
     <lfs_site_final_dup>-partner = <lfs_site_final_dup>-werks.
    ENDLOOP.
    SORT lt_site_final_dup BY partner.
    DELETE ADJACENT DUPLICATES FROM lt_site_final_dup COMPARING partner.
    IF lt_site_final_dup IS NOT INITIAL.
    SELECT partner FROM but000 INTO TABLE gt_bp_exists FOR ALL ENTRIES IN lt_site_final_dup WHERE partner = lt_site_final_dup-partner.
     IF sy-subrc NE 0.
        REFRESH gt_bp_exists.
     ENDIF.
    ENDIF.
*--->Call For Foreground
     IF iv_background = abap_false.

*--->Final Table Site Master
      IF gt_site_final IS NOT INITIAL AND lt_site_data IS NOT INITIAL.
        LOOP AT gt_site_final INTO DATA(ls_final_site).

* Populate Message saying Site Already Exists
          IF line_exists( lt_site_exists[ werks = ls_final_site-werks ] ).
            ls_site_messages-werks = ls_final_site-werks.
            ls_site_messages-status = lc_site_exists.
            ls_site_messages-msgid  = gc_message_cls.
            APPEND ls_site_messages TO lt_site_collect.
            CLEAR ls_site_messages.
             CONTINUE.
          ENDIF.

          IF NOT line_exists( gt_bp_exists[ partner = ls_final_site-werks ] ).
            ls_site_messages-werks = ls_final_site-werks.
            ls_site_messages-status = lc_no_bp_exists.
            ls_site_messages-msgid  = gc_message_cls.
            APPEND ls_site_messages TO lt_site_collect.
            CLEAR ls_site_messages.
             CONTINUE.
          ENDIF.

          LOOP AT lt_site_data ASSIGNING FIELD-SYMBOL(<lfs_site_data>)." T001W
            <lfs_site_data>-db_funtion = gc_msg_type_i.
            <lfs_site_data>-t001w-werks  = ls_final_site-werks.
            <lfs_site_data>-t001w-bwkey  = ls_final_site-werks.
            <lfs_site_data>-t001w-kunnr  = ls_final_site-werks.
            <lfs_site_data>-t001w-lifnr  = ls_final_site-werks.
            CLEAR: <lfs_site_data>-t001w-adrnr.
            LOOP AT <lfs_site_data>-wrf1 ASSIGNING FIELD-SYMBOL(<lfs_wrf1>)." WRF1
              <lfs_wrf1>-locnr = ls_final_site-werks.
              <lfs_wrf1>-ernam = sy-uname. "Created by
              IF ls_final_site-spgr1 IS NOT INITIAL. "Blocking Reason
                <lfs_wrf1>-spgr1 = ls_final_site-spgr1.
              ENDIF.
              IF ls_final_site-spdab IS NOT INITIAL. "Block from
                <lfs_wrf1>-spdab = ls_final_site-spdab.
              ENDIF.
              IF ls_final_site-spdbi IS NOT INITIAL." Block to
                <lfs_wrf1>-spdbi = ls_final_site-spdbi.
              ENDIF.
              IF ls_final_site-wanid IS NOT INITIAL. "Time Key
                <lfs_wrf1>-wanid = ls_final_site-wanid.
              ENDIF.

              IF ls_final_site-eroed IS NOT INITIAL. "Opening Date
                <lfs_wrf1>-eroed = ls_final_site-eroed.
              ENDIF.

              IF ls_final_site-schld IS NOT INITIAL."Closing Date
                <lfs_wrf1>-schld = ls_final_site-schld.
              ENDIF.
            ENDLOOP.

            LOOP AT <lfs_site_data>-tvkwz ASSIGNING FIELD-SYMBOL(<lfs_tvkwz>).
              <lfs_tvkwz>-werks = ls_final_site-werks.
            ENDLOOP.

            LOOP AT <lfs_site_data>-t399d ASSIGNING FIELD-SYMBOL(<lfs_t399d>).
              <lfs_t399d>-werks = ls_final_site-werks.
              <lfs_t399d>-prast = gc_prast.
            ENDLOOP.

            LOOP AT <lfs_site_data>-t159l ASSIGNING FIELD-SYMBOL(<lfs_t159l>).
              <lfs_t159l>-werks = ls_final_site-werks.
            ENDLOOP.

            LOOP AT <lfs_site_data>-t134m ASSIGNING FIELD-SYMBOL(<lfs_t134m>).
              <lfs_t134m>-bwkey = ls_final_site-werks.
            ENDLOOP.

            LOOP AT <lfs_site_data>-t024w ASSIGNING FIELD-SYMBOL(<lfs_t024w>).
              <lfs_t024w>-werks = ls_final_site-werks.
            ENDLOOP.

            LOOP AT <lfs_site_data>-t001k ASSIGNING FIELD-SYMBOL(<lfs_t001k>). "T001K
              IF ls_final_site-werks IS NOT INITIAL.
                <lfs_t001k>-bwkey = ls_final_site-werks.
              ENDIF.
            ENDLOOP.

            LOOP AT <lfs_site_data>-t001l ASSIGNING FIELD-SYMBOL(<lfs_t001l>).
              <lfs_t001l>-werks = ls_final_site-werks.
            ENDLOOP.
**RG01 changes
            LOOP AT <lfs_site_data>-wrf3 ASSIGNING FIELD-SYMBOL(<lfs_wrf3>).
              <lfs_wrf3>-locnr = ls_final_site-werks.
            ENDLOOP.
            LOOP AT <lfs_site_data>-tckm2 ASSIGNING FIELD-SYMBOL(<lfs_tckm2>).
              <lfs_tckm2>-bwkey = ls_final_site-werks.
            ENDLOOP.

            LOOP AT <lfs_site_data>-ckmlab02 ASSIGNING FIELD-SYMBOL(<lfs_ckmlab02>).
              <lfs_ckmlab02>-bwkey = ls_final_site-werks.
            ENDLOOP.

            LOOP AT <lfs_site_data>-tvswz ASSIGNING FIELD-SYMBOL(<lfs_tvswz>).
              <lfs_tvswz>-werks = ls_final_site-werks.
            ENDLOOP.

            LOOP AT <lfs_site_data>-tvstz ASSIGNING FIELD-SYMBOL(<lfs_tvstz>).
              <lfs_tvstz>-werks = ls_final_site-werks.
            ENDLOOP.
          ENDLOOP.

          LOOP AT ls_customer_out-customers ASSIGNING FIELD-SYMBOL(<lfs_customers>).
            <lfs_customers>-header-object_instance-kunnr = ls_final_site-werks.
          ENDLOOP.

          LOOP AT ls_supplier_out-vendors ASSIGNING FIELD-SYMBOL(<lfs_vendors>).
            <lfs_vendors>-header-object_instance-lifnr = ls_final_site-werks.
          ENDLOOP.

          LOOP AT lt_address_data ASSIGNING FIELD-SYMBOL(<lfs_address_data>).
            <lfs_address_data>-t001w-werks = ls_final_site-werks.
            <lfs_address_data>-t001w-kunnr = ls_final_site-werks.
            <lfs_address_data>-t001w-lifnr = ls_final_site-werks.
            <lfs_address_data>-t001w-bwkey = ls_final_site-werks.
          ENDLOOP.
          APPEND ls_add TO lt_address_data_tgt.

*--->Call For Foreground
            CALL FUNCTION 'DISTRIBUTE_SITE_DATA'
              EXPORTING
                iv_distribution     = abap_true
                it_site_data        = lt_site_data
                it_address_data     = lt_address_data
                it_address_trg_data = lt_address_data_tgt
                it_site_distr_tabs  = lt_site_tables
                ip_communication    = gc_communication
                is_customer_out     = ls_customer_out
                is_supplier_out     = ls_supplier_out
              IMPORTING
                et_site             = lt_site_tmp.

*--->Handle Application Log
*--->Application Log For Site
            IF lt_site_tmp IS NOT INITIAL.
                            APPEND LINES OF lt_site_tmp TO lt_site_collect.
            REFRESH lt_site_tmp.
            ENDIF.
          CLEAR :
            lt_address_data,
            lt_address_data_tgt,
            lt_site_tables,
            ls_customer_out,
            ls_supplier_out.
          CLEAR:
                 ls_site_messages.
        ENDLOOP.
        IF lt_site_collect IS NOT INITIAL.
          me->prepare_log_data( it_site_status = lt_site_collect ).
        ENDIF.
       ENDIF.

      ELSE. "Background
      IF gt_site_final IS NOT INITIAL AND lt_site_data IS NOT INITIAL.
        CLEAR gv_queue.
        gv_queue = TEXT-001.
*--->Call For Background
            create_inbound_queue(
              EXPORTING
                iv_site_bp = gv_queue
              IMPORTING
                ev_name = DATA(lv_queue_name) ).
*--->Get The Reference Data From The Site Profile
            CALL FUNCTION 'ZOPSFM_RFC_DISTRIBUTE_SITE' IN BACKGROUND TASK
              AS SEPARATE UNIT DESTINATION gc_destination
              EXPORTING
                iv_distribution     = abap_true
                it_site_data        = lt_site_data
                it_site_final       = gt_site_final
                it_site_exists      = lt_site_exists
                it_bp_exists        = gt_bp_exists.
            COMMIT WORK.
      ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD prepare_log_data.
*&---------------------------------------------------------------------*
*& Method     :PREPARE_LOG_DATA                                        *
*& Description: Fields & Data Mapping From The Excel Sheet Into-       *
*& Internal Table                                                      *
*&---------------------------------------------------------------------*
*--->Prepare Log data for Site
    DATA:ls_bapi_log TYPE cvis_bp_return,"bapiret2,
         lt_bapi_log TYPE cvis_bp_return_t."bapiret2_t.

    CONSTANTS:
         lc_site TYPE char5    VALUE 'Site',
         lc_sixfiftysev TYPE symsgno VALUE '657',
         lc_fourtythree TYPE symsgno VALUE '043',
         lc_fourtyfour TYPE symsgno VALUE '044',
         lc_fourtyfive TYPE symsgno VALUE '045'.

    CLEAR:ls_bapi_log,
          lt_bapi_log.

    LOOP AT it_site_status ASSIGNING FIELD-SYMBOL(<lfs_site_statys>).
      ls_bapi_log-run_id = <lfs_site_statys>-werks.
      ls_bapi_log-type = <lfs_site_statys>-status+0(1).
      IF <lfs_site_statys>-msgid IS NOT INITIAL.
        ls_bapi_log-id = <lfs_site_statys>-msgid.
      ELSE.
        ls_bapi_log-id = gc_message_cls1.
      ENDIF.

      ls_bapi_log-number = <lfs_site_statys>-status+1(3).
      ls_bapi_log-message_v1 = <lfs_site_statys>-werks.
* Manipulate Generic Success/Error Messages into Custom messages
      IF ls_bapi_log-id = gc_message_cls1.
        IF ( ls_bapi_log-type EQ gc_msg_type_s OR
             ls_bapi_log-type EQ gc_msg_type_w OR
             ls_bapi_log-type EQ gc_msg_type_i )
             AND ls_bapi_log-number EQ lc_sixfiftysev. " Success message
              ls_bapi_log-id = gc_message_cls.
              ls_bapi_log-number = lc_fourtythree.
       ENDIF.
      ENDIF.

      APPEND ls_bapi_log TO lt_bapi_log.

      DATA(ls_bapi_log_tmp) = ls_bapi_log.

    AT END OF werks.
      IF ls_bapi_log_tmp-type EQ gc_msg_type_e AND ls_bapi_log_tmp-id NE gc_message_cls. " Error Message
        ls_bapi_log_tmp-id = gc_message_cls.
        ls_bapi_log_tmp-number = lc_fourtyfive.
        ls_bapi_log_tmp-message_v1 = TEXT-012.
        APPEND ls_bapi_log_tmp TO lt_bapi_log.
      ENDIF.
    ENDAT.
      CLEAR:ls_bapi_log,
            ls_bapi_log_tmp.
    ENDLOOP.
*---Save Application Log
    save_appl_log(
      EXPORTING
        it_applog_bp    = lt_bapi_log
        iv_site_bp      = lc_site ).

  ENDMETHOD.


METHOD save_appl_log.
*&---------------------------------------------------------------------*
*& Method     : SAVE_APPL_LOG                                          *
*& Description: Generate Application Log for Business Partneer, Site,  *
*& and Classificaition                                                 *
*&---------------------------------------------------------------------*

*--->Local Data Declaration
  DATA:ls_log_header TYPE bal_s_log,
       lt_messages_p TYPE bal_t_msg_sd,
       ls_messages   TYPE bal_s_msg,
       ls_log_handle TYPE balloghndl,
       lv_msg_logged TYPE boolean,
       lt_bapiret2_t TYPE bapiret2_t,
       lv_message TYPE text132.

  CONSTANTS:
       lc_error TYPE symsgty VALUE 'E',
       lc_collan TYPE c VALUE ':',
       lc_open_braces TYPE c VALUE '[',
       lc_close_braces TYPE c  VALUE ']'.

  CLEAR:ls_log_header,
        lt_messages_p,
        lt_bapiret2_t,
        ls_messages.

  IF it_applog_commn IS NOT SUPPLIED AND it_applog_bp IS NOT INITIAL.
    lt_bapiret2_t = CORRESPONDING #( it_applog_bp ).
  ELSEIF it_applog_commn IS SUPPLIED.
    lt_bapiret2_t = CORRESPONDING #( it_applog_commn ).
  ELSEIF it_applog_commn IS NOT SUPPLIED AND it_applog_bp IS NOT SUPPLIED.
    DATA(lv_site_applog) = abap_true.
  ELSE.
    RETURN.
  ENDIF.
*--->Prepare Log Header
  ls_log_header-object     = gc_appl_object.
  ls_log_header-subobject  = gc_appl_sobject.
  ls_log_header-aldate_del = sy-datum.
  ls_log_header-altime  = sy-uzeit.
  ls_log_header-aluser  = sy-uname.
  ls_log_header-almode  = gc_almode.
  ls_log_header-alstate  = gc_alstate.

*--->Create Log Header
  CALL FUNCTION 'BAL_LOG_CREATE'
    EXPORTING
      i_s_log                 = ls_log_header
    IMPORTING
      e_log_handle            = ls_log_handle
    EXCEPTIONS
      log_header_inconsistent = 1
      OTHERS                  = 2.

  IF sy-subrc <> 0.
    MESSAGE TEXT-009 TYPE gc_msg_type_e.
  ELSE.
*--->Add Corresponding Messages To Log
    LOOP AT it_applog_bp ASSIGNING FIELD-SYMBOL(<lfs_apis_log>).
      CLEAR lv_message.
      MESSAGE ID <lfs_apis_log>-id TYPE <lfs_apis_log>-type
                                   NUMBER <lfs_apis_log>-number
                                   WITH   <lfs_apis_log>-message_v1
                                          <lfs_apis_log>-message_v2
                                          <lfs_apis_log>-message_v3
                                          <lfs_apis_log>-message_v4
                                          INTO lv_message..

      lv_message = | { iv_site_bp } { <lfs_apis_log>-run_id } { lc_collan } { lc_open_braces } { <lfs_apis_log>-id } { <lfs_apis_log>-number } { lc_close_braces } { lv_message } |.

  CALL FUNCTION 'BAL_LOG_MSG_ADD_FREE_TEXT'
    EXPORTING
      i_log_handle     = ls_log_handle
      i_probclass      = '2'
      i_msgty          = <lfs_apis_log>-type
      i_text           = lv_message
    EXCEPTIONS
      log_not_found    = 1
      msg_inconsistent = 2
      log_is_full      = 3
      OTHERS           = 4.
      IF sy-subrc <> 0.
        MESSAGE TEXT-010 TYPE gc_msg_type_e.
      ENDIF.
    ENDLOOP.
  ENDIF.
*--->Check Sucessful Msg Is Added Then Save The Log
  IF sy-subrc EQ 0.
*--->Call FM For Sucessful Msg & Save Log
    CALL FUNCTION 'BAL_DB_SAVE'
      EXPORTING
        i_save_all       = abap_true
      EXCEPTIONS
        log_not_found    = 1
        save_not_allowed = 2
        numbering_error  = 3
        OTHERS           = 4.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
         WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ELSE.
      COMMIT WORK AND WAIT.
    ENDIF.
  ENDIF.

  REFRESH :lt_bapiret2_t.

ENDMETHOD.


    METHOD save_appl_log_1.
*&-------------------------------------------------------------------------*
*& Generate Application Log for Business Partneer, Site, & Classificaition *
*&METHOD IS NOT USING                                                      *
*&-------------------------------------------------------------------------*&
*--->Local Data Declaration
      DATA:ls_log_header TYPE bal_s_log,
           lt_messages_p TYPE bal_t_msg_sd,
           ls_messages   TYPE bal_s_msg,
           ls_log_handle TYPE balloghndl,
           lv_msg_logged TYPE boolean.

      CLEAR:ls_log_header,
            lt_messages_p,
            ls_messages.

*--->Prepare Log Header
      ls_log_header-object     = gc_appl_object.
      ls_log_header-subobject  = gc_appl_sobject.
      ls_log_header-aldate_del = sy-datum.
      ls_log_header-altime  = sy-uzeit.
      ls_log_header-aluser  = sy-uname.
      ls_log_header-almode  = gc_almode.
      ls_log_header-alstate  = gc_alstate.

*--->Create Log Header
      CALL FUNCTION 'BAL_LOG_CREATE'
        EXPORTING
          i_s_log                 = ls_log_header
        IMPORTING
          e_log_handle            = ls_log_handle
        EXCEPTIONS
          log_header_inconsistent = 1
          OTHERS                  = 2.
      IF sy-subrc <> 0.
        MESSAGE TEXT-009 TYPE gc_msg_type_e.
      ELSE.
*--->Add Corresponding Messages To Log
        LOOP AT it_apis_log ASSIGNING FIELD-SYMBOL(<lfs_apis_log>).

          CLEAR:ls_messages.
          ls_messages-msgty = <lfs_apis_log>-type.
          ls_messages-msgid = <lfs_apis_log>-id.
          ls_messages-msgno = <lfs_apis_log>-number.
          ls_messages-msgv1 = <lfs_apis_log>-message_v1.
          ls_messages-msgv2 = <lfs_apis_log>-message_v2.
          ls_messages-msgv3 = <lfs_apis_log>-message_v3.
          ls_messages-msgv4 = <lfs_apis_log>-message_v4.
*--->Call FM & Add. Msg To Log
          CALL FUNCTION 'BAL_LOG_MSG_ADD'
            EXPORTING
              i_log_handle     = ls_log_handle
              i_s_msg          = ls_messages
            IMPORTING
              e_msg_was_logged = lv_msg_logged
            EXCEPTIONS
              log_not_found    = 1
              msg_inconsistent = 2
              log_is_full      = 3
              OTHERS           = 4.

          IF sy-subrc <> 0.
            MESSAGE TEXT-009 TYPE gc_msg_type_e.
          ENDIF.
        ENDLOOP.
      ENDIF.
*--->Check Sucessful Msg Is Added Then Save The Log
      IF sy-subrc EQ 0.
*--->Call FM For Sucessful Msg & Save Log
        CALL FUNCTION 'BAL_DB_SAVE'
          EXPORTING
            i_save_all       = abap_true
          EXCEPTIONS
            log_not_found    = 1
            save_not_allowed = 2
            numbering_error  = 3
            OTHERS           = 4.
        IF sy-subrc <> 0.
          MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
             WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
        ELSE.
          COMMIT WORK AND WAIT.
        ENDIF.
      ENDIF.
    ENDMETHOD.


  METHOD start_bapi_process.
*&---------------------------------------------------------------------*
*& Method     :sTART_BAPI_PROCESS                                      *
*& Description:                                                        *
*&This Method Will Be Called After Excel Data Read Into Internal Table-*
*& and Validations.                                                    *
*& 1.BP creation                                                       *
*& 2.Site Creation                                                     *
*& 3.Classification                                                    *
*&---------------------------------------------------------------------*
*--->Process for Site Creation
    IF gv_app_flag = abap_true.
      prepare_data_create_site( iv_site_prof = iv_site_prof
                                iv_background = iv_background ).
      MESSAGE i054.
*--->Process for Classification Creation
    ELSEIF  gv_app_flag = gc_has_flag_y .
      prepare_data_create_classifica(
        EXPORTING
          iv_background  = iv_background
          it_classf_data =  it_classf_data ).
      MESSAGE i053.
    ELSE.
*--->Process for BP Creation
      prepare_data_create_bp( iv_background = iv_background ).
      MESSAGE i055.
    ENDIF.
    CLEAR: gv_app_flag.
  ENDMETHOD.


  METHOD upload_file.
*&---------------------------------------------------------------------*
*& Method     : UPLOAD_FILE                                            *
*& Description: File Upload Properties and Selection                   *
*&---------------------------------------------------------------------*
*--->Data Declaration
    DATA:
      lv_prestn TYPE string, "File From Presentation/Desktop
      lt_files  TYPE filetable,
      lv_rcode  TYPE int4.

*--->Find File Location
    CALL METHOD cl_gui_frontend_services=>get_desktop_directory
      CHANGING
        desktop_directory    = lv_prestn "Presentation
      EXCEPTIONS
        cntl_error           = 1
        error_no_gui         = 2
        not_supported_by_gui = 3
        OTHERS               = 4.
    IF sy-subrc <> 0.
      MESSAGE e039.
    ENDIF.
*--->Upddate System View
    CALL METHOD cl_gui_cfw=>update_view
      EXCEPTIONS
        cntl_system_error = 1
        cntl_error        = 2
        OTHERS            = 3.
    IF sy-subrc = 0.
*--->Dialog For File Selection
      CALL METHOD cl_gui_frontend_services=>file_open_dialog
        EXPORTING
          window_title            = gc_w_title
          default_extension       = gc_file_typ
          file_filter             = gc_file_typ
          initial_directory       = lv_prestn
        CHANGING
          file_table              = lt_files
          rc                      = lv_rcode
        EXCEPTIONS
          file_open_dialog_failed = 1
          cntl_error              = 2
          error_no_gui            = 3
          not_supported_by_gui    = 4
          OTHERS                  = 5.
      IF sy-subrc <> 0.
        MESSAGE e039.
      ENDIF.
    ENDIF.
*--->Check File Path
    DATA(ls_files) = VALUE #( lt_files[ 1 ] OPTIONAL ).
    IF sy-subrc = 0 AND ls_files IS NOT INITIAL.
      cv_f_path = ls_files-filename.
    ENDIF.

  ENDMETHOD.


  METHOD validation_for_bp_create.
*&---------------------------------------------------------------------*
*& Method     :  VALIDATION_FOR_BP_CREATE                              *
*& Description: Validate BP Excel Data                                 *
*&---------------------------------------------------------------------*
*--->Each Table Has To Be Checked from BP and Required Fields Should Validated
*-->This method can be used after excel read
*    DATA lt_supplier_purch2 TYPE cvis_supplier_purchasing2_t,
    DATA: ls_site_messages TYPE site_status_sty.

*--->Validation For Site Field/If site value is more than 4 char then truncate
*--->So,Validation should be done before feeding to BAPI structure
    LOOP AT gt_supplier_purchasing2 ASSIGNING FIELD-SYMBOL(<lfs_supp_purch>).
      IF <lfs_supp_purch>-werks GT 4.
        ls_site_messages-msgid  = gc_message_cls." Fill the message class and other fields for logs
        INSERT ls_site_messages INTO TABLE gt_message.
        CLEAR : ls_site_messages.
        CONTINUE.
      ENDIF.
*--->Will Have To Delete The Invalid Entries From  Table And Finally All Entries Should Be Moved To Log Table
*    For Application Log And Other Log Entries
    ENDLOOP.

  ENDMETHOD.


  METHOD validation_for_site_create.
*&---------------------------------------------------------------------*
*& Method     : VALIDATION_FOR_SITE_CREATE                             *
*& Description:  Validation For Site Data                              *
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Here Site Validation Is Handled And Converions Validation Is Handled*
*&Separately While Doing Mapping The Excel Data                        *
*&---------------------------------------------------------------------*
    DATA: ls_site_messages    TYPE site_status_sty.
*--->Do The Requried Validations(check FS)
    LOOP AT gt_site_final ASSIGNING FIELD-SYMBOL(<lfs_site_final>).
      IF <lfs_site_final> IS NOT INITIAL.
        "Site validation
        DATA(lv_site) = strlen( <lfs_site_final>-werks ).
        IF lv_site GT 4.
          ls_site_messages-werks = <lfs_site_final>-werks.
          ls_site_messages-msgid  = gc_message_cls.
          INSERT ls_site_messages INTO TABLE gt_message.
          CLEAR:ls_site_messages..
          CONTINUE.
        ENDIF.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
