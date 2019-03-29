*&---------------------------------------------------------------------*
*& Include    : ZOPSR_E002_MASS_SITE_TOP - Data Declaration            *
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
*--->Data Declaration
DATA :
*--->Class Reference Declaration
  go_mass_site_create     TYPE REF TO zcl_ops_mass_site_creation,
  gv_file_path TYPE string.

*--->Constants Declaration
CONSTANTS: gc_flag_y   TYPE xfeld  VALUE 'Y',
           gc_flag_x   TYPE xfeld  VALUE 'X',
           gc_par_bp   TYPE char16 VALUE 'P_BP_P',
           gc_par_site TYPE char16 VALUE 'P_SITE_P',
           gc_par_clsf TYPE char16 VALUE 'P_CLSF_P',
           gc_zero     TYPE char1  VALUE '0'.

CONSTANTS:
         gc_success TYPE msgty VALUE 'S'.
