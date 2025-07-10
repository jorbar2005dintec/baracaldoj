CLASS zedoc_mx_fill_concepto_inv_it DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.




    METHODS:
      get_descripcion_global IMPORTING billingdocumentnum TYPE vbeln_va
                                       billingdocitemnum  TYPE if_badi_concepto_invoice_item=>ty_inv_lineitem_data_input-billingdocinfo-billingdocitemnum
                             CHANGING  item               TYPE if_badi_concepto_invoice_item=>ty_concepto_invoice_item,

      get_long_description   IMPORTING billingdocumentnum TYPE vbeln_va
                                       billingdocitemnum  TYPE if_badi_concepto_invoice_item=>ty_inv_lineitem_data_input-billingdocinfo-billingdocitemnum
                             CHANGING  item               TYPE if_badi_concepto_invoice_item=>ty_concepto_invoice_item.



    INTERFACES if_badi_interface .
    INTERFACES if_badi_concepto_invoice_item .
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zedoc_mx_fill_concepto_inv_it IMPLEMENTATION.

  METHOD get_descripcion_global.

    TYPES:
      BEGIN OF informacion_global_s,
        referencesddocument     TYPE i_billingdocumentitembasic-referencesddocument,
        referencesddocumentitem TYPE i_billingdocumentitembasic-referencesddocumentitem,
      END OF   informacion_global_s .


    DATA: w_l_facturaglobal TYPE i_billingdocumentbasic-yys4205890facturagloba_bdh,
          w_l_deliverynum   TYPE informacion_global_s.

    SELECT SINGLE yys4205890facturagloba_bdh
      FROM i_billingdocumentbasic WITH PRIVILEGED ACCESS
     WHERE billingdocument = @billingdocumentnum
      INTO @w_l_facturaglobal.

    CHECK sy-subrc EQ 0.

    CHECK  w_l_facturaglobal EQ 'X'.

    SELECT SINGLE referencesddocument,
                  referencesddocumentitem
      FROM i_billingdocumentitembasic WITH PRIVILEGED ACCESS
     WHERE billingdocument =  @billingdocumentnum
       AND billingdocumentitem = @billingdocitemnum
      INTO @w_l_deliverynum.

    CHECK sy-subrc EQ 0.

    item-cantidad          = '1'.

    item-clave_prod_serv   = '01010101'.
    item-clave_unidad      = 'ACT'.
    item-no_identificacion = w_l_deliverynum-referencesddocument.
    item-descripcion       = 'Venta'.
    item-unidad            = ''.





  ENDMETHOD.

  METHOD get_long_description.




    TYPES: BEGIN OF y_billingitem,
             descrip  TYPE i_billingdocumentitembasic-YYS4205890DescrlargaSO_BDI,
             product  TYPE i_billingdocumentitembasic-product,
             customer TYPE i_billingdocumentitembasic-soldtoparty,
           END OF y_billingitem,
           BEGIN OF y_billingdocument,
             sorg    TYPE i_billingdocumentbasic-salesorganization,
             dchan   TYPE i_billingdocumentbasic-distributionchannel,
             longdes TYPE i_billingdocumentbasic-YYS4205890Desclarcheck_BDH,
             pord    TYPE i_billingdocumentbasic-YYS4205890OCporlinea_BDH,
           END OF  y_billingdocument.


    DATA: w_l_billingdocument TYPE y_billingdocument,
          w_l_billingitem     TYPE y_billingitem,
          w_l_matbycust       TYPE i_customermaterial_2-materialbycustomer,
          w_l_purchaseorder   TYPE string.




    SELECT SINGLE salesorganization,
                  distributionchannel,
                  YYS4205890Desclarcheck_BDH,
                  YYS4205890OCporlinea_BDH
     FROM i_billingdocumentbasic WITH PRIVILEGED ACCESS
    WHERE billingdocument = @billingdocumentnum
     INTO @w_l_billingdocument.

    CHECK sy-subrc EQ 0.

    IF w_l_billingdocument-longdes  EQ 'X'.

      SELECT SINGLE YYS4205890DescrlargaSO_BDI ,
                    product,
                    soldtoparty
        FROM i_billingdocumentitembasic WITH PRIVILEGED ACCESS
       WHERE billingdocument = @billingdocumentnum
         AND billingdocumentitem = @billingdocitemnum
        INTO @w_l_billingitem.

      CHECK sy-subrc EQ 0.

      IF w_l_billingitem-descrip IS NOT INITIAL.

        item-descripcion = w_l_billingitem-descrip.

      ENDIF.

    ENDIF.

    SELECT SINGLE materialbycustomer
      FROM i_customermaterial_2 WITH PRIVILEGED ACCESS
     WHERE salesorganization   = @w_l_billingdocument-sorg
      AND  distributionchannel = @w_l_billingdocument-dchan
      AND  customer = @w_l_billingitem-customer
      AND  product = @w_l_billingitem-product
     INTO  @w_l_matbycust .

    IF sy-subrc EQ 0.


      IF w_l_matbycust IS NOT INITIAL.

*      concatenate item-descripcion ' SKU Cliente:  ' w_l_matbycust into item-descripcion.

        item-no_identificacion = w_l_matbycust.

      ENDIF.

    ENDIF.

    IF w_l_billingdocument-pord EQ 'X'.

      w_l_purchaseorder = zedoc_mx_addendas_get_data=>get_purchaseorder( salesdocumentnum = billingdocumentnum ).

      CONCATENATE item-descripcion ' OC:  ' w_l_purchaseorder INTO item-descripcion.

    ENDIF.

  ENDMETHOD.

  METHOD if_badi_concepto_invoice_item~fill_line_item.

    CALL METHOD get_descripcion_global
      EXPORTING
        billingdocumentnum = billinginfo-billingdocinfo-billingdocumentnum
        billingdocitemnum  = billinginfo-billingdocinfo-billingdocitemnum
      CHANGING
        item               = item.

    CALL METHOD get_long_description
      EXPORTING
        billingdocumentnum = billinginfo-billingdocinfo-billingdocumentnum
        billingdocitemnum  = billinginfo-billingdocinfo-billingdocitemnum
      CHANGING
        item               = item.

  ENDMETHOD.
ENDCLASS.
