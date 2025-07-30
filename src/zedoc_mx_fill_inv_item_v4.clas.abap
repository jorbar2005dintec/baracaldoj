CLASS zedoc_mx_fill_inv_item_v4 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      BEGIN OF ty_cuenta_predial_numero,
        numero TYPE c LENGTH 150,
      END OF ty_cuenta_predial_numero .
    TYPES:
    tt_cuenta_predial_numero TYPE TABLE OF ty_cuenta_predial_numero .

    DATA: znumeropredial TYPE tt_cuenta_predial_numero.


    INTERFACES if_badi_interface .
    INTERFACES if_badi_interface_inv_item_v4.

    METHODS:
      predial_numero
        IMPORTING
          billingdocument          TYPE i_billingdocumentitem-billingdocument
          billingdocumentitemnum   TYPE i_billingdocumentitem-billingdocument
        CHANGING
          ct_cuenta_predial_numero TYPE  zedoc_mx_fill_inv_item_v4=>ty_cuenta_predial_numero.




  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZEDOC_MX_FILL_INV_ITEM_V4 IMPLEMENTATION.


  METHOD if_badi_interface_inv_item_v4~fill_lineitem_data_v4.
    "---------------------------------------------------------------------"
    " This method can be implement to change the following data           "
    "
    "---------------------------------------------------------------------"




*    TYPES:
*      BEGIN OF ty_cuenta_predial_numero,
*        numero TYPE i_product-YYS4205890CuentaPredia_PRD,
*      END OF ty_cuenta_predial_numero .
*    TYPES:
*    tt_cuenta_predial_numero TYPE TABLE OF ty_cuenta_predial_numero .

*    field-symbols:  <fs> type any.

*    DATA: w_l_predial  type zedoc_mx_fill_inv_item_v4=>ty_cuenta_predial_numero.

*    CALL METHOD predial_numero
*      EXPORTING
*        billingdocument          = is_source-billingdocinfo-billingdocumentnum
*        billingdocumentitemnum   = is_source-billingdocinfo-billingdocitemnum
*       is_source                = is_source-billingdocinfo-billingdocumentnum
*      CHANGING
*       ct_cuenta_predial_numero = ct_cuenta_predial_numero.
*        ct_cuenta_predial_numero = w_l_predial.

*    CHECK w_l_predial NE space.

*    assign component 'numero' of structure w_l_predial to <fs>.

*    check <fs> is assigned.

*    APPEND <fs> TO ct_cuenta_predial_numero.

  ENDMETHOD.


  METHOD predial_numero.


    DATA w_matnr  TYPE i_billingdocumentitem-product.

    DATA w_cuenta TYPE zedoc_mx_fill_inv_item_v4=>ty_cuenta_predial_numero.


    CLEAR w_cuenta.

    SELECT SINGLE
       product
      FROM i_billingdocumentitem
   WITH PRIVILEGED ACCESS
     WHERE billingdocument = @billingdocument
       AND billingdocumentitem = @billingdocumentitemnum
     INTO @w_matnr.


    CHECK sy-subrc IS INITIAL.



*    SELECT SINGLE YYS4205890CuentaPredia_PRD
*      FROM i_product
*      WITH PRIVILEGED ACCESS
*      WHERE product = @w_matnr
*      INTO @w_cuenta.


    CHECK sy-subrc IS INITIAL
      AND w_cuenta NE space.

    ct_cuenta_predial_numero = w_cuenta.



  ENDMETHOD.
ENDCLASS.
