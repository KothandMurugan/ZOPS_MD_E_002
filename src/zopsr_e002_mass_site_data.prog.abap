*&---------------------------------------------------------------------*
*& Include    : ZOPSR_E002_MASS_SITE_DATA                              *
*& Title      : Business Partner Relationship Maintenance              *
*& Transport  : SD2K900117 - D2:OP_DV_E002_Mass Site Creation          *
*& Author     : Shyamkiran Nimbalpudi                                  *
*& Date       : 21/12/2018                                             *
*& Reference  : OPS_MD_E_002 - Functional Design                       *
*& Description: Business Partner Relationship Maintenance              *
*&---------------------------------------------------------------------*
*& Modification History                                                *
*&---------------------------------------------------------------------*
*& Author     :                                                        *
*& Date       :                                                        *
*& Reference  :                                                        *
*& Description:                                                        *
*&---------------------------------------------------------------------*

LOAD-OF-PROGRAM."Instatiate For Boe The Classes
  IF go_ref  IS NOT BOUND.
    go_ref = NEW #( ).
  ENDIF.

  IF go_ref_rel IS NOT BOUND.
    go_ref_rel = NEW #( ).
  ENDIF.

START-OF-SELECTION.

  IF ( rb_add = abap_true OR rb_dele = abap_true ).

    IF rb_bgrd = abap_true.
      DATA(gv_background) = abap_true.
    ENDIF.

    IF rb_add = abap_true.
      gv_db_mode = gc_db_i.
    ELSEIF  rb_dele = abap_true.
      gv_db_mode = gc_db_d.
    ENDIF.

    IF rb_contp = abap_true AND rb_cust  = abap_true.
      gv_rel_cat_flag = gc_cpc.
    ELSEIF rb_contp = abap_true AND rb_vend = abap_true.
      gv_rel_cat_flag = gc_cpv.
    ELSEIF rb_i_c_v = abap_true.
      gv_rel_cat_flag = gc_i_cv.
    ENDIF.

    IF  ( p_bp_rel IS INITIAL ).
      MESSAGE i018.
      RETURN.
    ENDIF.
    IF gv_background IS INITIAL. "For foreground Run
    "Convert and Map BP Relationship
    IF p_bp_rel IS NOT INITIAL. " BP Relationship
      CHECK go_ref IS BOUND.
      go_ref->get_excel_data(
        EXPORTING
          iv_flag             = gc_reltyp_flag
          iv_f_path           = p_bp_rel
        IMPORTING
          et_relship_data     = DATA(gt_relship_data) "Local table : Really required for Global naming convension
        EXCEPTIONS
          no_valid_data_found = 1
          OTHERS              = 2 ).

      IF sy-subrc <> 0.
        MESSAGE e036.
      ENDIF.

      IF sy-subrc = 0.
        CHECK go_ref_rel IS BOUND.
        go_ref_rel->validate_and_start_process(
          EXPORTING
            it_bp_rel           = gt_relship_data
            iv_rel_cat_flag     = gv_rel_cat_flag
            iv_db_operation     = gv_db_mode
          EXCEPTIONS
            no_valid_data_found = 1
            OTHERS              = 2 ).
        IF sy-subrc <> 0.
          MESSAGE e036.
        ENDIF.
      ELSE.
        MESSAGE e037.
      ENDIF.
      CLEAR: p_bp_rel.
    ENDIF.

    ELSE. "For background Run
      CHECK  go_ref IS BOUND.
      go_ref->get_excel_data(
        EXPORTING
          iv_flag             = gc_reltyp_flag
          iv_f_path           = p_bp_rel
        IMPORTING
          et_relship_data     = gt_relship_data
        EXCEPTIONS
          no_valid_data_found = 1
          OTHERS              = 2 ).

      IF sy-subrc = 0.
        CHECK go_ref_rel IS BOUND.
        go_ref_rel->validate_and_start_process(
          EXPORTING
            it_bp_rel           = gt_relship_data
            iv_rel_cat_flag     = gv_rel_cat_flag
            iv_db_operation     = gv_db_mode
            iv_background       = gv_background
          EXCEPTIONS
            no_valid_data_found = 1
            OTHERS              = 2
        ).
        IF sy-subrc <> 0.
          MESSAGE e036.
        ENDIF.
      ELSE.
        MESSAGE e037.
      ENDIF.
      CLEAR: p_bp_rel.
    ENDIF.

    MESSAGE TEXT-004 TYPE gc_success.
    LEAVE LIST-PROCESSING.
  ENDIF.
