*&---------------------------------------------------------------------*
*& Report     : ZOPSR_E002_MASS_SITE_BPREL_UPD                         *
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

REPORT zopsr_e002_mass_site_bprel_upd NO STANDARD PAGE HEADING
                                      MESSAGE-ID zops.

INCLUDE zopsr_e002_mass_site_topdata. " Top & Global Declaration
INCLUDE zopsr_e002_mass_site_screen. "Selection Screen & Dynamic Screen changes
INCLUDE zopsr_e002_mass_site_data. " Data Selection and Processing
