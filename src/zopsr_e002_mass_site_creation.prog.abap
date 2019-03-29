*&---------------------------------------------------------------------*
*& Report      ZOPSR_E002/R002_MASS_SITE_CREATION(BP & SITE)           *
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
REPORT zopsr_e002_mass_site_creation NO STANDARD PAGE HEADING
                                     MESSAGE-ID zops.

INCLUDE zopsr_e002_mass_site_top  . " Global Data
INCLUDE zopsr_e002_mass_site_s01  . "Selection Screen
INCLUDE zopsr_e002_mass_site_o01  . " PBO-Modules
INCLUDE zopsr_e002_mass_site_i01  . " PAI-Modules
