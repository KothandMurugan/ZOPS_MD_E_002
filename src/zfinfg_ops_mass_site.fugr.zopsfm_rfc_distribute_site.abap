FUNCTION zopsfm_rfc_distribute_site.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_DISTRIBUTION) TYPE  CHAR1 DEFAULT 'X'
*"     VALUE(IT_SITE_DATA) TYPE  SITE_DISTR_SITE_TTY
*"     VALUE(IT_SITE_DATA_TRG) TYPE  SITE_DISTR_SITE_TTY OPTIONAL
*"     VALUE(IT_ADDRESS_DATA) TYPE  SITE_DISTR_ADDRESS_TTY
*"     VALUE(IT_ADDRESS_TRG_DATA) TYPE  SITE_DISTR_ADDRESS_TTY OPTIONAL
*"     VALUE(IT_SITE_DISTR_TABS) TYPE  SITE_DISTR_TABS_TTY OPTIONAL
*"     VALUE(IS_CUSTOMER_OUT) TYPE  CMDS_EI_MAIN OPTIONAL
*"     VALUE(IS_SUPPLIER_OUT) TYPE  VMDS_EI_MAIN OPTIONAL
*"     VALUE(IV_SOURCE_BS) TYPE  SLD_BSKEY OPTIONAL
*"     VALUE(IV_QUEUE_NAME) TYPE  TRFCQNAM OPTIONAL
*"     VALUE(IT_SITE_FINAL) TYPE  ZTMSITE_FINAL
*"     VALUE(IT_SITE_EXISTS) TYPE  ZTMSITE_FINAL OPTIONAL
*"     VALUE(IT_BP_EXISTS) TYPE  ZTOPS_BP OPTIONAL
*"  EXPORTING
*"     VALUE(ET_SITE) TYPE  ZTOPS_SITE_STATUS_TTY
*"----------------------------------------------------------------------

*--->Data Declaration
    DATA:
      lt_site_data        TYPE  site_distr_site_tty,
      lt_address_data     TYPE  site_distr_address_tty,
      lt_address_data_tgt TYPE  site_distr_address_tty,
      lt_site_tables      TYPE  site_distr_tabs_tty,
      ls_customer_out     TYPE  cmds_ei_main,
      ls_supplier_out     TYPE  vmds_ei_main,
      lt_site_tmp         TYPE  site_status_tty,
      ls_add              TYPE  site_distr_address_sty,
      ls_site_messages    TYPE site_status_sty,
      lt_site_collect     TYPE  ztops_site_status_tty,
      lo_ref_ms TYPE REF TO zcl_ops_mass_site_creation.

    CONSTANTS:
      lc_msg_type_i TYPE char1 VALUE 'I',
      lc_prast      TYPE prast VALUE 'S',
      lc_communication TYPE char7 VALUE 'S4H_S4H',
      lc_site_exists TYPE char4 VALUE 'E036',
      lc_message_cls TYPE symsgid VALUE 'ZOPS',
      lc_bp_exists TYPE char4 VALUE 'E045'.

  IF lo_ref_ms IS NOT BOUND.
    lo_ref_ms = NEW #( ).
  ENDIF.

*--->Final Table Site Master
      IF it_site_final IS NOT INITIAL AND it_site_data IS NOT INITIAL.
        LOOP AT it_site_final INTO DATA(ls_final_site).
* Populate Message saying Site Already Exists
          IF line_exists( it_site_exists[ werks = ls_final_site-werks ] ).
            ls_site_messages-werks = ls_final_site-werks.
            ls_site_messages-status = lc_site_exists.
            ls_site_messages-msgid  = lc_message_cls.
            APPEND ls_site_messages TO lt_site_collect.
            CLEAR ls_site_messages.
             CONTINUE.
          ENDIF.

          IF NOT line_exists( it_bp_exists[ partner = ls_final_site-werks ] ).
            ls_site_messages-werks = ls_final_site-werks.
            ls_site_messages-status = lc_bp_exists.
            ls_site_messages-msgid  = lc_message_cls.
            APPEND ls_site_messages TO lt_site_collect.
            CLEAR ls_site_messages.
             CONTINUE.
          ENDIF.

          LOOP AT it_site_data ASSIGNING FIELD-SYMBOL(<lfs_site_data>)." T001W
            <lfs_site_data>-db_funtion = lc_msg_type_i.
            <lfs_site_data>-t001w-werks  = ls_final_site-werks.
            <lfs_site_data>-t001w-bwkey  = ls_final_site-werks.
            <lfs_site_data>-t001w-kunnr  = ls_final_site-werks.
            <lfs_site_data>-t001w-lifnr  = ls_final_site-werks.
            CLEAR: <lfs_site_data>-t001w-adrnr.
            LOOP AT <lfs_site_data>-wrf1 ASSIGNING FIELD-SYMBOL(<lfs_wrf1>)." WRF1
              <lfs_wrf1>-locnr = ls_final_site-werks.
              <lfs_wrf1>-ernam = sy-uname. "Created By
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

            LOOP AT <lfs_site_data>-tvstz ASSIGNING FIELD-SYMBOL(<lfs_tvstz>).
              <lfs_tvstz>-werks = ls_final_site-werks.
            ENDLOOP.

            LOOP AT <lfs_site_data>-t399d ASSIGNING FIELD-SYMBOL(<lfs_t399d>).
              <lfs_t399d>-werks = ls_final_site-werks.
              <lfs_t399d>-prast = lc_prast.
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

            CALL FUNCTION 'DISTRIBUTE_SITE_DATA'
              EXPORTING
                iv_distribution     = iv_distribution
                it_site_data        = it_site_data
                it_address_data     = lt_address_data
                it_address_trg_data = lt_address_data_tgt
                it_site_distr_tabs  = lt_site_tables
                ip_communication    = lc_communication
                is_customer_out     = ls_customer_out
                is_supplier_out     = ls_supplier_out
              IMPORTING
                et_site             = lt_site_tmp.
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
        ENDLOOP.

*--->Handle Application Log
         IF lo_ref_ms IS BOUND AND lt_site_collect IS NOT INITIAL.
*--->Application Log For Site
          lo_ref_ms->prepare_log_data( it_site_status = lt_site_collect ).
         ENDIF.
       ENDIF.

ENDFUNCTION.
