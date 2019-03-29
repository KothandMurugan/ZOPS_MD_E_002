*&---------------------------------------------------------------------*
*& Include    : ZOPSR_E002_MASS_SITE_SCREEN                            *
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

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
PARAMETERS: rb_onli RADIOBUTTON GROUP g1 USER-COMMAND ucom, " Online Run
            rb_bgrd RADIOBUTTON GROUP g1. " Background Run
SELECTION-SCREEN SKIP 1.
PARAMETERS: p_bp_rel   TYPE localfile. "Business Partner Relationship Creation
SELECTION-SCREEN SKIP 1.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
PARAMETERS :rb_contp RADIOBUTTON GROUP g2 USER-COMMAND u1.
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN POSITION 5.
PARAMETERS :rb_cust   RADIOBUTTON GROUP g3 DEFAULT 'X'.
SELECTION-SCREEN COMMENT 8(30) TEXT-c01.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN POSITION 5.
PARAMETERS :rb_vend   RADIOBUTTON GROUP g3.
SELECTION-SCREEN COMMENT 8(30) TEXT-c02.
SELECTION-SCREEN END OF LINE.
PARAMETERS :rb_i_c_v  RADIOBUTTON GROUP g2. "International client/vendor
SELECTION-SCREEN SKIP 1.
SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-003.

PARAMETERS :rb_add  RADIOBUTTON GROUP g4,
            rb_dele RADIOBUTTON GROUP g4.
SELECTION-SCREEN SKIP 1.
SELECTION-SCREEN END OF BLOCK b3.

AT SELECTION-SCREEN OUTPUT.
  IF rb_contp IS INITIAL AND rb_i_c_v IS NOT INITIAL. "Dynamic selection screen
    LOOP AT SCREEN. "Relationship contact person
      IF screen-name EQ gc_p_cust OR screen-name = gc_screen_v
        OR screen-name = gc_screen_v1.
        screen-input = 0.
        screen-invisible = 1.
        screen-active = 1.
        MODIFY SCREEN.
      ENDIF.
      IF screen-name EQ gc_p_vend." International Vendor or client
        screen-input = 0 .
        screen-invisible = 1.
        screen-active = 1.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ENDIF.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_bp_rel.

  CHECK go_ref IS BOUND. " Check Instanciation
  go_ref->upload_file(
     CHANGING
       cv_f_path = p_bp_rel ).
