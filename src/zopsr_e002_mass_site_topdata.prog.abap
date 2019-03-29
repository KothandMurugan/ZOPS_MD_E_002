*&---------------------------------------------------------------------*
*& Include    : ZOPSR_E002_MASS_SITE_TOPDATA                           *
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

 DATA: go_ref          TYPE REF TO zcl_ops_mass_site_creation,
       go_ref_rel      TYPE REF TO zcl_ops_mass_site_relationship,
       gv_rel_cat_flag TYPE char3,
       gv_db_mode      TYPE db_access_mode.

 CONSTANTS : gc_reltyp_flag TYPE xfeld VALUE 'R',
             gc_cpc         TYPE char3 VALUE 'CPC',
             gc_cpv         TYPE char3 VALUE 'CPV',
             gc_i_cv        TYPE char3 VALUE 'ICV',
             gc_db_i        TYPE  db_access_mode VALUE 'I',
             gc_db_d        TYPE  db_access_mode VALUE 'D',
             gc_p_cust      TYPE char15 VALUE 'RB_CUST',
             gc_p_vend      TYPE char15 VALUE 'RB_VEND',
             gc_screen_v    TYPE char30 VALUE '%CC01012_1000',
             gc_screen_v1   TYPE char30 VALUE '%CC02017_1000',
             gc_success     TYPE msgty VALUE 'S'.
