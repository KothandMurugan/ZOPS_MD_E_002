*----------------------------------------------------------------------*
***INCLUDE LZOPSFG_MAT_LEDGRF01.
*----------------------------------------------------------------------*
* Authority Check for User at Company Code level
FORM zauthority_check.
  CONSTANTS: lc_update TYPE c VALUE 'U'.

 IF zvops_t001kml_total[] IS NOT INITIAL. "Activation of Material Ledger View
  LOOP AT zvops_t001kml_total ASSIGNING FIELD-SYMBOL(<lfs_zvops_t001kml_total>) WHERE action = lc_update.

   CALL METHOD zcl_ops_mass_site_creation=>authority_check
     EXPORTING
       iv_bukrs            = <lfs_zvops_t001kml_total>-bukrs
     IMPORTING
       ev_vim_abort_saving = vim_abort_saving.
   IF vim_abort_saving IS NOT INITIAL.
     EXIT.
   ENDIF.
  ENDLOOP.

 ELSEIF zvops_tckm2_total[] IS NOT INITIAL. "Assignment of Material Ledger Types to Valuation Areas View
    DATA(lt_zvops_tckm2_total) = zvops_tckm2_total[].
    DELETE lt_zvops_tckm2_total[] WHERE action IS INITIAL.
    SORT lt_zvops_tckm2_total[] BY bwkey.
    DELETE ADJACENT DUPLICATES FROM lt_zvops_tckm2_total[] COMPARING bwkey.
    IF lt_zvops_tckm2_total[] IS NOT INITIAL.
     SELECT bwkey, bukrs FROM t001k
                        INTO TABLE @DATA(lt_comp_code)
                        FOR ALL ENTRIES IN @lt_zvops_tckm2_total
                        WHERE bwkey EQ @lt_zvops_tckm2_total-bwkey.
       IF sy-subrc EQ 0.
           LOOP AT lt_comp_code ASSIGNING FIELD-SYMBOL(<lfs_comp_code>).
            CALL METHOD zcl_ops_mass_site_creation=>authority_check
              EXPORTING
                iv_bukrs            = <lfs_comp_code>-bukrs
              IMPORTING
                ev_vim_abort_saving = vim_abort_saving.
   IF vim_abort_saving IS NOT INITIAL.
     EXIT.
   ENDIF.
           ENDLOOP.
       ENDIF.
    ENDIF.

  ELSEIF zvops_tvkwz_assi_total[] IS NOT INITIAL. "Assignment Sales Organization/Distribution Channel - Plant
    DATA(lt_zvops_tvkwz_assi_total) = zvops_tvkwz_assi_total[].
    DELETE lt_zvops_tvkwz_assi_total WHERE action IS INITIAL.
    SORT lt_zvops_tvkwz_assi_total[] BY werks.
    DELETE ADJACENT DUPLICATES FROM lt_zvops_tvkwz_assi_total COMPARING werks.
    IF lt_zvops_tvkwz_assi_total[] IS NOT INITIAL.
     SELECT bwkey bukrs FROM t001k
                        INTO TABLE lt_comp_code
                        FOR ALL ENTRIES IN lt_zvops_tvkwz_assi_total
                        WHERE bwkey EQ lt_zvops_tvkwz_assi_total-werks.
       IF sy-subrc EQ 0.
           LOOP AT lt_comp_code ASSIGNING <lfs_comp_code>.
            CALL METHOD zcl_ops_mass_site_creation=>authority_check
              EXPORTING
                iv_bukrs            = <lfs_comp_code>-bukrs
              IMPORTING
                ev_vim_abort_saving = vim_abort_saving.
   IF vim_abort_saving IS NOT INITIAL.
     EXIT.
   ENDIF.
           ENDLOOP.
       ENDIF.
    ENDIF.

   ELSEIF zvops_tvstz_stor_total[] IS NOT INITIAL.
    DATA(lt_zvops_tvstz_stor_total) = zvops_tvstz_stor_total[].
    DELETE lt_zvops_tvstz_stor_total WHERE action IS INITIAL.
    SORT lt_zvops_tvstz_stor_total[] BY werks.
    DELETE ADJACENT DUPLICATES FROM lt_zvops_tvstz_stor_total COMPARING werks.
    IF lt_zvops_tvstz_stor_total[] IS NOT INITIAL.
     SELECT bwkey bukrs FROM t001k
                        INTO TABLE lt_comp_code
                        FOR ALL ENTRIES IN lt_zvops_tvstz_stor_total
                        WHERE bwkey EQ lt_zvops_tvstz_stor_total-werks.
       IF sy-subrc EQ 0.
           LOOP AT lt_comp_code ASSIGNING <lfs_comp_code>.
            CALL METHOD zcl_ops_mass_site_creation=>authority_check
              EXPORTING
                iv_bukrs            = <lfs_comp_code>-bukrs
              IMPORTING
                ev_vim_abort_saving = vim_abort_saving.
   IF vim_abort_saving IS NOT INITIAL.
     EXIT.
   ENDIF.
           ENDLOOP.
       ENDIF.
    ENDIF.

  ELSEIF zvops_twlad_total[] IS NOT INITIAL.
    DATA(lt_zvops_twlad_total) = zvops_twlad_total[].
    DELETE lt_zvops_twlad_total WHERE action IS INITIAL.
    SORT lt_zvops_twlad_total[] BY werks.
    DELETE ADJACENT DUPLICATES FROM lt_zvops_twlad_total COMPARING werks.
    IF lt_zvops_twlad_total[] IS NOT INITIAL.
     SELECT bwkey bukrs FROM t001k
                        INTO TABLE lt_comp_code
                        FOR ALL ENTRIES IN lt_zvops_twlad_total
                        WHERE bwkey EQ lt_zvops_twlad_total-werks.
       IF sy-subrc EQ 0.
           LOOP AT lt_comp_code ASSIGNING <lfs_comp_code>.
            CALL METHOD zcl_ops_mass_site_creation=>authority_check
              EXPORTING
                iv_bukrs            = <lfs_comp_code>-bukrs
              IMPORTING
                ev_vim_abort_saving = vim_abort_saving.
   IF vim_abort_saving IS NOT INITIAL.
     EXIT.
   ENDIF.
           ENDLOOP.
       ENDIF.
    ENDIF.
 ENDIF.

   IF vim_abort_saving IS NOT INITIAL.
     sy-subrc = 4.
     EXIT.
   ENDIF.
  ENDFORM.
