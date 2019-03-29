*&---------------------------------------------------------------------*
*& Include    : ZOPSR_E002_MASS_SITE_I01 - Data Selection and          *
*& Processing Logic                                                    *
*& Title      : Mass Site Creation Report                              *
*& Transport  : SD2K900117 - D2:OP_DV_E002_Mass Site Creation          *
*& Author     : Shyamkiran Nimbalpudi                                  *
*& Date       : 21/12/2018                                             *
*& Reference  : OPS_MD_E_002 - Functional Design                       *
*& Description: Mass Site Creation Report                              *
*&---------------------------------------------------------------------*
*& Modification History                                                *
*&---------------------------------------------------------------------*
*& Author     :                                                        *
*& Date       :                                                        *
*& Reference  :                                                        *
*& Description:                                                        *
*&---------------------------------------------------------------------*

LOAD-OF-PROGRAM. " Intantiate For Mass Site
  IF go_mass_site_create IS NOT BOUND.
    go_mass_site_create = NEW #( ).
  ENDIF.

START-OF-SELECTION.
*--->Show Message If Atleast One File Is Not Selected from selection screen
  IF  ( p_bp_p IS INITIAL OR p_site_p IS INITIAL )
       AND ( p_clsf_p IS INITIAL ).
    MESSAGE i018 DISPLAY LIKE zcl_ops_mass_site_creation=>gc_msg_type_e.
    EXIT.
  ENDIF.

  IF sy-batch IS NOT INITIAL OR rb_bgrd IS NOT INITIAL.
    DATA(gv_batch) = abap_true.
  ENDIF.

*--->Check Instances
  CHECK go_mass_site_create IS BOUND.

  IF rb_bgrd = abap_false. "Foreground
*--->Business Partner
    IF p_bp_p IS NOT INITIAL.
      go_mass_site_create->get_excel_data(
        EXPORTING
          iv_site_prof = p_s_prof
          iv_f_path = p_bp_p ).
      CLEAR: p_bp_p.

    ENDIF.
*--->Site Data
    IF p_site_p IS NOT INITIAL.
      go_mass_site_create->get_excel_data(
        EXPORTING
          iv_flag   =  abap_true
          iv_site_prof = p_s_prof
          iv_f_path = p_site_p ).
      CLEAR: p_site_p.

    ENDIF.
*--->Classification Data
    IF ( p_clsf_p IS NOT INITIAL AND cb_clsf = abap_true ) OR
       ( p_clsf_p IS NOT INITIAL AND cb_clsf = abap_false ).
      go_mass_site_create->get_excel_data(
        EXPORTING
          iv_flag   = gc_flag_y
          iv_site_prof =  p_s_prof
          iv_f_path =  p_clsf_p ).
      CLEAR: p_clsf_p.

    ENDIF.

*--->Display Messages
  MESSAGE TEXT-004 TYPE gc_success.
  ELSE."Start Background Process

    IF gv_batch IS NOT INITIAL.

*--->Business Partner
      IF p_bp_p IS NOT INITIAL.
        go_mass_site_create->get_excel_data(
          EXPORTING
            iv_f_path =  p_bp_p
            iv_site_prof = p_s_prof
            iv_background = gv_batch ).
        CLEAR: p_bp_p.
      ENDIF.
*--->Site Data
      IF p_site_p IS NOT INITIAL.
        go_mass_site_create->get_excel_data(
          EXPORTING
            iv_f_path = p_site_p
            iv_flag   =  abap_true
            iv_site_prof = p_s_prof
            iv_background = gv_batch ).
        CLEAR: p_site_p.
      ENDIF.
*--->Classification Data
      IF ( p_clsf_p IS NOT INITIAL AND cb_clsf = abap_true ) OR
       ( p_clsf_p IS NOT INITIAL AND cb_clsf = abap_false ).
        go_mass_site_create->get_excel_data(
          EXPORTING
            iv_flag   = gc_flag_y
            iv_site_prof =  p_s_prof
            iv_background = gv_batch
            iv_f_path =  p_clsf_p ).
        CLEAR: p_clsf_p.
      ENDIF.

      MESSAGE TEXT-004 TYPE gc_success.
    ENDIF.
  ENDIF.
