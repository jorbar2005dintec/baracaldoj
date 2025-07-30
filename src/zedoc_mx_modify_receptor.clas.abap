CLASS zedoc_mx_modify_receptor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_badi_interface_receptor .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZEDOC_MX_MODIFY_RECEPTOR IMPLEMENTATION.


  METHOD if_badi_interface_receptor~modify_receptor.


     DATA: w_l_usocfdi    TYPE string.
*          w_l_cartaporte TYPE i_deliveryDocument-YY1_CartaPorte_DLH.



    DATA: BEGIN OF ls_fi_key,
            bukrs TYPE  bukrs,
            belnr TYPE belnr_d,
            gjahr TYPE gjahr,
          END OF ls_fi_key.
*"ES this code is for factoraje
    IF is_mapping_source-accounting_doc_number IS NOT INITIAL.

*   Build eDocument source document key form FI specific keys
      ls_fi_key-bukrs = is_mapping_source-company_code.
      ls_fi_key-belnr = is_mapping_source-accounting_doc_number.
      ls_fi_key-gjahr = is_mapping_source-year.

      DATA: w_factor    TYPE I_journalentryitem-YYS4205890Factoraje_COB,
            W_factortyp TYPE I_journalentryitem-YYS4205890IDClienteFac_COB.

      DATA: w_name   TYPE i_customer-customername,
            w_tax    TYPE i_customer-taxnumber1,
            w_postal TYPE i_customer-postalcode.

      CLEAR: W_factor, W_factortyp.

      SELECT SINGLE  YYS4205890Factoraje_COB,
                     YYS4205890IDClienteFac_COB
        FROM  I_journalentryitem
        WITH PRIVILEGED ACCESS
        WHERE accountingdocument = @ls_fi_key-belnr
          AND fiscalyear = @ls_fi_key-gjahr
          AND companycode = @ls_fi_key-bukrs
          AND sourceledger = '0L'
          AND YYS4205890Factoraje_COB IS NOT INITIAL
          INTO (  @w_factor, @W_factortyp ).

      IF sy-subrc IS INITIAL.

        SELECT SINGLE
        i_customer~taxnumber1,
        i_customer~customername,
        i_customer~postalcode
        FROM i_customer
        WITH PRIVILEGED ACCESS
        WHERE customer = @W_factortyp
        INTO ( @w_tax, @w_name, @w_postal ).

        IF sy-subrc IS INITIAL.

          cs_receptor_v7-rfc = w_tax.
          cs_receptor_v7-nombre = w_name.
          cs_receptor_v7-domicilio_fiscal_receptor = w_postal.
          cs_receptor_v7-regimen_fiscal_receptor = '601'.
*return here when factoraje find its data
*for carta porte it will continue performing its code.
         return.


        ENDIF.



      ENDIF.


    ENDIF.
*"JB this code is for carta porte
   w_l_usocfdi =  zedoc_mx_addendas_get_data=>get_uso_cfdi_from_billingdoc( billingdocument = is_mapping_source-billing_doc_number ).

    IF ( w_l_usocfdi IS INITIAL ).

      w_l_usocfdi =  zedoc_mx_addendas_get_data=>get_uso_cfdi_from_deliverydoc( deliverydocument = is_mapping_source-delivery_doc_number ).

    ENDIF.

    IF w_l_usocfdi IS NOT INITIAL.

      cs_receptor_v7-uso_cfdi = w_l_usocfdi..

    ENDIF.

*    SELECT SINGLE YY1_CartaPorte_DLH
*      FROM
*        i_deliveryDocument WITH PRIVILEGED ACCESS
*     WHERE deliverydocument = @is_mapping_source-delivery_doc_number
*     INTO  @w_l_cartaporte.

*    IF w_l_cartaporte EQ 'X'.

*      cs_receptor_v7-uso_cfdi = 'S01'.
*      cs_receptor_v7-domicilio_fiscal_receptor = '09820'..


*    ENDIF.



  ENDMETHOD.
ENDCLASS.
