FUNCTION zopsfm_bprelationship_change.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_BUSINESSPARTNER1) LIKE  BAPIBUS1006_HEAD-BPARTNER
*"     VALUE(IV_BUSINESSPARTNER2) LIKE  BAPIBUS1006_HEAD-BPARTNER
*"     VALUE(IV_RELATIONSHIPCATEGORY) LIKE  BUT050-RELTYP
*"     VALUE(IV_VALIDFROMDATE) LIKE
*"        BAPIBUS1006002_HEADER-VALIDFROMDATE DEFAULT SY-DATLO
*"     VALUE(IV_VALIDUNTILDATE) LIKE
*"        BAPIBUS1006002_HEADER-VALIDUNTILDATE DEFAULT '99991231'
*"     VALUE(IV_DIFFERENTIATIONTYPEVALUE) LIKE  BUT050-DFTVAL OPTIONAL
*"     VALUE(IV_VALIDFROMDATENEW) LIKE
*"        BAPIBUS1006002_HEADER-VALIDFROMDATE OPTIONAL
*"     VALUE(IV_VALIDUNTILDATENEW) LIKE
*"        BAPIBUS1006002_HEADER-VALIDUNTILDATE OPTIONAL
*"     VALUE(IV_RELATIONSHIPTYPENEW) LIKE  BUT050-RELKIND OPTIONAL
*"     VALUE(IV_DATEFROMX) LIKE  BOOLE-BOOLE OPTIONAL
*"     VALUE(IV_DATETOX) LIKE  BOOLE-BOOLE OPTIONAL
*"     VALUE(IV_RELATIONTYPEX) LIKE  BOOLE-BOOLE OPTIONAL
*"     VALUE(IV_XDFREL) LIKE  BUT050-XDFREL OPTIONAL
*"     VALUE(IV_XDFRELX) LIKE  BOOLE-BOOLE OPTIONAL
*"     VALUE(IV_QUEUE_NAME) TYPE  TRFCQNAM OPTIONAL
*"  TABLES
*"      T_RETURN STRUCTURE  BAPIRET2 OPTIONAL
*"----------------------------------------------------------------------

  CALL FUNCTION 'BUPR_RELATIONSHIP_CHANGE'
    EXPORTING
      iv_partner_1                  = iv_businesspartner1
      iv_partner_2                  = iv_businesspartner2
      iv_relationship               = iv_relationshipcategory
      iv_date_from                  = iv_validfromdate
      iv_date_to                    = iv_validuntildate
      iv_differentiation_type_value = iv_differentiationtypevalue
      iv_date_from_new              = iv_validfromdatenew
      iv_date_to_new                = iv_validuntildatenew
      iv_relationtype               = iv_relationshiptypenew
      iv_date_from_x                = iv_datefromx
      iv_date_to_x                  = iv_datetox
      iv_relationtype_x             = iv_relationtypex
      iv_xdfrel                     = iv_xdfrel
      iv_xdfrel_x                   = iv_xdfrelx
    TABLES
      et_return                     = t_return.

ENDFUNCTION.
