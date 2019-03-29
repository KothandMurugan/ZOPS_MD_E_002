*&---------------------------------------------------------------------*
*& Include    :ZOPSR_E002_MASS_SITE_O01- Screen Level Events-          *
*& Handling & Screen Modification                                      *
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

*--->Dynamic Handling of Selection Screen Parameters
AT SELECTION-SCREEN OUTPUT.

  IF cb_clsf IS NOT INITIAL. " When 'Only Classification' Flag Is Enabled
    CLEAR :p_bp_p,p_site_p.
    LOOP AT SCREEN. "Disable BP & Site File Path
      IF screen-name EQ gc_par_bp.
        screen-input = gc_zero.
        MODIFY SCREEN.
      ENDIF.
      IF screen-name EQ gc_par_site.
        screen-input = gc_zero .
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ENDIF.

*--->Screen Level Validation For Site Profile
AT SELECTION-SCREEN ON p_s_prof.
  DATA: lv_error TYPE c.
  IF p_s_prof IS NOT INITIAL.
    SELECT SINGLE ref_wkfil, bp_grp_site
       FROM twrf2 INTO (@go_mass_site_create->gv_ref_site,
                        @go_mass_site_create->gv_bp_group  )
    WHERE  betrp = @p_s_prof.
    IF sy-subrc <> 0.
      MESSAGE e017.
    ELSEIF go_mass_site_create->gv_ref_site IS INITIAL
           OR go_mass_site_create->gv_bp_group IS INITIAL.
      MESSAGE e040.
    ENDIF.

*- Company Code Authority Check on Reference Site
   SELECT SINGLE bukrs FROM t001k INTO @DATA(lv_company) WHERE bwkey EQ @go_mass_site_create->gv_ref_site.
     IF sy-subrc EQ 0.
        CALL METHOD zcl_ops_mass_site_creation=>authority_check
          EXPORTING
            iv_bukrs            = lv_company
          IMPORTING
            ev_vim_abort_saving = lv_error.
        IF lv_error IS NOT INITIAL.
           DATA(lv_message) = | { lv_company } { TEXT-005 } { go_mass_site_create->gv_ref_site } |.
           MESSAGE e049 WITH lv_message.
           CLEAR lv_error.
        ENDIF.

     ENDIF.
  ENDIF.

*--->Upload Files Enablement
AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_bp_p.
*--->File Selection for Business Partner(BP)
*--->Create Object Reference
  CHECK go_mass_site_create IS BOUND.
  go_mass_site_create->upload_file(
    CHANGING
      cv_f_path = p_bp_p ).

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_site_p.
*--->File Selection for Site
  CHECK go_mass_site_create IS BOUND.
  go_mass_site_create->upload_file(
  CHANGING
    cv_f_path = p_site_p ).

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_clsf_p.
*--->File Selection For Classification
  CHECK go_mass_site_create IS BOUND.
  go_mass_site_create->upload_file(
  CHANGING
    cv_f_path = p_clsf_p ).

AT SELECTION-SCREEN ON p_bp_p.
*- File Existance Check
  IF p_bp_p IS NOT INITIAL.
  gv_file_path = p_bp_p.
  IF gv_file_path IS NOT INITIAL.
    CALL METHOD cl_gui_frontend_services=>file_exist
      EXPORTING
        file                 = gv_file_path
      RECEIVING
        result               = DATA(lv_file_exists)
      EXCEPTIONS
        cntl_error           = 1
        error_no_gui         = 2
        wrong_parameter      = 3
        not_supported_by_gui = 4
        OTHERS               = 5.
    IF lv_file_exists IS INITIAL.
       MESSAGE e052.
    ENDIF.

  ENDIF.
  CLEAR gv_file_path.
  ENDIF.

AT SELECTION-SCREEN ON p_site_p.
*- File Existance Check
  IF p_site_p IS NOT INITIAL.
  gv_file_path = p_site_p.
  IF gv_file_path IS NOT INITIAL.
    CALL METHOD cl_gui_frontend_services=>file_exist
      EXPORTING
        file                 = gv_file_path
      RECEIVING
        result               = DATA(lv_file_exists)
      EXCEPTIONS
        cntl_error           = 1
        error_no_gui         = 2
        wrong_parameter      = 3
        not_supported_by_gui = 4
        OTHERS               = 5.
    IF lv_file_exists IS INITIAL.
       MESSAGE e052.
    ENDIF.

  ENDIF.
  CLEAR gv_file_path.
  ENDIF.

AT SELECTION-SCREEN ON p_clsf_p.
*- File Existance Check
  IF p_clsf_p IS NOT INITIAL.
  gv_file_path = p_clsf_p.
  IF gv_file_path IS NOT INITIAL.
    CALL METHOD cl_gui_frontend_services=>file_exist
      EXPORTING
        file                 = gv_file_path
      RECEIVING
        result               = DATA(lv_file_exists)
      EXCEPTIONS
        cntl_error           = 1
        error_no_gui         = 2
        wrong_parameter      = 3
        not_supported_by_gui = 4
        OTHERS               = 5.
    IF lv_file_exists IS INITIAL.
       MESSAGE e052.
    ENDIF.

  ENDIF.
  CLEAR gv_file_path.
  ENDIF.
