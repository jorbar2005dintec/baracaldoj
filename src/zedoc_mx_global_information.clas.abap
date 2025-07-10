CLASS zedoc_mx_global_information DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_mx_set_global_information .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZEDOC_MX_GLOBAL_INFORMATION IMPLEMENTATION.


  METHOD if_mx_set_global_information~fill_global_information.

    types:
    BEGIN OF informacion_global_s,
      facturaGlobal     TYPE i_billingdocumentbasic-YYS4205890FacturaGloba_BDH,
      periodicidad      TYPE i_billingdocumentbasic-YYS4205890Periodicidad_BDH,
      ano               TYPE i_billingdocumentbasic-YYS4205890Ano_BDH,
      meses             TYPE i_billingdocumentbasic-YYS4205890Meses_BDH,
    END OF   informacion_global_s .

    data: w_l_factura_global type informacion_global_s,
          w_l_periodicidad   type i_billingdocumentbasic-YYS4205890Periodicidad_BDH.

    select single    YYS4205890FacturaGloba_BDH,
                     YYS4205890Periodicidad_BDH,
                     YYS4205890Ano_BDH,
                     YYS4205890Periodicidad_BDH
      from i_billingdocumentbasic WITH PRIVILEGED ACCESS
     where billingdocument = @SOURCE_DATA-document_num
      into  @w_l_factura_global.

    check sy-subrc eq 0.

    check w_l_factura_global-facturaglobal eq 'X'.

    INFORMACION_GLOBAL-ano   = w_l_factura_global-ano.
    INFORMACION_GLOBAL-meses = w_l_factura_global-meses.
    INFORMACION_GLOBAL-periodicidad = w_l_factura_global-periodicidad.


  ENDMETHOD.
ENDCLASS.
