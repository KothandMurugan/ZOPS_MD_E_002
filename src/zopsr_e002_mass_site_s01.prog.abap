*&---------------------------------------------------------------------*
*& Include    : ZOPSR_E002_MASS_SITE_S01-Selection Screen Design       *
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
*--->Selection Screen Block 1 For Selection Paramters
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
PARAMETERS: p_s_prof TYPE twrf2-betrp OBLIGATORY . "Site Profile
SELECTION-SCREEN SKIP 1.
PARAMETERS: rb_onli RADIOBUTTON GROUP g1 USER-COMMAND ucom, " Online Run
            rb_bgrd RADIOBUTTON GROUP g1, " Background Run
            cb_clsf AS CHECKBOX USER-COMMAND ucom1. "Only Classification
SELECTION-SCREEN SKIP 1.
SELECTION-SCREEN END OF BLOCK b1.

*--->Selection Screen Paramters for File Upload
SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
PARAMETERS: p_bp_p   TYPE localfile, "Business Partner
            p_site_p TYPE localfile, "Site
            p_clsf_p TYPE localfile. "Classification
SELECTION-SCREEN END OF BLOCK b2.
