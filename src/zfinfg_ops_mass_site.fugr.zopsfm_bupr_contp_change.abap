FUNCTION zopsfm_bupr_contp_change .
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_BUSINESSPARTNER) LIKE  BAPIBUS1006_HEAD-BPARTNER
*"     VALUE(IV_CONTACTPERSON) LIKE  BAPIBUS1006_HEAD-BPARTNER
*"     VALUE(IV_VALIDFROMDATE) LIKE
*"        BAPIBUS1006002_HEADER-VALIDFROMDATE OPTIONAL
*"     VALUE(IV_VALIDUNTILDATE) LIKE
*"        BAPIBUS1006002_HEADER-VALIDUNTILDATE OPTIONAL
*"     VALUE(IV_DEFAULTRELATIONSHIP) LIKE
*"        BAPIBUS1006002_HEADER-DEFAULTRELATIONSHIP OPTIONAL
*"     VALUE(IV_DEFAULTRELATIONSHIP_X) LIKE
*"        BAPIBUS1006002_HEADER-DEFAULTRELATIONSHIP OPTIONAL
*"     VALUE(IS_CENTRALDATA) LIKE  BAPIBUS1006002_CENTRAL STRUCTURE
*"        BAPIBUS1006002_CENTRAL OPTIONAL
*"     VALUE(IS_CENTRALDATA_X) LIKE  BAPIBUS1006002_CENTRAL_X STRUCTURE
*"        BAPIBUS1006002_CENTRAL_X OPTIONAL
*"     VALUE(IV_QUEUE_NAME) TYPE  TRFCQNAM OPTIONAL
*"  TABLES
*"      T_RETURN STRUCTURE  BAPIRET2 OPTIONAL
*"----------------------------------------------------------------------

  CALL FUNCTION 'BUPR_CONTP_CHANGE'
    EXPORTING
      iv_partner               = iv_businesspartner
      iv_contactperson         = iv_contactperson
      iv_date_from             = iv_validfromdate
      iv_date_to               = iv_validuntildate
      iv_defaultrelationship   = iv_defaultrelationship
      iv_defaultrelationship_x = iv_defaultrelationship_x
      is_data                  = is_centraldata
      is_data_x                = is_centraldata_x
    TABLES
      et_return                = t_return.
ENDFUNCTION.
