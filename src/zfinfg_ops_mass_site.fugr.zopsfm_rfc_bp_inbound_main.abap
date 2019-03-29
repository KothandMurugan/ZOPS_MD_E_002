FUNCTION zopsfm_rfc_bp_inbound_main.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_DOCOMMIT) TYPE  SWO_COMMIT DEFAULT 'X'
*"     VALUE(IV_CREATE_APPLOG) TYPE  BOOLEAN OPTIONAL
*"     VALUE(IV_SUPPRESS_TAXJUR_CHECK) TYPE  BOOLEAN OPTIONAL
*"     VALUE(IV_QUEUE_NAME) TYPE  TRFCQNAM OPTIONAL
*"  TABLES
*"      T_BP_GENERAL STRUCTURE  CVIS_BP_GENERAL
*"      T_BP_ROLE STRUCTURE  CVIS_BP_ROLE
*"      T_BP_INDUSTRY STRUCTURE  CVIS_BP_INDUSTRY OPTIONAL
*"      T_BP_IDENT_NUMBERS STRUCTURE  CVIS_BP_IDENT_NUMBERS OPTIONAL
*"      T_BP_BANK_DETAILS STRUCTURE  CVIS_BP_BANK_DETAILS OPTIONAL
*"      T_BP_TAX_NUMBER STRUCTURE  CVIS_BP_TAX_NUMBER OPTIONAL
*"      T_BP_TAX_NUMBER_COMMON STRUCTURE  CVIS_BP_TAX_NUMBER_COMMON
*"       OPTIONAL
*"      T_BP_ADDRESS STRUCTURE  CVIS_BP_ADDRESS OPTIONAL
*"      T_BP_ADDRESS_USAGE STRUCTURE  CVIS_BP_ADDRESS_USAGE OPTIONAL
*"      T_BP_ADDRESS_TELENO STRUCTURE  CVIS_BP_ADDRESS_TELENO OPTIONAL
*"      T_BP_ADDRESS_TELENO_REMARKS STRUCTURE
*"        CVIS_ADDRESS_TELNO_REMARKS OPTIONAL
*"      T_BP_ADDRESS_FAXNO STRUCTURE  CVIS_BP_ADDRESS_FAXNO OPTIONAL
*"      T_BP_ADDRESS_EMAIL STRUCTURE  CVIS_BP_ADDRESS_EMAIL OPTIONAL
*"      T_BP_ADDRESS_EMAIL_REMARKS STRUCTURE
*"        CVIS_ADDRESS_EMAIL_REMARKS OPTIONAL
*"      T_BP_ADDRESS_URI STRUCTURE  CVIS_BP_ADDRESS_URL OPTIONAL
*"      T_BP_RELATIONS STRUCTURE  CVIS_BP_RELATION OPTIONAL
*"      T_BP_FINSERV STRUCTURE  CVIS_BP_FINSERV OPTIONAL
*"      T_CUST_GENERAL STRUCTURE  CVIS_CUSTOMER_GENERAL OPTIONAL
*"      T_CUST_GENERAL_CREDITCARD STRUCTURE  CVIS_CUSTOMER_CREDITCARD
*"       OPTIONAL
*"      T_CUST_GENERAL_TEXTS STRUCTURE  CVIS_CUSTOMER_GEN_TEXTS
*"       OPTIONAL
*"      T_CUST_GENERAL_LOADING STRUCTURE  CVIS_CUSTOMER_LOADING
*"       OPTIONAL
*"      T_CUST_GENERAL_EXPORT STRUCTURE  CVIS_CUSTOMER_EXPORT OPTIONAL
*"      T_CUST_GENERAL_ALT_PAYEE STRUCTURE  CVIS_CUSTOMER_ALT_PAYEE
*"       OPTIONAL
*"      T_CUST_COMPANY STRUCTURE  CVIS_CUSTOMER_COMPANY OPTIONAL
*"      T_CUST_COMPANY_WTAX STRUCTURE  CVIS_CUSTOMER_WTAX OPTIONAL
*"      T_CUST_COMPANY_TEXTS STRUCTURE  CVIS_CUSTOMER_CC_TEXTS OPTIONAL
*"      T_CUST_COMPANY_ALT_PAYEE STRUCTURE  CVIS_CUSTOMER_ALT_PAYEE
*"       OPTIONAL
*"      T_CUST_SALES STRUCTURE  CVIS_CUSTOMER_SALES OPTIONAL
*"      T_CUST_SALES_TEXTS STRUCTURE  CVIS_CUSTOMER_SALES_TEXTS
*"       OPTIONAL
*"      T_CUST_COMP_DUNNING STRUCTURE  CVIS_CUSTOMER_COMP_DUNNING
*"       OPTIONAL
*"      T_CUST_SALES_FUNCTIONS STRUCTURE  CVIS_CUSTOMER_SALES_FUNC
*"       OPTIONAL
*"      T_CUST_TAX_INDICATOR STRUCTURE  CVIS_CUSTOMER_TAX_INDICATOR
*"       OPTIONAL
*"      T_CUST_CONTACTS STRUCTURE  CVIS_CUSTOMER_CONTACTS OPTIONAL
*"      T_CUST_CONT_ADDRESS1 STRUCTURE  CVIS_CUST_CONT_ADDRESS1
*"       OPTIONAL
*"      T_CUST_CONT_ADDRESS2 STRUCTURE  CVIS_CUST_CONT_ADDRESS2
*"       OPTIONAL
*"      T_CUST_CONT_ADDRESS3 STRUCTURE  CVIS_CUST_CONT_ADDRESS3
*"       OPTIONAL
*"      T_CUST_CONT_TELENO1 STRUCTURE  CVIS_CUST_CONT_TELENO1 OPTIONAL
*"      T_CUST_CONT_TELENO2 STRUCTURE  CVIS_CUST_CONT_TELENO2 OPTIONAL
*"      T_CUST_CONT_TELENO3 STRUCTURE  CVIS_CUST_CONT_TELENO3 OPTIONAL
*"      T_CUST_CONT_FAX1 STRUCTURE  CVIS_CUST_CONT_FAX1 OPTIONAL
*"      T_CUST_CONT_FAX2 STRUCTURE  CVIS_CUST_CONT_FAX2 OPTIONAL
*"      T_CUST_CONT_FAX3 STRUCTURE  CVIS_CUST_CONT_FAX3 OPTIONAL
*"      T_CUST_CONT_EMAIL1 STRUCTURE  CVIS_CUST_CONT_EMAIL1 OPTIONAL
*"      T_CUST_CONT_EMAIL2 STRUCTURE  CVIS_CUST_CONT_EMAIL2 OPTIONAL
*"      T_CUST_CONT_EMAIL3 STRUCTURE  CVIS_CUST_CONT_EMAIL3 OPTIONAL
*"      T_CUST_CONT_TEXTS STRUCTURE  CVIS_CUSTOMER_CONTACT_TEXTS
*"       OPTIONAL
*"      T_CUST_GENERAL_VAT STRUCTURE  CVIS_CUSTOMER_GENERAL_VAT
*"       OPTIONAL
*"      T_SUP_GENERAL_ALT_PAYEE STRUCTURE  CVIS_SUPPLIER_ALT_PAYEE
*"       OPTIONAL
*"      T_SUP_GENERAL STRUCTURE  CVIS_SUPPLIER_GENERAL OPTIONAL
*"      T_SUP_GENERAL_TEXTS STRUCTURE  CVIS_SUPPLIER_GEN_TEXTS OPTIONAL
*"      T_SUP_COMPANY STRUCTURE  CVIS_SUPPLIER_COMPANY OPTIONAL
*"      T_SUP_COMPANY_TEXTS STRUCTURE  CVIS_SUPPLIER_CC_TEXTS OPTIONAL
*"      T_SUP_COMPANY_WTAX STRUCTURE  CVIS_SUPPLIER_COMPANY_WTAX
*"       OPTIONAL
*"      T_SUP_COMPANY_ALT_PAYEE STRUCTURE  CVIS_SUPPLIER_ALT_PAYEE
*"       OPTIONAL
*"      T_SUP_PURCHASING_TEXTS STRUCTURE  CVIS_SUPPLIER_PORG_TEXTS
*"       OPTIONAL
*"      T_SUP_PURCHASING STRUCTURE  CVIS_SUPPLIER_PURCHASING OPTIONAL
*"      T_SUP_PURCHASING2 STRUCTURE  CVIS_SUPPLIER_PURCHASING2 OPTIONAL
*"      T_SUP_PURCH_FUNCTIONS STRUCTURE  CVIS_SUPPLIER_PURCH_FUNC
*"       OPTIONAL
*"      T_SUPPLIER_CONTACTS STRUCTURE  CVIS_SUPPLIER_CONTACTS OPTIONAL
*"      T_SUP_CONT_ADDRESS1 STRUCTURE  CVIS_SUPP_CONT_ADDRESS1 OPTIONAL
*"      T_SUP_CONT_ADDRESS2 STRUCTURE  CVIS_SUPP_CONT_ADDRESS2 OPTIONAL
*"      T_SUP_CONT_ADDRESS3 STRUCTURE  CVIS_SUPP_CONT_ADDRESS3 OPTIONAL
*"      T_SUP_CONT_TELENO1 STRUCTURE  CVIS_SUPP_CONT_TELENO1 OPTIONAL
*"      T_SUP_CONT_TELENO2 STRUCTURE  CVIS_SUPP_CONT_TELENO2 OPTIONAL
*"      T_SUP_CONT_TELENO3 STRUCTURE  CVIS_SUPP_CONT_TELENO3 OPTIONAL
*"      T_SUP_CONT_FAX1 STRUCTURE  CVIS_SUPP_CONT_FAX1 OPTIONAL
*"      T_SUP_CONT_FAX2 STRUCTURE  CVIS_SUPP_CONT_FAX2 OPTIONAL
*"      T_SUP_CONT_FAX3 STRUCTURE  CVIS_SUPP_CONT_FAX3 OPTIONAL
*"      T_SUP_CONT_EMAIL1 STRUCTURE  CVIS_SUPP_CONT_EMAIL1 OPTIONAL
*"      T_SUP_CONT_EMAIL2 STRUCTURE  CVIS_SUPP_CONT_EMAIL2 OPTIONAL
*"      T_SUP_CONT_EMAIL3 STRUCTURE  CVIS_SUPP_CONT_EMAIL3 OPTIONAL
*"      T_SUP_GENERAL_VAT STRUCTURE  CVIS_SUPPLIER_GENERAL_VAT OPTIONAL
*"      T_RETURN STRUCTURE  CVIS_BP_RETURN OPTIONAL
*"----------------------------------------------------------------------

  DATA : lo_ref_ms    TYPE REF TO zcl_ops_mass_site_creation,
         lt_bp_return TYPE cvis_bp_return_t,
         lt_return    TYPE cvis_bp_return_t.

    CONSTANTS:
      lc_messageid TYPE symsgid VALUE 'ZOPS',
      lc_number    TYPE symsgno VALUE '022',
      lc_error_num TYPE symsgno VALUE '037',
      lc_type      TYPE bapi_mtype VALUE 'S',
      lc_error     TYPE bapi_mtype VALUE 'E',
      lc_bp        TYPE char5    VALUE 'BP'.

  IF lo_ref_ms IS NOT BOUND.
    lo_ref_ms = NEW #( ).

*--->If required Queue logic shoul be handled
* iv_queue_name
*--->Call Main FM For BP Creation
  IF t_bp_general[] IS NOT INITIAL.
  CALL FUNCTION 'RFC_CVI_EI_INBOUND_MAIN'
    EXPORTING
      iv_docommit                  = iv_docommit
      iv_create_applog             = iv_create_applog
      iv_suppress_taxjur_check     = iv_suppress_taxjur_check
    TABLES
      it_bp_general                = t_bp_general
      it_bp_role                   = t_bp_role
      it_bp_industry               = t_bp_industry
      it_bp_ident_numbers          = t_bp_ident_numbers
      it_bp_bank_details           = t_bp_bank_details
      it_bp_tax_number             = t_bp_tax_number
      it_bp_tax_number_common      = t_bp_tax_number_common
      it_bp_address                = t_bp_address
      it_bp_address_usage          = t_bp_address_usage
      it_bp_address_teleno         = t_bp_address_teleno
      it_bp_address_teleno_remarks = t_bp_address_teleno_remarks
      it_bp_address_faxno          = t_bp_address_faxno
      it_bp_address_email          = t_bp_address_email
      it_bp_address_email_remarks  = t_bp_address_email_remarks
      it_bp_address_uri            = t_bp_address_uri
      it_bp_relations              = t_bp_relations
      it_bp_finserv                = t_bp_finserv
      it_cust_general              = t_cust_general
      it_cust_general_creditcard   = t_cust_general_creditcard
      it_cust_general_texts        = t_cust_general_texts
      it_cust_general_loading      = t_cust_general_loading
      it_cust_general_export       = t_cust_general_export
      it_cust_general_alt_payee    = t_cust_general_alt_payee
      it_cust_company              = t_cust_company
      it_cust_company_wtax         = t_cust_company_wtax
      it_cust_company_texts        = t_cust_company_texts
      it_cust_company_alt_payee    = t_cust_company_alt_payee
      it_cust_sales                = t_cust_sales
      it_cust_sales_texts          = t_cust_sales_texts
      it_cust_comp_dunning         = t_cust_comp_dunning
      it_cust_sales_functions      = t_cust_sales_functions
      it_cust_tax_indicator        = t_cust_tax_indicator
      it_cust_contacts             = t_cust_contacts
      it_cust_cont_address1        = t_cust_cont_address1
      it_cust_cont_address2        = t_cust_cont_address2
      it_cust_cont_address3        = t_cust_cont_address3
      it_cust_cont_teleno1         = t_sup_cont_teleno1
      it_cust_cont_teleno2         = t_sup_cont_teleno2
      it_cust_cont_teleno3         = t_sup_cont_teleno3
      it_cust_cont_fax1            = t_sup_cont_fax1
      it_cust_cont_fax2            = t_sup_cont_fax2
      it_cust_cont_fax3            = t_sup_cont_fax3
      it_cust_cont_email1          = t_sup_cont_email1
      it_cust_cont_email2          = t_sup_cont_email2
      it_cust_cont_email3          = t_sup_cont_email3
      it_cust_cont_texts           = t_cust_cont_texts
      it_cust_general_vat          = t_cust_general_vat
      it_sup_general_alt_payee     = t_sup_general_alt_payee
      it_sup_general               = t_sup_general
      it_sup_general_texts         = t_sup_general_texts
      it_sup_company               = t_sup_company
      it_sup_company_texts         = t_sup_company_texts
      it_sup_company_wtax          = t_sup_company_wtax
      it_sup_company_alt_payee     = t_sup_company_alt_payee
      it_sup_purchasing_texts      = t_sup_purchasing_texts
      it_sup_purchasing            = t_sup_purchasing
      it_sup_purchasing2           = t_sup_purchasing2
      it_sup_purch_functions       = t_sup_purch_functions
      it_supplier_contacts         = t_supplier_contacts
      it_sup_cont_address1         = t_sup_cont_address1
      it_sup_cont_address2         = t_sup_cont_address2
      it_sup_cont_address3         = t_sup_cont_address3
      it_sup_cont_teleno1          = t_sup_cont_teleno1
      it_sup_cont_teleno2          = t_sup_cont_teleno2
      it_sup_cont_teleno3          = t_sup_cont_teleno3
      it_sup_cont_fax1             = t_sup_cont_fax1
      it_sup_cont_fax2             = t_sup_cont_fax2
      it_sup_cont_fax3             = t_sup_cont_fax3
      it_sup_cont_email1           = t_sup_cont_email1
      it_sup_cont_email2           = t_sup_cont_email2
      it_sup_cont_email3           = t_sup_cont_email3
      it_sup_general_vat           = t_sup_general_vat
      ct_return                    = t_return.
      ENDIF.

      LOOP AT t_return ASSIGNING FIELD-SYMBOL(<lfs_return>).
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
              APPEND ls_return_n TO t_return.
              CLEAR: ls_return_n.
           ENDIF.
           CLEAR: lv_flag.
         ENDAT.
      ENDLOOP.

      IF lt_return IS NOT INITIAL.
         APPEND LINES OF lt_return TO t_return.
      ENDIF.

      SORT t_return BY run_id.

*--->"check later if any changes needs to be done
*  COMMIT WORK AND WAIT.
*--->Handle Application Log
  IF t_return[] IS NOT INITIAL.
    lo_ref_ms->save_appl_log(
      EXPORTING
        it_applog_bp    = t_return[]
        iv_site_bp      = lc_bp ).
  ENDIF.
  ENDIF.
ENDFUNCTION.
