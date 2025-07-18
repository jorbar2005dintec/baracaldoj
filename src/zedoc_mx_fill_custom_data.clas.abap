CLASS zedoc_mx_fill_custom_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      get_cfdi_relacionados IMPORTING salesdocumentnum  TYPE vbeln_va
                            CHANGING  cfdi_relacionados TYPE if_badi_interface_cust_data_v4=>tt_related_doc_data.

    METHODS:
      addenda_robertbosh  IMPORTING customernum      TYPE kunag
                                    salesdocumentnum TYPE vbeln_va
                          CHANGING  addenda          TYPE string
                                    use_of_cfdi      TYPE string.

    METHODS: addenda_global IMPORTING salesdocumentnum TYPE vbeln_va
                            CHANGING  addenda          TYPE string
                                      use_of_cfdi      TYPE string.


    METHODS: addenda_chopo IMPORTING customernum      TYPE kunag
                                     salesdocumentnum TYPE vbeln_va
                           CHANGING  addenda          TYPE string
                                     use_of_cfdi      TYPE string.

    METHODS:
      addenda_dhl  IMPORTING customernum      TYPE kunag
                             salesdocumentnum TYPE vbeln_va
                   CHANGING  addenda          TYPE string
                             use_of_cfdi      TYPE string.

    METHODS:
      addenda_firmex  IMPORTING customernum      TYPE kunag
                                salesdocumentnum TYPE vbeln_va
                      CHANGING  addenda          TYPE string
                                use_of_cfdi      TYPE string.




    METHODS:
      addenda_inditex  IMPORTING customernum      TYPE kunag
                                 salesdocumentnum TYPE vbeln_va
                       CHANGING  addenda          TYPE string
                                 use_of_cfdi      TYPE string.

    METHODS:
      addenda_waldos  IMPORTING customernum      TYPE kunag
                                salesdocumentnum TYPE vbeln_va
                      CHANGING  addenda          TYPE string
                                use_of_cfdi      TYPE string.

    METHODS:
      addenda_harinaselizondo   IMPORTING customernum      TYPE kunag
                                          salesdocumentnum TYPE vbeln_va
                                CHANGING  addenda          TYPE string
                                          use_of_cfdi      TYPE string.

    METHODS:
      addenda_sanmina   IMPORTING customernum      TYPE kunag
                                  salesdocumentnum TYPE vbeln_va
                        CHANGING  addenda          TYPE string
                                  use_of_cfdi      TYPE string.


    METHODS:
      addenda_colgate    IMPORTING customernum      TYPE kunag
                                   salesdocumentnum TYPE vbeln_va
                         CHANGING  addenda          TYPE string
                                   use_of_cfdi      TYPE string.

    METHODS:
      addenda_gm        IMPORTING customernum      TYPE kunag
                                  salesdocumentnum TYPE vbeln_va
                        CHANGING  addenda          TYPE string
                                  use_of_cfdi      TYPE string.

    METHODS:
      addenda_stellanties        IMPORTING customernum      TYPE kunag
                                           salesdocumentnum TYPE vbeln_va
                                 CHANGING  addenda          TYPE string
                                           use_of_cfdi      TYPE string.

    METHODS:
      addenda_pepsico            IMPORTING customernum      TYPE kunag
                                           salesdocumentnum TYPE vbeln_va
                                 CHANGING  addenda          TYPE string
                                           use_of_cfdi      TYPE string.


    METHODS: addenda_bmw         IMPORTING customernum      TYPE kunag
                                           salesdocumentnum TYPE vbeln_va
                                 CHANGING  addenda          TYPE string
                                           use_of_cfdi      TYPE string.


    METHODS:
      addenda_pfizer            IMPORTING customernum      TYPE kunag
                                          salesdocumentnum TYPE vbeln_va
                                CHANGING  addenda          TYPE string
                                          use_of_cfdi      TYPE string.

    METHODS:
      addenda_continental           IMPORTING customernum      TYPE kunag
                                              salesdocumentnum TYPE vbeln_va
                                    CHANGING  addenda          TYPE string
                                              use_of_cfdi      TYPE string.
    METHODS:
      addenda_walmart           IMPORTING customernum      TYPE kunag
                                          salesdocumentnum TYPE vbeln_va
                                CHANGING  addenda          TYPE string
                                          use_of_cfdi      TYPE string.


    METHODS:
      addenda_isseg            IMPORTING customernum      TYPE kunag
                                         salesdocumentnum TYPE vbeln_va
                               CHANGING  addenda          TYPE string
                                         use_of_cfdi      TYPE string.

    METHODS:
      addenda_promeco            IMPORTING customernum      TYPE kunag
                                           salesdocumentnum TYPE vbeln_va
                                 CHANGING  addenda          TYPE string
                                           use_of_cfdi      TYPE string.

    METHODS:
      addenda_nadro            IMPORTING customernum      TYPE kunag
                                         salesdocumentnum TYPE vbeln_va
                               CHANGING  addenda          TYPE string
                                         use_of_cfdi      TYPE string.

    METHODS:
      addenda_amazon            IMPORTING customernum      TYPE kunag
                                          salesdocumentnum TYPE vbeln_va
                                CHANGING  addenda          TYPE string
                                          use_of_cfdi      TYPE string.

    METHODS:
      addenda_astrazeneca           IMPORTING customernum      TYPE kunag
                                              salesdocumentnum TYPE vbeln_va
                                    CHANGING  addenda          TYPE string
                                              use_of_cfdi      TYPE string.

    METHODS:
      addenda_glaxo            IMPORTING customernum      TYPE kunag
                                         salesdocumentnum TYPE vbeln_va
                               CHANGING  addenda          TYPE string
                                         use_of_cfdi      TYPE string.

    METHODS:
      addenda_domicilio_receptor
        IMPORTING
                  customernum           TYPE kunag
                  salesdocumentnum      TYPE vbeln_va
                  deliverydocumentnum   TYPE vbeln_va
                  accountingdocumentnum TYPE belnr_d
                  fiscalyear            TYPE gjahr
                  companycode           TYPE bukrs

        CHANGING  addenda               TYPE string
                  use_of_cfdi           TYPE string.


    METHODS:
      tipo_relacion
        IMPORTING

          accountingdocument TYPE belnr_d
          fiscalyear         TYPE gjahr
          salesdocument      TYPE vbeln_va
        CHANGING
          related            TYPE any.



    INTERFACES if_badi_interface .
    INTERFACES if_badi_interface_cust_data_v4.


  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS:

      check_addendatype   IMPORTING customernum         TYPE kunag
                                    addendatype         TYPE string
                                    salesdocumentnum    TYPE vbeln_va
                          RETURNING VALUE(validaddenda) TYPE abap_boolean,


      encode_base64       IMPORTING im_addenda        TYPE string
                                    im_init_tag       TYPE string  OPTIONAL
                                    im_end_tag        TYPE string  OPTIONAL
                          RETURNING VALUE(rt_addenda) TYPE string,

      check_addendaon     IMPORTING salesdocumentnum    TYPE vbeln_va
                                    deliverydocumentnum TYPE vbeln_va
                          RETURNING VALUE(addendaon)    TYPE abap_boolean.

ENDCLASS.



CLASS zedoc_mx_fill_custom_data IMPLEMENTATION.


  METHOD addenda_bmw..




    TYPES: BEGIN OF ty_s_billingidoc,
             billingdocument TYPE   i_billingdocumentbasic-billingdocument,
             contactname     TYPE   i_billingdocumentbasic-yy1_nombrecontactoclie_bdh,
             contactdept     TYPE   i_billingdocumentbasic-yy1_centrodecostodelcl_bdh,
             deldate         TYPE   i_billingdocumentbasic-yy1_fecharecepcinnr_bdh,
             delnote         TYPE   i_billingdocumentbasic-yy1_remision1_bdh.
    TYPES: END OF ty_s_billingidoc,
    ty_t_billingidoc TYPE STANDARD TABLE OF ty_s_billingidoc.

    TYPES: BEGIN OF ty_s_billingidocumentitem,
             item      TYPE   i_billingdocumentitem-billingdocumentitem,
             itemtext  TYPE   i_billingdocumentitem-billingdocumentitemtext,
             itemqty   TYPE   i_billingdocumentitem-billingquantity,
             netamount TYPE   i_billingdocumentitem-subtotal1amount,
             taxamount TYPE   i_billingdocumentitem-taxamount,
             product   TYPE   i_billingdocumentitem-product.
    TYPES: END OF ty_s_billingidocumentitem,
    ty_t_billingidocumentitem TYPE STANDARD TABLE OF ty_s_billingidocumentitem.


    TYPES: BEGIN OF ty_s_billingconditions,
             item      TYPE   i_billingdocumentitemprcgelmnt-billingdocumentitem,
             condtype  TYPE   i_billingdocumentitemprcgelmnt-conditiontype,
             baseprice TYPE  i_billingdocumentitemprcgelmnt-conditionbasevalue,
             ratevalue TYPE  i_billingdocumentitemprcgelmnt-conditionratevalue.
    TYPES: END OF ty_s_billingconditions,
    ty_t_billingconditions TYPE STANDARD TABLE OF ty_s_billingconditions.




    DATA: validaddenda             TYPE abap_boolean,
          w_l_addenda              TYPE string,
          w_l_addenda_ext          TYPE string,
          is_l_billingdoc          TYPE ty_t_billingidoc,
          is_l_purchaseorderbyitem TYPE zedoc_mx_addendas_get_data=>ty_t_purchaseorderbyitem,
          w_l_currency             TYPE string,
          w_l_supplier             TYPE string,
          w_l_qty_str              TYPE string,
          w_l_amount               TYPE i_billingdocumentitem-netamount,
          w_l_amount_str           TYPE string,
          is_l_conditionprices     TYPE ty_t_billingconditions,
          is_l_billingdocumentitem TYPE ty_t_billingidocumentitem,
          w_l_output_len           TYPE int4,
          w_l_bp_mail              TYPE string,
          w_l_kunag                TYPE kunag.


    FIELD-SYMBOLS: <fs_billingdoc>          TYPE ty_s_billingidoc,
                   <fs_billingitem>         TYPE ty_s_billingidocumentitem,
                   <fs_purchaseorderbyitem> TYPE zedoc_mx_addendas_get_data=>ty_s_purchaseorderbyitem,
                   <fs_conditions>          TYPE ty_s_billingconditions.

    validaddenda = check_addendatype( customernum = customernum  addendatype = 'BMW GROUP LEVEL'  salesdocumentnum = salesdocumentnum ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.
    "ES20250626 beg
    "    w_l_addenda_ext = '<BMW:Factura xmlns:BMW="http://bmw.ateb-addenda.com.mx/addendas/bmw" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '.
    w_l_addenda_ext = '<BMW:Factura  invoiceNumber="&1" BMWcontactName="&2" BMWcontactDept="&3" supplierNumber="&4" supplierEmail="&5" currency="&6" hCurrency="&7" '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    "    w_l_addenda_ext = ' invoiceNumber="&1" BMWcontactName="&2" BMWcontactDept="&3" supplierNumber="&4" supplierEmail="&5" currency="&6" hCurrency="&7" '.
    w_l_addenda_ext = ' xmlns:BMW="http://bmw.ateb-addenda.com.mx/addendas/bmw" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '.
    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.
    "ES20250626 end
    w_l_addenda_ext = ' xsi:schemaLocation="http://bmw.ateb-addenda.com.mx/addendas/bmw http://bmw.ateb-addenda.com.mx/addendas/bmw/bmw.xsd">'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    SELECT billingdocument,
           yy1_nombrecontactoclie_bdh,
           yy1_centrodecostodelcl_bdh,
           yy1_fecharecepcinnr_bdh,
           yy1_remision1_bdh
      FROM i_billingdocumentbasic WITH PRIVILEGED ACCESS
     WHERE billingdocument = @salesdocumentnum
     INTO TABLE @is_l_billingdoc.

    CHECK sy-subrc EQ 0.


    READ TABLE  is_l_billingdoc
      ASSIGNING <fs_billingdoc>
      INDEX 1.

    CHECK sy-subrc EQ 0.

    SELECT billingdocumentitem,
            conditiontype,
            conditionbasevalue,
            conditionratevalue
       FROM i_billingdocumentitemprcgelmnt  WITH PRIVILEGED ACCESS
      WHERE billingdocument = @salesdocumentnum
       INTO TABLE @is_l_conditionprices.

    CHECK sy-subrc EQ 0.

    SELECT   billingdocumentitem,
             billingdocumentitemtext,
             billingquantity,
             subtotal1amount,
             taxamount,
             product
      FROM   i_billingdocumentitem  WITH PRIVILEGED ACCESS
      WHERE  billingdocument = @salesdocumentnum
      INTO   TABLE  @is_l_billingdocumentitem.

    CHECK sy-subrc EQ 0.

    w_l_kunag  = zedoc_mx_addendas_get_data=>get_bp_employee_so( salesdocumentnum = salesdocumentnum ).

    w_l_bp_mail = zedoc_mx_addendas_get_data=>get_buspartnerindependentemail( customernum = w_l_kunag  ).

    w_l_currency = zedoc_mx_addendas_get_data=>get_currency(  salesdocumentnum = salesdocumentnum ).

    w_l_supplier = zedoc_mx_addendas_get_data=>get_bpidentificationnumber(  customernum = customernum ).

    CALL METHOD zedoc_mx_addendas_get_data=>get_purchaseorderbyitem
      EXPORTING
        salesdocumentnum  = salesdocumentnum
      CHANGING
        purchaseorderitem = is_l_purchaseorderbyitem.

    REPLACE '&1' IN w_l_addenda WITH <fs_billingdoc>-billingdocument+2.

    REPLACE '&2' IN w_l_addenda WITH <fs_billingdoc>-contactname.

    REPLACE '&3' IN w_l_addenda WITH <fs_billingdoc>-contactdept.

    REPLACE '&4' IN w_l_addenda WITH w_l_supplier.

    REPLACE '&5' IN w_l_addenda WITH w_l_bp_mail.

    REPLACE '&6' IN w_l_addenda WITH w_l_currency.

    REPLACE '&7' IN w_l_addenda WITH w_l_currency.

    w_l_addenda_ext = '<BMW:Partes>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_output_len = 2.

    LOOP AT  is_l_billingdocumentitem
      ASSIGNING <fs_billingitem>.

      w_l_addenda_ext = '<BMW:Parte deliveryDate="&8"  purchaseOrder="&9" deliveryNoteNo="&10" importe="&11" valorUnitario="&12" descripcion="&13" unidad="H87" cantidad="&14"  NoIdentificacion="&15"/>' .

      CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

      REPLACE '&8' IN w_l_addenda WITH <fs_billingdoc>-deldate.

      READ TABLE is_l_purchaseorderbyitem
        ASSIGNING <fs_purchaseorderbyitem>
        WITH KEY  salesorderitem = <fs_billingitem>-item.

      IF sy-subrc EQ 0.

        REPLACE '&9' IN w_l_addenda WITH <fs_purchaseorderbyitem>-purchaseorder.

      ENDIF.

      REPLACE '&10' IN w_l_addenda WITH <fs_billingdoc>-delnote.


      w_l_amount = <fs_billingitem>-netamount.

      w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                                                                decimal_places =  w_l_output_len  ).

      REPLACE '&11' IN w_l_addenda WITH w_l_amount_str.


      READ TABLE is_l_conditionprices
        ASSIGNING <fs_conditions>
        WITH KEY  item = <fs_billingitem>-item
                  condtype = 'PPR0'.

      IF sy-subrc EQ 0.

        w_l_amount = <fs_conditions>-ratevalue.

        w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                                                                decimal_places =  w_l_output_len  ).

        REPLACE '&12' IN w_l_addenda WITH w_l_amount_str.

      ENDIF.

      REPLACE '&13' IN w_l_addenda WITH <fs_billingitem>-itemtext.


      w_l_qty_str = zedoc_mx_addendas_get_data=>output_qty_decimalplaces( qty_value = <fs_billingitem>-itemqty
                                                                         decimal_places =  w_l_output_len  ).

      REPLACE '&14' IN w_l_addenda WITH w_l_qty_str.

      REPLACE '&15' IN w_l_addenda WITH <fs_billingitem>-product.


    ENDLOOP.

    w_l_addenda_ext = '</BMW:Partes></BMW:Factura>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    REPLACE ALL OCCURRENCES OF '&' IN w_l_addenda WITH 'E_'.

    addenda = encode_base64( im_addenda = w_l_addenda ).

    "    addenda = w_l_addenda.


  ENDMETHOD.


  METHOD addenda_colgate.

    TYPES: BEGIN OF ty_s_billingidoc,
             documentitem TYPE   i_billingdocumentitem-billingdocumentitem,
             lineitem     TYPE   i_billingdocumentitem-yy1_linenum_bdi.
    TYPES: END OF ty_s_billingidoc,
    ty_t_billingidoc TYPE STANDARD TABLE OF ty_s_billingidoc.

    DATA: validaddenda      TYPE abap_boolean,
          w_l_addenda       TYPE string,
          w_l_addenda_ext   TYPE string,
          w_l_purchaseorder TYPE string,
          is_l_billingitem  TYPE ty_t_billingidoc,
          w_l_item          TYPE i_billingdocumentitem-billingdocumentitem,
          w_l_folionr1      TYPE string.

    FIELD-SYMBOLS: <fs_billingitem> TYPE  ty_s_billingidoc.

    validaddenda = check_addendatype( customernum = customernum  addendatype = 'COLGATEPALMOLIV'  salesdocumentnum = salesdocumentnum ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.

    w_l_addenda_ext =  '<Ariba><Encabezado><Referencia><NoRef>1</NoRef><TipoRef>Interno</TipoRef><ValorRef>MIRO</ValorRef></Referencia><Referencia><NoRef>2</NoRef><TipoRef>Orden</TipoRef>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext =  '<ValorRef>&1</ValorRef></Referencia><Referencia><NoRef>3</NoRef><TipoRef>Guia</TipoRef><ValorRef>&2</ValorRef></Referencia></Encabezado><Detalle>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_purchaseorder = zedoc_mx_addendas_get_data=>get_purchaseorder( salesdocumentnum = salesdocumentnum ).

    REPLACE '&1' IN w_l_addenda WITH w_l_purchaseorder.

    w_l_folionr1 = zedoc_mx_addendas_get_data=>get_folionr1( salesdocumentnum = salesdocumentnum ).

    REPLACE '&2' IN w_l_addenda WITH w_l_folionr1.


    SELECT billingdocumentitem,
           yy1_linenum_bdi
      FROM i_billingdocumentitem  WITH PRIVILEGED ACCESS
      WHERE billingdocument = @salesdocumentnum
      INTO TABLE @is_l_billingitem.



    LOOP AT  is_l_billingitem
      ASSIGNING <fs_billingitem>.

      w_l_addenda_ext =  '<Referencia><NoLinea>&3</NoLinea><TipoRef>Orden</TipoRef><ValorRef>&4</ValorRef></Referencia>'.

      CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

      w_l_item = <fs_billingitem>-documentitem / 10.

      SHIFT w_l_item LEFT DELETING LEADING '0'.

      REPLACE '&3' IN w_l_addenda WITH w_l_item.

      REPLACE '&4' IN w_l_addenda WITH <fs_billingitem>-lineitem.


    ENDLOOP.

    w_l_addenda_ext = '</Detalle></Ariba>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    "    addenda = w_l_addenda.

    addenda = encode_base64( im_addenda = w_l_addenda ).

  ENDMETHOD.


  METHOD  addenda_dhl.



    DATA: w_l_purchaseorder  TYPE string,
          w_l_addenda        TYPE string,
          w_l_addenda_ext    TYPE string,
          w_l_plant_code     TYPE string,
          w_l_plant_desc     TYPE string,
          w_l_currency       TYPE string,
          w_l_identification TYPE string,
          w_l_emailaddress   TYPE string,
          validaddenda       TYPE abap_boolean.


    validaddenda = check_addendatype( customernum = customernum  addendatype = 'DHL SUPPLYCHAIN' salesdocumentnum = salesdocumentnum ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.


    w_l_addenda_ext =  '<Factura version="1.0" tipoDocumentoFiscal="FA" codigoImpuesto="IVA" tipoDocumento="I" xmlns:S="http://wwwAudi.net.mx/Addenda/S">'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = '<Moneda tipoMoneda="&1"/>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = '<Proveedor eMail="&2" '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = ' noProveedor="&3"><Partes>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = '<Parte descripcion="[NOMBRE_ARTICULO]" cantidad="[UNIDADES]" codigoImpuesto="[IMP_1]" montoLinea="[IMPORTE]" precioUnitario="[PRECIO_UNITARIO]" unidadMedida="[UNIDAD_VENTA]" posicion="[Posicion]">'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = '<Referencias notaEntrega=""'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = ' ordenCompra="&4"/>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = '</Parte></Partes></Proveedor></Factura>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_purchaseorder = zedoc_mx_addendas_get_data=>get_purchaseorder( salesdocumentnum = salesdocumentnum ).

    REPLACE '&4' IN w_l_addenda WITH w_l_purchaseorder.

    w_l_emailaddress =  zedoc_mx_addendas_get_data=>get_bussinesspartneremail( customernum  = customernum ).

    REPLACE '&2' IN w_l_addenda WITH w_l_emailaddress.

    w_l_currency = zedoc_mx_addendas_get_data=>get_currency( salesdocumentnum = salesdocumentnum ).

    REPLACE '&1' IN w_l_addenda WITH w_l_currency.

    w_l_identification = zedoc_mx_addendas_get_data=>get_bpidentificationnumber( customernum = customernum  ).

    REPLACE ALL OCCURRENCES OF '&3' IN w_l_addenda WITH w_l_identification.

    addenda = encode_base64( im_addenda = w_l_addenda ).

  ENDMETHOD.


  METHOD addenda_domicilio_receptor.
    "exit this method as should not be in production
    "remove after moving transport to production
    "this code should be only for principado
    EXIT.
    "    DATA: W_L_BP_MAIL TYPE STRING.

    "    w_l_bp_mail = zedoc_mx_addendas_get_data=>get_bussinesspartneremail( customernum = CUSTOMERNUM  ).

    "    data: w_l_addenda type string.

    ""    w_l_addenda = '<SapAddenda><email='.
    ""    concatenate w_l_addenda w_l_bp_mail '/> ' into w_l_addenda.
    ""    concatenate w_l_addenda   '<adddomemi calle="AV. RIO MIXCOAC" noExterior="140" ' into w_l_addenda.
    "    w_l_addenda = '<SapAddenda><adddomemi calle="AV. RIO MIXCOAC" noExterior="140" ' .

    "    concatenate w_l_addenda ' noInterior="8" colonia="ACACIAS" municipio="BENITO JUÁREZ"'  into w_l_addenda.
    "    concatenate w_l_addenda ' estado="CIUDAD DE MEXICO" pais= "MEXICO" codigoPostal="03240" /></SapAddenda> ' into W_l_addenda.

    "    concatenate addenda w_l_addenda into addenda.
    DATA is_l_customer_oc_data TYPE zedoc_mx_addendas_get_data=>ty_t_customer_oc_data.
    DATA is_l_entregas TYPE zedoc_mx_addendas_get_data=>ty_t_entregas.

    FIELD-SYMBOLS: <fs_customer_oc_data>  TYPE zedoc_mx_addendas_get_data=>ty_s_customer_oc_data,
                   <fs_customer_oc_data1> TYPE zedoc_mx_addendas_get_data=>ty_s_customer_oc_data,
                   <fs_entregas>          TYPE zedoc_mx_addendas_get_data=>ty_s_vbak.

    DATA: w_l_addenda      TYPE string,
          w_l_bp_mail      TYPE string,
          w_l_email_custom TYPE string,
          w_l_bp_mailnotif TYPE string,
          w_l_num_oc       TYPE string,
          w_l_id_cust      TYPE string,
          w_l_num_prov     TYPE string,
          w_l_bp_calle     TYPE string,
          w_l_bp_no_ext    TYPE string,
          w_l_bp_no_int    TYPE string,
          w_l_bp_colonia   TYPE string,
          w_l_bp_munic     TYPE string,
          w_l_bp_estado    TYPE string,
          w_l_bp_pais      TYPE string,
          w_l_bp_cp        TYPE string,
          w_l_bp2_calle    TYPE string,
          w_l_bp2_no_ext   TYPE string,
          w_l_bp2_no_int   TYPE string,
          w_l_bp2_colonia  TYPE string,
          w_l_bp2_munic    TYPE string,
          w_l_bp2_estado   TYPE string,
          w_l_bp2_pais     TYPE string,
          w_l_bp2_cp       TYPE string,
          w_l_bp_city      TYPE string,
          w_l_bp2_city     TYPE string,
          w_l_bp_phone     TYPE string,
          w_l_bp2_phone    TYPE string,
          w_l_email_zm     TYPE string,
          w_l_email_ve     TYPE string,
          w_l_sku          TYPE string,
          w_l_comments     TYPE string,
          w_l_text03       TYPE string.
    CLEAR:
                 w_l_addenda,
                 w_l_bp_mail ,
                 w_l_email_custom,
                 w_l_bp_mailnotif  ,
                 w_l_num_oc  ,
                 w_l_id_cust   ,
                 w_l_num_prov  ,
                 w_l_bp_calle  ,
                 w_l_bp_no_ext  ,
                 w_l_bp_no_int ,
                 w_l_bp_colonia ,
                 w_l_bp_munic ,
                 w_l_bp_estado ,
                 w_l_bp_pais ,
                 w_l_bp_cp ,
                 w_l_bp2_calle ,
                 w_l_bp2_no_ext ,
                 w_l_bp2_no_int ,
                 w_l_bp2_colonia ,
                 w_l_bp2_munic ,
                 w_l_bp2_estado ,
                 w_l_bp2_pais ,
                 w_l_bp2_cp ,
                 w_l_sku,
                  w_l_bp_city,
                   w_l_bp2_city,
                 w_l_bp_phone,
                 w_l_bp2_phone,
                 w_l_email_zm,
                 w_l_email_ve,
                 w_l_comments,
                 w_l_text03.

    "Here find the values for the sapaddenda.
    w_l_id_cust  = customernum.
    w_l_num_oc  = salesdocumentnum.

    .
    CALL METHOD zedoc_mx_addendas_get_data=>get_customer_oc_data
      EXPORTING
        salesdocument    = salesdocumentnum
      CHANGING
        customer_oc_data = is_l_customer_oc_data
        entregas         = is_l_entregas.

    READ TABLE is_l_customer_oc_data
    ASSIGNING <fs_customer_oc_data>
    INDEX 1.

    IF sy-subrc IS INITIAL.

      w_l_num_oc  = <fs_customer_oc_data>-purchaseorderbycustomer.

      DATA:
        w_l_sorg TYPE i_salesdocument-salesorganization,
        w_l_dist TYPE i_salesdocument-distributionchannel,
        w_l_so   TYPE i_salesdocument-salesdocument,
        w_l_divi TYPE i_salesdocument-organizationdivision.

      CLEAR: w_l_sorg, w_l_dist, w_l_so, w_l_divi.

      SELECT SINGLE
          i_salesdocument~salesdocument,
          i_salesdocument~salesorganization,
          i_salesdocument~distributionchannel,

           i_salesdocument~organizationdivision,
          i_salesdocument~yy1_correocontactoclie_sdh
        FROM i_salesdocument
         WITH PRIVILEGED ACCESS
         WHERE
          salesdocument = @<fs_customer_oc_data>-salesdocument
          INTO
          (
          @w_l_so,
          @w_l_sorg,
          @w_l_dist,
          @w_l_divi,
          @w_l_email_custom )
          .

      CALL METHOD zedoc_mx_addendas_get_data=>get_bp_parfunc_email
        EXPORTING
          customernum = customernum
          sorg        = w_l_sorg
          dist        = w_l_dist
          divi        = w_l_divi
        CHANGING
          email1      = w_l_email_zm
          email2      = w_l_email_ve.



    ENDIF.



    CALL METHOD zedoc_mx_addendas_get_data=>get_bp_address
      EXPORTING
        customernum      = customernum
        salesdocumentnum = w_l_so
      CHANGING
        emailaddress     = w_l_bp_mail
        emailnot         = w_l_bp_mailnotif
        numprov          = w_l_num_prov
        street           = w_l_bp_calle
        housenum1        = w_l_bp_no_ext
        housenum2        = w_l_bp_no_int
        township         = w_l_bp_colonia
        county           = w_l_bp_munic
        cityname         = w_l_bp_estado
        country          = w_l_bp_pais
        postalcode       = w_l_bp_cp
        city             = w_l_bp_city
        st_street        = w_l_bp2_calle
        st_housenum1     = w_l_bp2_no_ext
        st_housenum2     = w_l_bp2_no_int
        st_township      = w_l_bp2_colonia
        st_county        = w_l_bp2_munic
        st_cityname      = w_l_bp2_estado
        st_country       = w_l_bp2_pais
        st_postalcode    = w_l_bp2_cp
        st_city          = w_l_bp2_city
        phone1           = w_l_bp_phone
        phone2           = w_l_bp2_phone
        text03           = w_l_text03.



    "end finding values.

    "    w_l_addenda = '<AddendaEmisor> <SapAddenda>  Num OC='.




*{Begin Jorge O Baracaldo 2025-05-09  Delete addenda Emisor for Production Version Temp Fix
    RETURN.
*}End  Jorge O Baracaldo 2025-05-09

    w_l_addenda = '<SapAddenda> xsi:noNamespace SchemaLocation="schema.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  e-mail='.
    CONCATENATE   w_l_addenda '"' w_l_bp_mail ';' INTO w_l_addenda .

    CONCATENATE w_l_addenda  w_l_bp_mailnotif  ';' INTO w_l_addenda .
    CONCATENATE w_l_addenda  w_l_email_custom  ';' INTO w_l_addenda .
    CONCATENATE w_l_addenda  w_l_email_zm  ';' INTO w_l_addenda .
    CONCATENATE w_l_addenda  w_l_email_ve  '" ' INTO w_l_addenda .


    CONCATENATE w_l_addenda 'NumOC=' '"' w_l_num_oc  '"' INTO w_l_addenda .
    CONCATENATE w_l_addenda  ' IDCliente=' INTO w_l_addenda SEPARATED BY space.
    CONCATENATE w_l_addenda '"' w_l_id_cust '"' INTO w_l_addenda .
    CONCATENATE w_l_addenda  ' NumProveedor=' INTO w_l_addenda SEPARATED BY space.
    CONCATENATE w_l_addenda '"' w_l_num_prov '"' INTO w_l_addenda .

    "start addomemi
    "    CONCATENATE w_l_addenda   ' <adddomemi> ' INTO w_l_addenda.


    CONCATENATE: w_l_addenda
      ' DireccionEntrega="'
            ' Calle: '    w_l_bp2_calle
            ' No exterior: '   w_l_bp2_no_ext
            ' No interior: '    w_l_bp2_no_int
            ' Colonia: '  w_l_bp2_colonia
            ' Municipio: '  w_l_bp2_munic
            ' Codigo postal: '  w_l_bp2_cp
            ' Ciudad: '   w_l_bp2_city
            ' Estado: '   w_l_bp2_estado
            ' Pais: '   w_l_bp2_pais

 "           ' Telefono '   W_L_BP2_phone '"' '</adddomexp> '
           ' Telefono: '   w_l_bp2_phone '"'
             INTO w_l_addenda  SEPARATED BY space.

    CONCATENATE: w_l_addenda
         ' DireccionCliente="'
         ' Calle: '   w_l_bp_calle

          ' No exterior: '   w_l_bp_no_ext
          ' No interior: '   w_l_bp_no_int
          ' Colonia: '  w_l_bp_colonia
          ' Municipio: '  w_l_bp_munic
         ' Codigo postal: '   w_l_bp_cp
          ' Ciudad: '   w_l_bp_city
          ' Estado: '  w_l_bp_estado
          ' Pais: '  w_l_bp_pais
"          ' Telefono '   W_L_BP_phone  '"' '</adddomemi>'
             ' Telefono: '   w_l_bp_phone
              ' InstruccionesDeRecibo:' w_l_text03 '"'
            INTO w_l_addenda  SEPARATED BY space.
    "start addomexp
    "    CONCATENATE w_l_addenda   ' <adddomexp>  ' INTO w_l_addenda.

    "start sku
    SORT is_l_customer_oc_data.

    DELETE ADJACENT DUPLICATES FROM is_l_customer_oc_data
     COMPARING salesdocument.

    SORT is_l_entregas.
    DELETE ADJACENT DUPLICATES FROM is_l_entregas
   COMPARING delivery.

    LOOP AT   is_l_customer_oc_data
     ASSIGNING <fs_customer_oc_data1>.


      LOOP AT   is_l_customer_oc_data
      ASSIGNING <fs_customer_oc_data>
      WHERE salesdocument = <fs_customer_oc_data1>-salesdocument.
        IF sy-tabix = 1.
          CONCATENATE ' O.C.:' <fs_customer_oc_data>-purchaseorderbycustomer
                      ' Basado en Pedidos de cliente:' <fs_customer_oc_data>-salesdocument
                      INTO w_l_comments.
        ELSE.

          CONCATENATE w_l_comments ','  <fs_customer_oc_data>-salesdocument
                     INTO w_l_comments.

        ENDIF.
      ENDLOOP.

      LOOP AT is_l_entregas
      ASSIGNING <fs_entregas>
      WHERE salesorder = <fs_customer_oc_data1>-salesdocument.
        IF sy-tabix = 1.
          CONCATENATE w_l_comments
            ' Basado en Entregas: ' <fs_entregas>-delivery INTO w_l_comments.
        ELSE.

          CONCATENATE w_l_comments ','
             <fs_entregas>-delivery

            INTO w_l_comments SEPARATED BY space.

        ENDIF.

      ENDLOOP.

      w_l_sku = <fs_customer_oc_data>-materialbycustomer.



      "      CONCATENATE w_l_addenda ' SKUCliente=' '"'  w_l_sku '"' INTO w_l_addenda.

    ENDLOOP.

    CONCATENATE w_l_addenda ' Comentarios='  '"' w_l_comments '"' INTO w_l_addenda .


    "    CONCATENATE w_l_addenda ' </SapAddenda> ' INTO w_l_addenda  SEPARATED BY space.
    CONCATENATE w_l_addenda '</SapAddenda> ' INTO w_l_addenda  SEPARATED BY space.


    "    CONCATENATE w_l_addenda ' <Receptor>  emailReceptor=' INTO w_l_addenda  SEPARATED BY space.

    "    CONCATENATE   w_l_addenda '"' w_l_bp_mail '"' INTO W_L_ADDENda .
    "    CONCATENATE w_l_addenda  ' E-mail notificacion=' INTO w_l_addenda SEPARATED BY space.
    "    CONCATENATE w_l_addenda '"' w_l_bp_mailNOTIF  ';' INTO w_l_addenda .
    "    CONCATENATE w_l_addenda '' w_l_email_custom  ';' INTO w_l_addenda .
    "    CONCATENATE w_l_addenda '' w_l_email_zm  ';' INTO w_l_addenda .
    "    CONCATENATE w_l_addenda '' w_l_email_VE  '"' INTO w_l_addenda .


    "   CONCATENATE w_l_addenda ' </Receptor> </AddendaEmisor> ' INTO w_l_addenda SEPARATED BY space.
    "  CONCATENATE w_l_addenda '  </AddendaEmisor> ' INTO w_l_addenda SEPARATED BY space.
    CONCATENATE addenda w_l_addenda INTO addenda.
    addenda = encode_base64( im_addenda = addenda ).

  ENDMETHOD.


  METHOD  addenda_firmex.

    DATA: is_l_vbak         TYPE STANDARD TABLE OF vbeln_va,
          w_l_purchaseorder TYPE string,
          w_l_addenda       TYPE string,
          w_l_addenda_ext   TYPE string,
          w_l_gr            TYPE string,
          w_l_email         TYPE string,
          validaddenda      TYPE abap_boolean.

    validaddenda = check_addendatype( customernum = customernum  addendatype = 'FIRMEX' salesdocumentnum = salesdocumentnum  ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.

    w_l_addenda = '<Firmenich xmlns="http://repository.edicomnet.com/schemas/mx/cfd/addenda" xsi:schemaLocation="http://repository.edicomnet.com/schemas/mx/cfd/addenda '.

    w_l_addenda_ext =  ' http://repository.edicomnet.com/schemas/mx/cfd/addenda/Firmenich.xsd"><OrdendeCompra OrdendeCompra="&1"/>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = '<GoodsReceipt GR="&2"/></Firmenich>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_purchaseorder = zedoc_mx_addendas_get_data=>get_purchaseorder( salesdocumentnum = salesdocumentnum ).

    REPLACE '&1' IN w_l_addenda WITH w_l_purchaseorder.

    w_l_gr = zedoc_mx_addendas_get_data=>get_folionr1( salesdocumentnum = salesdocumentnum ).

    REPLACE '&2' IN w_l_addenda WITH w_l_gr.

    addenda = encode_base64( im_addenda = w_l_addenda ).


  ENDMETHOD.


  METHOD addenda_chopo.

    CONSTANTS: c_claveprodserv TYPE string VALUE '01010101',
               c_cantidad      TYPE string VALUE '1',
               c_claveunidad   TYPE string VALUE 'ACT',
               c_descrip       TYPE string VALUE 'Venta',
               c_objimp        TYPE string VALUE '02'.

    TYPES: BEGIN OF ty_billing_raw,
             referencesddocument TYPE i_billingdocumentitem-referencesddocument,
             billingdocumentitem TYPE i_billingdocumentitem-billingdocumentitem,
             netamount           TYPE i_billingdocumentitem-netamount,
           END OF ty_billing_raw.

    TYPES: BEGIN OF ty_billing_sum,
             referencesddocument TYPE i_billingdocumentitem-referencesddocument,
             netamount           TYPE i_billingdocumentitem-netamount,
             taxrate             TYPE i_billingdocumentitemprcgelmnt-conditionratevalue,
           END OF ty_billing_sum.

    TYPES: BEGIN OF ty_tax_data,
             billingdocumentitem TYPE i_billingdocumentitemprcgelmnt-billingdocumentitem,
             conditionratevalue  TYPE i_billingdocumentitemprcgelmnt-conditionratevalue,
           END OF ty_tax_data.

    DATA: lt_billing_raw     TYPE STANDARD TABLE OF ty_billing_raw,
          lt_billing_sum     TYPE STANDARD TABLE OF ty_billing_sum WITH DEFAULT KEY,
          lt_tax_data        TYPE SORTED TABLE OF ty_tax_data WITH UNIQUE KEY billingdocumentitem,
          lt_items           TYPE SORTED TABLE OF i_billingdocumentitem-billingdocumentitem
                             WITH UNIQUE KEY table_line,
          ls_billing         TYPE ty_billing_raw,
          ls_sum             TYPE ty_billing_sum,
          w_l_factura_global TYPE i_billingdocumentbasic-yy1_facturaglobal_bdh,
          w_l_addenda        TYPE string,
          w_l_addenda_ext    TYPE string,
          w_l_netwr          TYPE p DECIMALS 6,
          w_l_amount         TYPE string,
          validaddenda       TYPE abap_boolean.

    FIELD-SYMBOLS: <fs_billing>  TYPE ty_billing_raw,
                   <fs_sum>      TYPE ty_billing_sum,
                   <fs_tax_data> TYPE ty_tax_data.


    SELECT SINGLE   yy1_facturaglobal_bdh
       FROM i_billingdocumentbasic WITH PRIVILEGED ACCESS
       WHERE billingdocument = @salesdocumentnum
        INTO  @w_l_factura_global.

    CHECK w_l_factura_global EQ 'X'.

    " Step 1: Read raw billing items
    SELECT referencesddocument,
           billingdocumentitem,
           netamount
      FROM i_billingdocumentitembasic WITH PRIVILEGED ACCESS
      WHERE billingdocument = @salesdocumentnum
      AND   referencesddocumentcategory = 'J'
      INTO  TABLE @lt_billing_raw.

    CHECK sy-subrc EQ 0.

    " Step 2: Collect by delivery (ReferenceSDDocument)
    LOOP AT lt_billing_raw
      ASSIGNING  <fs_billing>.

      MOVE-CORRESPONDING <fs_billing> TO ls_sum.

      COLLECT ls_sum INTO lt_billing_sum.


    ENDLOOP.




    " Step 3: Get tax rates for billingdocumentitems

    SELECT billingdocumentitem,
           conditionratevalue
      FROM i_billingdocumentitemprcgelmnt  WITH PRIVILEGED ACCESS
      WHERE billingdocument = @salesdocumentnum
        AND conditiontype = 'TMX1'
      INTO TABLE @lt_tax_data.

    CHECK sy-subrc EQ 0.

    " Step 4: Merge taxrate into result
    LOOP AT lt_billing_sum
     ASSIGNING  <fs_sum>.

      UNASSIGN <fs_billing>.

      READ TABLE lt_billing_raw
        ASSIGNING <fs_billing>
           WITH KEY referencesddocument  = <fs_sum>-referencesddocument.

      CHECK <fs_billing> IS ASSIGNED.



      READ TABLE lt_tax_data
        ASSIGNING <fs_tax_data>
        WITH KEY billingdocumentitem = <fs_billing>-billingdocumentitem.

      CHECK sy-subrc EQ 0.

      <fs_sum>-taxrate = <fs_tax_data>-conditionratevalue.



    ENDLOOP.

    " output Addenda

    w_l_addenda = '<cfdi:Conceptos>'.

    LOOP AT lt_billing_sum
      ASSIGNING  <fs_sum>.

      w_l_addenda_ext = '<cfdi:Concepto ClaveProdServ="&1" NoIdentificacion="&2" Cantidad="&3" ClaveUnidad="&4" Descripcion="&5" ValorUnitario="&6" Importe="&7" ObjetoImp="&8">'.

      CONCATENATE w_l_addenda w_l_addenda_ext INTO w_l_addenda.

      REPLACE '&1' IN w_l_addenda WITH c_claveprodserv.

      REPLACE '&2' IN w_l_addenda WITH <fs_sum>-referencesddocument.

      REPLACE '&3' IN w_l_addenda WITH c_cantidad.

      REPLACE '&4' IN w_l_addenda WITH c_claveunidad.

      REPLACE '&5' IN w_l_addenda WITH c_descrip.

      w_l_netwr = <fs_sum>-netamount.

      w_l_amount =  w_l_netwr.

      SHIFT w_l_amount RIGHT DELETING TRAILING space.

      SHIFT w_l_amount LEFT DELETING LEADING space.

      REPLACE '&6' IN w_l_addenda WITH w_l_amount.

      REPLACE '&7' IN w_l_addenda WITH w_l_amount.

      REPLACE '&8' IN w_l_addenda WITH c_objimp.

      w_l_addenda_ext = '<cfdi:Impuestos><cfdi:Traslados><cfdi:Traslado Base="&1" Impuesto="002" TipoFactor="Tasa" TasaOCuota="&2" Importe="&3"/>'.

      CONCATENATE w_l_addenda w_l_addenda_ext INTO w_l_addenda.

      REPLACE '&1' IN w_l_addenda WITH w_l_amount.

      w_l_netwr = <fs_sum>-taxrate / 100.

      w_l_amount =  w_l_netwr.


      SHIFT w_l_amount RIGHT DELETING TRAILING space.

      SHIFT w_l_amount LEFT DELETING LEADING space.


      REPLACE '&2' IN w_l_addenda WITH w_l_amount.

      w_l_netwr = <fs_sum>-netamount * <fs_sum>-taxrate / 100.

      w_l_amount =  w_l_netwr.

      SHIFT w_l_amount RIGHT DELETING TRAILING space.

      SHIFT w_l_amount LEFT DELETING LEADING space.


      REPLACE '&3' IN w_l_addenda WITH w_l_amount.

      w_l_addenda_ext = '</cfdi:Traslados></cfdi:Impuestos></cfdi:Concepto>'.

      CONCATENATE w_l_addenda w_l_addenda_ext INTO w_l_addenda.


    ENDLOOP.

    w_l_addenda_ext = '</cfdi:Conceptos>'.

    CONCATENATE w_l_addenda w_l_addenda_ext INTO w_l_addenda.

    addenda = encode_base64( im_addenda = w_l_addenda im_init_tag = '<global>' im_end_tag = '</global>' ).




  ENDMETHOD.


  METHOD addenda_global.

    CONSTANTS: c_claveprodserv TYPE string VALUE '01010101',
               c_cantidad      TYPE string VALUE '1',
               c_claveunidad   TYPE string VALUE 'ACT',
               c_descrip       TYPE string VALUE 'Venta',
               c_objimp        TYPE string VALUE '02'.

    TYPES: BEGIN OF ty_billing_raw,
             referencesddocument TYPE i_billingdocumentitem-referencesddocument,
             billingdocumentitem TYPE i_billingdocumentitem-billingdocumentitem,
             netamount           TYPE i_billingdocumentitem-netamount,
           END OF ty_billing_raw.

    TYPES: BEGIN OF ty_billing_sum,
             referencesddocument TYPE i_billingdocumentitem-referencesddocument,
             netamount           TYPE i_billingdocumentitem-netamount,
             taxrate             TYPE i_billingdocumentitemprcgelmnt-conditionratevalue,
           END OF ty_billing_sum.

    TYPES: BEGIN OF ty_tax_data,
             billingdocumentitem TYPE i_billingdocumentitemprcgelmnt-billingdocumentitem,
             conditionratevalue  TYPE i_billingdocumentitemprcgelmnt-conditionratevalue,
           END OF ty_tax_data.

    DATA: lt_billing_raw     TYPE STANDARD TABLE OF ty_billing_raw,
          lt_billing_sum     TYPE STANDARD TABLE OF ty_billing_sum WITH DEFAULT KEY,
          lt_tax_data        TYPE SORTED TABLE OF ty_tax_data WITH UNIQUE KEY billingdocumentitem,
          lt_items           TYPE SORTED TABLE OF i_billingdocumentitem-billingdocumentitem
                             WITH UNIQUE KEY table_line,
          ls_billing         TYPE ty_billing_raw,
          ls_sum             TYPE ty_billing_sum,
          w_l_factura_global TYPE i_billingdocumentbasic-yy1_facturaglobal_bdh,
          w_l_addenda        TYPE string,
          w_l_addenda_ext    TYPE string,
          w_l_netwr          TYPE p DECIMALS 6,
          w_l_amount         TYPE string.

    FIELD-SYMBOLS: <fs_billing>  TYPE ty_billing_raw,
                   <fs_sum>      TYPE ty_billing_sum,
                   <fs_tax_data> TYPE ty_tax_data.


    SELECT SINGLE   yy1_facturaglobal_bdh
       FROM i_billingdocumentbasic WITH PRIVILEGED ACCESS
       WHERE billingdocument = @salesdocumentnum
        INTO  @w_l_factura_global.

    CHECK w_l_factura_global EQ 'X'.

    " Step 1: Read raw billing items
    SELECT referencesddocument,
           billingdocumentitem,
           netamount
      FROM i_billingdocumentitembasic WITH PRIVILEGED ACCESS
      WHERE billingdocument = @salesdocumentnum
      AND   referencesddocumentcategory = 'J'
      INTO  TABLE @lt_billing_raw.

    CHECK sy-subrc EQ 0.

    " Step 2: Collect by delivery (ReferenceSDDocument)
    LOOP AT lt_billing_raw
      ASSIGNING  <fs_billing>.

      MOVE-CORRESPONDING <fs_billing> TO ls_sum.

      COLLECT ls_sum INTO lt_billing_sum.


    ENDLOOP.




    " Step 3: Get tax rates for billingdocumentitems

    SELECT billingdocumentitem,
           conditionratevalue
      FROM i_billingdocumentitemprcgelmnt  WITH PRIVILEGED ACCESS
      WHERE billingdocument = @salesdocumentnum
        AND conditiontype = 'TMX1'
      INTO TABLE @lt_tax_data.

    CHECK sy-subrc EQ 0.

    " Step 4: Merge taxrate into result
    LOOP AT lt_billing_sum
     ASSIGNING  <fs_sum>.

      UNASSIGN <fs_billing>.

      READ TABLE lt_billing_raw
        ASSIGNING <fs_billing>
           WITH KEY referencesddocument  = <fs_sum>-referencesddocument.

      CHECK <fs_billing> IS ASSIGNED.



      READ TABLE lt_tax_data
        ASSIGNING <fs_tax_data>
        WITH KEY billingdocumentitem = <fs_billing>-billingdocumentitem.

      CHECK sy-subrc EQ 0.

      <fs_sum>-taxrate = <fs_tax_data>-conditionratevalue.



    ENDLOOP.

    " output Addenda

    w_l_addenda = '<cfdi:Conceptos>'.

    LOOP AT lt_billing_sum
      ASSIGNING  <fs_sum>.

      w_l_addenda_ext = '<cfdi:Concepto ClaveProdServ="&1" NoIdentificacion="&2" Cantidad="&3" ClaveUnidad="&4" Descripcion="&5" ValorUnitario="&6" Importe="&7" ObjetoImp="&8">'.

      CONCATENATE w_l_addenda w_l_addenda_ext INTO w_l_addenda.

      REPLACE '&1' IN w_l_addenda WITH c_claveprodserv.

      REPLACE '&2' IN w_l_addenda WITH <fs_sum>-referencesddocument.

      REPLACE '&3' IN w_l_addenda WITH c_cantidad.

      REPLACE '&4' IN w_l_addenda WITH c_claveunidad.

      REPLACE '&5' IN w_l_addenda WITH c_descrip.

      w_l_netwr = <fs_sum>-netamount.

      w_l_amount =  w_l_netwr.

      SHIFT w_l_amount RIGHT DELETING TRAILING space.

      SHIFT w_l_amount LEFT DELETING LEADING space.

      REPLACE '&6' IN w_l_addenda WITH w_l_amount.

      REPLACE '&7' IN w_l_addenda WITH w_l_amount.

      REPLACE '&8' IN w_l_addenda WITH c_objimp.

      w_l_addenda_ext = '<cfdi:Impuestos><cfdi:Traslados><cfdi:Traslado Base="&1" Impuesto="002" TipoFactor="Tasa" TasaOCuota="&2" Importe="&3"/>'.

      CONCATENATE w_l_addenda w_l_addenda_ext INTO w_l_addenda.

      REPLACE '&1' IN w_l_addenda WITH w_l_amount.

      w_l_netwr = <fs_sum>-taxrate / 100.

      w_l_amount =  w_l_netwr.


      SHIFT w_l_amount RIGHT DELETING TRAILING space.

      SHIFT w_l_amount LEFT DELETING LEADING space.


      REPLACE '&2' IN w_l_addenda WITH w_l_amount.

      w_l_netwr = <fs_sum>-netamount * <fs_sum>-taxrate / 100.

      w_l_amount =  w_l_netwr.

      SHIFT w_l_amount RIGHT DELETING TRAILING space.

      SHIFT w_l_amount LEFT DELETING LEADING space.


      REPLACE '&3' IN w_l_addenda WITH w_l_amount.

      w_l_addenda_ext = '</cfdi:Traslados></cfdi:Impuestos></cfdi:Concepto>'.

      CONCATENATE w_l_addenda w_l_addenda_ext INTO w_l_addenda.


    ENDLOOP.

    w_l_addenda_ext = '</cfdi:Conceptos>'.

    CONCATENATE w_l_addenda w_l_addenda_ext INTO w_l_addenda.

    addenda = encode_base64( im_addenda = w_l_addenda im_init_tag = '<global>' im_end_tag = '</global>' ).




  ENDMETHOD.


  METHOD addenda_gm.

    TYPES: BEGIN OF ty_s_billingidoc,
             salesorder              TYPE i_billingdocumentitem-salesdocument,
             salesorderitem          TYPE i_billingdocumentitem-salesdocumentitem,
             documentitem            TYPE i_billingdocumentitem-billingdocumentitem,
             lineitem                TYPE i_billingdocumentitem-yy1_linenum_bdi,
             billingquantity         TYPE i_billingdocumentitem-billingquantity,
             material                TYPE i_billingdocumentitem-product,
             preciounitario          TYPE i_billingdocumentitem-creditrelatedprice,
             billingdocumentitemtext TYPE i_billingdocumentitem-billingdocumentitemtext.

    TYPES: END OF ty_s_billingidoc,
    ty_t_billingidoc TYPE STANDARD TABLE OF ty_s_billingidoc.


    DATA: validaddenda         TYPE abap_boolean,
          is_l_purchaseorditem TYPE zedoc_mx_addendas_get_data=>ty_t_purchaseorderbyitem,
          w_l_addenda          TYPE string,
          w_l_addenda_ext      TYPE string,
          is_l_billingitem     TYPE ty_t_billingidoc,
          w_l_remision         TYPE string,
          w_l_fecharecibo      TYPE i_billingdocumentbasic-yy1_fecharecepcinnr_bdh,
          w_l_fecrec_str       TYPE string,
          w_l_currency         TYPE string,
          w_l_day              TYPE string,
          w_l_month            TYPE string,
          w_l_year             TYPE string,
          w_l_qty              TYPE string,
          w_l_unit             TYPE string,
          w_l_len              TYPE i.



    FIELD-SYMBOLS: <fs_billingitem>       TYPE  ty_s_billingidoc,
                   <fs_purchaseorderitem> TYPE  zedoc_mx_addendas_get_data=>ty_s_purchaseorderbyitem.

    validaddenda = check_addendatype( customernum = customernum  addendatype = 'GENERAL MOTORS' salesdocumentnum = salesdocumentnum  ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.

    w_l_addenda_ext =  '<ADDENDAGM><HEADER><NUMEROREMISION>&1</NUMEROREMISION><FECHARECIBO>&2</FECHARECIBO><FOLIOINTERNO>&3</FOLIOINTERNO><MONEDA>&4</MONEDA> '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    SELECT SINGLE yy1_remisin_bdh, yy1_fecharecepcinnr_bdh
      FROM i_billingdocumentbasic WITH PRIVILEGED ACCESS
      WHERE billingdocument = @salesdocumentnum
      INTO  ( @w_l_remision ,  @w_l_fecharecibo ).

    IF sy-subrc EQ 0.

      w_l_day   = w_l_fecharecibo+6(2).
      w_l_month = w_l_fecharecibo+4(2).
      w_l_year  = w_l_fecharecibo+0(4).

      CONCATENATE w_l_day '/' w_l_month '/' w_l_year INTO w_l_fecrec_str.

      REPLACE '&1' IN w_l_addenda WITH w_l_remision.

      REPLACE '&2' IN w_l_addenda WITH w_l_fecrec_str.

    ENDIF.

    REPLACE '&3' IN w_l_addenda WITH salesdocumentnum.

    w_l_currency  = zedoc_mx_addendas_get_data=>get_currency( salesdocumentnum = salesdocumentnum ).

    IF w_l_currency EQ 'MXN'.

      REPLACE '&4'  IN w_l_addenda WITH '1'.

    ELSE.

      REPLACE '&4'  IN w_l_addenda WITH '2'.

    ENDIF.

    CALL METHOD zedoc_mx_addendas_get_data=>get_purchaseorderbyitem
      EXPORTING
        salesdocumentnum  = salesdocumentnum
      CHANGING
        purchaseorderitem = is_l_purchaseorditem.



    SELECT salesdocument,
           salesdocumentitem,
           billingdocumentitem,
           yy1_linenum_bdi,
           billingquantity,
           product,
           creditrelatedprice,
           billingdocumentitemtext
      FROM i_billingdocumentitem  WITH PRIVILEGED ACCESS
     WHERE billingdocument = @salesdocumentnum
      INTO TABLE @is_l_billingitem.

    CHECK sy-subrc EQ 0.

    LOOP AT  is_l_billingitem
      ASSIGNING <fs_billingitem>.

      w_l_addenda_ext = '<ITEM><ORDENCOMPRA>&5</ORDENCOMPRA><NUMEROPARTE>&6</NUMEROPARTE><MATERIAL>2</MATERIAL><CANTIDAD>&8</CANTIDAD><PRECIOUNITARIO>&9</PRECIOUNITARIO><DESCRIPCION>&10</DESCRIPCION></ITEM>'.

      CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

      READ TABLE is_l_purchaseorditem
        ASSIGNING <fs_purchaseorderitem>
        WITH KEY salesorder = <fs_billingitem>-salesorder
                 salesorderitem =  <fs_billingitem>-salesorderitem.

      IF sy-subrc EQ 0.

        REPLACE '&5' IN w_l_addenda WITH  <fs_purchaseorderitem>-purchaseorder.

      ELSE.

        REPLACE '&5' IN w_l_addenda WITH space.

      ENDIF.

      REPLACE '&6' IN w_l_addenda WITH <fs_billingitem>-lineitem.


      REPLACE '&10' IN w_l_addenda WITH <fs_billingitem>-billingdocumentitemtext.

      w_l_qty   = <fs_billingitem>-billingquantity.

      w_l_qty = condense( w_l_qty ).

      w_l_len = strlen( w_l_qty ).

      w_l_len = w_l_len - 1.

      w_l_qty = w_l_qty+0(w_l_len).

      REPLACE '&8' IN w_l_addenda WITH w_l_qty.

      w_l_unit = <fs_billingitem>-preciounitario.

      REPLACE '&9' IN w_l_addenda WITH w_l_unit.


    ENDLOOP.

    w_l_addenda_ext  = '</HEADER></ADDENDAGM>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    "   addenda = w_l_addenda.
    addenda = encode_base64( im_addenda = w_l_addenda ).


  ENDMETHOD.


  METHOD  addenda_harinaselizondo .

    DATA:
      w_l_purchaseorder TYPE string,
      w_l_addenda       TYPE string,
      w_l_addenda_ext   TYPE string,
      validaddenda      TYPE abap_boolean.

    validaddenda = check_addendatype( customernum = customernum  addendatype = 'HARINASELIZONDO' salesdocumentnum = salesdocumentnum  ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.

    w_l_addenda = '<customized xmlns="http://repository.edicomnet.com/schemas/mx/cfd/addenda" xsi:schemaLocation="http://repository.edicomnet.com/schemas/mx/cfd/addenda http://repository.edicomnet.com/schemas/mx/cfd/addenda/customized.xsd">'.

    w_l_addenda_ext =  '<EDICOM_GENERICA><elementos><elemento><etiqueta>ORDEN_COMPRA</etiqueta><descripcion>Numero de Orden Compra</descripcion><valor>&1</valor></elemento>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext =  '<elemento><etiqueta>COD_PROVEEDOR</etiqueta><descripcion>Codigo de Proveedor</descripcion><valor>359</valor></elemento></elementos></EDICOM_GENERICA></customized>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_purchaseorder = zedoc_mx_addendas_get_data=>get_purchaseorder( salesdocumentnum = salesdocumentnum ).

    REPLACE '&1' IN w_l_addenda WITH w_l_purchaseorder.


    addenda = encode_base64( im_addenda = w_l_addenda ).



  ENDMETHOD.


  METHOD  addenda_inditex.
    DATA:w_l_purchaseorder TYPE string,
         w_l_addenda       TYPE string,
         w_l_addenda_ext   TYPE string,
         validaddenda      TYPE abap_boolean.

    validaddenda = check_addendatype( customernum = customernum  addendatype = 'INDITEX' salesdocumentnum = salesdocumentnum  ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.

    w_l_addenda =   '<customized xmlns="http://repository.edicomnet.com/schemas/mx/cfd/addenda" '.

    w_l_addenda_ext = ' xsi:schemaLocation="http://repository.edicomnet.com/schemas/mx/cfd/addenda http://repository.edicomnet.com/schemas/mx/cfd/addenda/customized.xsd">'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext =  '<EDICOM_GENERICA><elementos><elemento><etiqueta>NumPedido</etiqueta><descripcion>Numero de pedido</descripcion><valor>&1</valor></elemento></elementos></EDICOM_GENERICA></customized>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_purchaseorder = zedoc_mx_addendas_get_data=>get_purchaseorder( salesdocumentnum = salesdocumentnum ).

    REPLACE '&1' IN w_l_addenda WITH w_l_purchaseorder.

    addenda = encode_base64( im_addenda = w_l_addenda ).


  ENDMETHOD.


  METHOD  addenda_pepsico.

    TYPES: BEGIN OF ty_s_billingidoc,
             item      TYPE   i_billingdocumentitem-billingdocumentitem,
             itemtext  TYPE   i_billingdocumentitem-billingdocumentitemtext,
             itemqty   TYPE   i_billingdocumentitem-billingquantity,
             unitprice TYPE   i_billingdocumentitem-creditrelatedprice,
             netamount TYPE   i_billingdocumentitem-netamount,
             taxamount TYPE   i_billingdocumentitem-taxamount.
    TYPES: END OF ty_s_billingidoc,
    ty_t_billingidoc TYPE STANDARD TABLE OF ty_s_billingidoc.

    TYPES: BEGIN OF ty_s_billingconditions,
             item      TYPE   i_billingdocumentitemprcgelmnt-billingdocumentitem,
             condtype  TYPE   i_billingdocumentitemprcgelmnt-conditiontype,
             baseprice TYPE  i_billingdocumentitemprcgelmnt-conditionbasevalue,
             ratevalue TYPE  i_billingdocumentitemprcgelmnt-conditionratevalue.

    TYPES: END OF ty_s_billingconditions,
    ty_t_billingconditions TYPE STANDARD TABLE OF ty_s_billingconditions.


    DATA: validaddenda             TYPE abap_boolean,
          w_l_addenda              TYPE string,
          w_l_addenda_ext          TYPE string,
          w_l_purchaseorder        TYPE string,
          w_l_bpidentification     TYPE string,
          w_l_uuid                 TYPE string,
          w_l_gr                   TYPE string,
          w_l_qty_str              TYPE string,
          w_l_output_len           TYPE int4,
          is_l_billingitem         TYPE ty_t_billingidoc,
          w_l_amount               TYPE i_billingdocumentitem-netamount,
          w_l_amount_str           TYPE string,
          is_l_unidadmeasurebyitem TYPE zedoc_mx_addendas_get_data=>ty_t_unitofmeasurebyitem,
          is_l_conditionprices     TYPE ty_t_billingconditions.

    FIELD-SYMBOLS: <fs_billingitem>  TYPE  ty_s_billingidoc,
                   <fs_unit_by_item> TYPE  zedoc_mx_addendas_get_data=>ty_s_unitofmeasurebyitem,
                   <fs_conditions>   TYPE  ty_s_billingconditions.


    validaddenda = check_addendatype( customernum = customernum  addendatype = 'PEPSICO'  salesdocumentnum = salesdocumentnum ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.

    w_l_addenda_ext = '<RequestCFD  version="2.0"  tipo="AddendaPCO"  idPedido="&1"><Documento  tipoDoc="1"  folioUUID="&2"/> <Proveedor  idProveedor="&3"/>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_purchaseorder = zedoc_mx_addendas_get_data=>get_purchaseorder( salesdocumentnum = salesdocumentnum ).

    REPLACE '&1' IN w_l_addenda WITH w_l_purchaseorder.

    w_l_uuid = zedoc_mx_addendas_get_data=>get_custinv_uuid( salesdocumentnum = salesdocumentnum ).

    REPLACE '&2' IN w_l_addenda WITH w_l_uuid.

    w_l_bpidentification = zedoc_mx_addendas_get_data=>get_bpidentificationnumber( customernum = customernum  ).

    REPLACE '&3' IN w_l_addenda WITH w_l_bpidentification.

    SELECT billingdocumentitem,
           billingdocumentitemtext,
           billingquantity,
           creditrelatedprice,
           netamount,
           taxamount
      FROM i_billingdocumentitem  WITH PRIVILEGED ACCESS
      WHERE billingdocument = @salesdocumentnum
      INTO TABLE @is_l_billingitem.


    w_l_gr =  zedoc_mx_addendas_get_data=>get_folionr1( salesdocumentnum = salesdocumentnum  ).


    CALL METHOD zedoc_mx_addendas_get_data=>get_unit_measure_by_item
      EXPORTING
        salesdocumentnum     = salesdocumentnum
        language             = 'S'
      IMPORTING
        unit_measure_by_item = is_l_unidadmeasurebyitem.


    SELECT billingdocumentitem,
            conditiontype,
            conditionbasevalue,
            conditionratevalue
       FROM i_billingdocumentitemprcgelmnt  WITH PRIVILEGED ACCESS
      WHERE billingdocument = @salesdocumentnum
         AND conditioninactivereason IS INITIAL
       INTO TABLE @is_l_conditionprices.

    CHECK sy-subrc EQ 0.



    w_l_addenda_ext = '<Recepciones>'.

    w_l_output_len = 6.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    LOOP AT  is_l_billingitem
      ASSIGNING <fs_billingitem>.

      w_l_addenda_ext = '<Recepcion   idRecepcion="&4">' .

      CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

      REPLACE '&4' IN w_l_addenda WITH w_l_gr.

      w_l_addenda_ext = '<Concepto  cantidad="&5"  unidad="&6"   descripcion="&7"  valorUnitario="&8"  importe="&9"/> </Recepcion>'.


      CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.


      w_l_qty_str = zedoc_mx_addendas_get_data=>output_qty_decimalplaces( qty_value = <fs_billingitem>-itemqty
                                                                          decimal_places =  w_l_output_len  ).


      REPLACE '&5' IN w_l_addenda WITH w_l_qty_str.

      READ TABLE is_l_unidadmeasurebyitem
        ASSIGNING <fs_unit_by_item>
        WITH KEY  billingitem = <fs_billingitem>-item.

      IF sy-subrc EQ 0.

        REPLACE '&6' IN w_l_addenda WITH <fs_unit_by_item>-unitofmeasure.

      ELSE.

        REPLACE '&6' IN w_l_addenda WITH ' '.

      ENDIF.


      REPLACE '&7' IN w_l_addenda WITH <fs_billingitem>-itemtext.

      LOOP AT is_l_conditionprices
"      READ TABLE is_l_conditionprices
        ASSIGNING <fs_conditions>
 "       WITH KEY  item = <fs_billingitem>-item
 "                 condtype = 'PPR0'.
        WHERE item = <fs_billingitem>-item
           AND    (     condtype = 'PPR0'
                     OR condtype = 'ZPM'
                     OR condtype = 'ZPP$' ).

        "      IF sy-subrc EQ 0.

        w_l_amount = <fs_conditions>-ratevalue.

        w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                                                                decimal_places =  w_l_output_len  ).
        EXIT.

      ENDLOOP.

      IF sy-subrc IS INITIAL.

        REPLACE '&8' IN w_l_addenda WITH w_l_amount_str.
      ELSE.
        REPLACE '&8' IN w_l_addenda WITH ' '.

      ENDIF.

      READ TABLE is_l_conditionprices
        ASSIGNING <fs_conditions>
        WITH KEY  item = <fs_billingitem>-item
                  condtype = 'TMX1'.

      IF sy-subrc EQ 0.



        w_l_amount = <fs_conditions>-baseprice.

        w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                                                                  decimal_places =  w_l_output_len  ).

        REPLACE '&9' IN w_l_addenda WITH w_l_amount_str.
      ELSE.
        REPLACE '&9' IN w_l_addenda WITH ' '.

      ENDIF.


    ENDLOOP.

    w_l_addenda_ext = '</Recepciones></RequestCFD>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    "ES20250626 BEG
    addenda = encode_base64( im_addenda = w_l_addenda ).


    "   addenda = w_l_addenda.

    "ES20250626 END

  ENDMETHOD.


  METHOD  addenda_pfizer.

    TYPES: BEGIN OF ty_s_billingidoc,
             item      TYPE   i_billingdocumentitem-billingdocumentitem,
             itemqty   TYPE   i_billingdocumentitem-billingquantity,
             unitprice TYPE   i_billingdocumentitem-creditrelatedprice,
             linenum   TYPE   i_billingdocumentitem-yy1_linenum_bdi.
    TYPES: END OF ty_s_billingidoc,
    ty_t_billingidoc TYPE STANDARD TABLE OF ty_s_billingidoc.

    TYPES: BEGIN OF ty_s_billingconditions,
             item      TYPE   i_billingdocumentitemprcgelmnt-billingdocumentitem,
             condtype  TYPE   i_billingdocumentitemprcgelmnt-conditiontype,
             baseprice TYPE  i_billingdocumentitemprcgelmnt-conditionratevalue.
    TYPES: END OF ty_s_billingconditions,
    ty_t_billingconditions TYPE STANDARD TABLE OF ty_s_billingconditions.


    DATA: validaddenda         TYPE abap_boolean,
          w_l_addenda          TYPE string,
          w_l_addenda_ext      TYPE string,
          w_l_purchaseorder    TYPE string,
          is_l_billingitem     TYPE ty_t_billingidoc,
          is_l_conditionprices TYPE ty_t_billingconditions,
          w_l_amount           TYPE i_billingdocumentitem-netamount,
          w_l_qty_str          TYPE string,
          w_l_amount_str       TYPE string,
          w_l_output_len       TYPE int4.


    FIELD-SYMBOLS: <fs_billingitem> TYPE  ty_s_billingidoc,
                   <fs_conditions>  TYPE  ty_s_billingconditions.

    validaddenda = check_addendatype( customernum = customernum  addendatype = 'PFIZER' salesdocumentnum = salesdocumentnum ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.

    w_l_addenda_ext = '<Pfizer_Ebox  TipoAddenda="01"><PfizerPO>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_purchaseorder = zedoc_mx_addendas_get_data=>get_purchaseorder( salesdocumentnum = salesdocumentnum ).

    REPLACE '&1' IN w_l_addenda WITH w_l_purchaseorder.

    SELECT billingdocumentitem,
           billingquantity,
           creditrelatedprice,
           yy1_linenum_bdi
     FROM i_billingdocumentitem  WITH PRIVILEGED ACCESS
     WHERE billingdocument = @salesdocumentnum
     INTO TABLE @is_l_billingitem.

    CHECK sy-subrc EQ 0.

    SELECT billingdocumentitem,
           conditiontype,
           conditionratevalue
      FROM i_billingdocumentitemprcgelmnt  WITH PRIVILEGED ACCESS
     WHERE billingdocument = @salesdocumentnum
      INTO TABLE @is_l_conditionprices.

    CHECK sy-subrc EQ 0.



    LOOP AT  is_l_billingitem
       ASSIGNING <fs_billingitem>.

      w_l_addenda_ext = '<Lineas  PO_NUMBER="&1" QUANTITY="&2" LINE_NO="&3" AMOUNT="&4" TAX_CODE="&5"/>' .

      CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

      REPLACE '&1' IN w_l_addenda WITH w_l_purchaseorder.

      w_l_output_len = 0.

      w_l_qty_str = zedoc_mx_addendas_get_data=>output_qty_decimalplaces( qty_value = <fs_billingitem>-itemqty
                                                                          decimal_places =  w_l_output_len  ).

      REPLACE '&2' IN w_l_addenda WITH w_l_qty_str.

      REPLACE '&3' IN w_l_addenda WITH <fs_billingitem>-linenum.

      READ TABLE is_l_conditionprices
        ASSIGNING <fs_conditions>
        WITH KEY  item = <fs_billingitem>-item
                  condtype = 'PPR0'.

      IF sy-subrc EQ 0.

        w_l_amount = <fs_conditions>-baseprice.

        w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                                                                decimal_places =  w_l_output_len  ).

        REPLACE '&4' IN w_l_addenda WITH w_l_amount_str.

      ENDIF.


      READ TABLE is_l_conditionprices
        ASSIGNING <fs_conditions>
        WITH KEY condtype = 'TMX1'.

      IF sy-subrc EQ  0.

        REPLACE '&5' IN w_l_addenda WITH 'F2'.

      ENDIF.

      READ TABLE is_l_conditionprices
        ASSIGNING <fs_conditions>
        WITH KEY condtype = 'TMX2'.

      IF sy-subrc EQ  0.

        REPLACE '&5' IN w_l_addenda WITH 'F1'.

      ENDIF.



    ENDLOOP.

    w_l_addenda_ext = '</PfizerPO></Pfizer_Ebox>' .

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.



    "ES20250626 BEG
    addenda = encode_base64( im_addenda = w_l_addenda ).


    "   addenda = w_l_addenda.

    "ES20250626 END




  ENDMETHOD.


  METHOD  addenda_robertbosh.

    DATA: w_l_purchaseorder TYPE string,
          w_l_addenda       TYPE string,
          w_l_addenda_ext   TYPE string,
          w_l_plant_code    TYPE string,
          w_l_plant_desc    TYPE string,
          validaddenda      TYPE abap_boolean.


    validaddenda = check_addendatype( customernum = customernum  addendatype = 'ROBERTBOSCH' salesdocumentnum = salesdocumentnum  ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.

    w_l_addenda_ext =  ' <customized xmlns="http://repository.edicomnet.com/schemas/mx/cfd/addenda" xsi:schemaLocation="http://repository.edicomnet.com/schemas/mx/cfd/addenda http://repository.edicomnet.com/schemas/mx/cfd/addenda/customized.xsd">'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.


    w_l_addenda_ext =  '<EDICOM_GENERICA><elementos><elemento><etiqueta>CP</etiqueta><descripcion>Codigo Planta</descripcion><valor>&1</valor></elemento>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = '<elemento><etiqueta>&3</etiqueta><descripcion>&4</descripcion><valor>&5</valor></elemento>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = '<elemento><etiqueta>&6</etiqueta><descripcion>&7</descripcion><valor>&2</valor></elemento></elementos></EDICOM_GENERICA></customized>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_purchaseorder = zedoc_mx_addendas_get_data=>get_purchaseorder( salesdocumentnum = salesdocumentnum ).

    DATA:
      w_sorg TYPE  i_billingdocumentitembasic-salesorganization,
      w_dist TYPE  i_billingdocumentitembasic-distributionchannel,
      w_sold TYPE  i_billingdocumentitembasic-soldtoparty,
      w_ship TYPE  i_billingdocumentitembasic-shiptoparty.


    SELECT SINGLE
       i_billingdocumentitembasic~salesorganization,
    i_billingdocumentitembasic~distributionchannel,
    i_billingdocumentitembasic~soldtoparty,
       i_billingdocumentitembasic~shiptoparty
    FROM i_billingdocumentitembasic
    WITH PRIVILEGED ACCESS
    WHERE billingdocument = @salesdocumentnum
    INTO ( @w_sorg, @w_dist, @w_sold, @w_ship ).

    IF sy-subrc IS INITIAL.

      SELECT SINGLE
         i_custsalespartnerfunc~customerpartnerdescription
      FROM i_custsalespartnerfunc
      WITH PRIVILEGED ACCESS
      WHERE customer   = @w_sold
        AND salesorganization = @w_sorg
        AND distributionchannel = @w_dist
        AND partnerfunction = 'WE'
        AND bpcustomernumber =  @w_ship
      INTO @w_l_plant_desc.

    ENDIF.


*   SELECT SINGLE
*           i_billingdocumentbasic~yy1_plantarobertbosch_bdh
*      FROM i_billingdocumentbasic WITH PRIVILEGED ACCESS
*     WHERE billingdocument = @salesdocumentnum
*      INTO @w_l_plant_code.

*    CHECK sy-subrc EQ 0.


*    SELECT SINGLE
*           zr_plrobertbosch_w~description
*    FROM
*           zr_plrobertbosch_w  WITH PRIVILEGED ACCESS
*    WHERE plantcode = @w_l_plant_code
*    INTO  @w_l_plant_desc.

    CHECK sy-subrc EQ 0.

    REPLACE '&1' IN w_l_addenda WITH w_l_plant_desc.



    IF  w_l_plant_desc EQ 'RBME'.

      REPLACE '&3' IN w_l_addenda WITH 'DC'.
      REPLACE '&4' IN w_l_addenda WITH 'Division Comercial'.
      REPLACE '&5' IN w_l_addenda WITH 'SS'.
      REPLACE '&6' IN w_l_addenda WITH 'OCC'.
      REPLACE '&7' IN w_l_addenda WITH 'ORDEN DE COMPRA O CONTRATO'.
      REPLACE '&2' IN w_l_addenda WITH 'ORDEN DE COMPRA'.

    ELSE.

      REPLACE '&3' IN w_l_addenda WITH 'OCC'.
      REPLACE '&4' IN w_l_addenda WITH 'ORDEN DE COMPRA O CONTRATO'.
      REPLACE '&5' IN w_l_addenda WITH 'ORDEN DE COMPRA'.
      REPLACE '&6' IN w_l_addenda WITH 'OC'.
      REPLACE '&7' IN w_l_addenda WITH 'Orden de Compra'.
      REPLACE '&2' IN w_l_addenda WITH w_l_purchaseorder.


    ENDIF.

    addenda = encode_base64( im_addenda = w_l_addenda ).

    use_of_cfdi = use_of_cfdi.

  ENDMETHOD.


  METHOD addenda_sanmina.


    DATA: w_l_purchaseorder    TYPE string,
          w_l_addenda          TYPE string,
          w_l_addenda_ext      TYPE string,
          w_l_currency         TYPE string,
          w_l_bpidentification TYPE string,
          validaddenda         TYPE abap_boolean.


    validaddenda = check_addendatype( customernum = customernum  addendatype = 'SANMINA' salesdocumentnum = salesdocumentnum ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.


    w_l_addenda_ext = '<SANMINA:AP email="analista3@principado.com.mx" Currency="&1" ExchangeRate="1.0000" InternalInvoiceNumber="&2" PONumber="&3"  LegalEntityName="SANMINA-SCI RSP DE MEXICO" '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext =  ' CustomerCode="&4"  /> '.


    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = ' xmlns:SANMINA="https://webapps2.sanmina-sci.com/partners-access" xsi:schemaLocation="https://webapps2.sanmina-sci.com/partners-access https://webapps2.sanmina-sci.com/partners-access/addenda-sanmina.xsd"/>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    REPLACE '&2' IN w_l_addenda WITH salesdocumentnum.

    w_l_purchaseorder = zedoc_mx_addendas_get_data=>get_purchaseorder( salesdocumentnum = salesdocumentnum ).

    REPLACE '&3' IN w_l_addenda WITH w_l_purchaseorder.

    w_l_currency = zedoc_mx_addendas_get_data=>get_currency( salesdocumentnum = salesdocumentnum ).

    REPLACE '&1' IN w_l_addenda WITH w_l_currency.

    w_l_bpidentification = zedoc_mx_addendas_get_data=>get_bpidentificationnumber( customernum = customernum  ).

    REPLACE '&4' IN w_l_addenda WITH w_l_bpidentification.

    addenda = encode_base64( im_addenda = w_l_addenda ).


  ENDMETHOD.


  METHOD addenda_stellanties.

    TYPES: BEGIN OF ty_s_billingidocitem,
             item      TYPE   i_billingdocumentitem-billingdocumentitem,
             itemqty   TYPE   i_billingdocumentitem-billingquantity,
             unitprice TYPE   i_billingdocumentitem-creditrelatedprice,
             netamount TYPE   i_billingdocumentitem-netamount,
             product   TYPE   i_billingdocumentitem-product,
             taxamount TYPE   i_billingdocumentitem-taxamount,
             linenum   TYPE i_billingdocumentitem-yy1_linenum_bdi.
    TYPES: END OF ty_s_billingidocitem,
    ty_t_billingidoc TYPE STANDARD TABLE OF ty_s_billingidocitem.

    TYPES: BEGIN OF ty_s_billingdocument,
             billingdoc TYPE  i_billingdocumentbasic-billingdocument,
             tipodoc    TYPE   i_billingdocumentbasic-yy1_tipodocumentostell_bdh,
             docdate    TYPE   i_billingdocumentbasic-billingdocumentdate,
             totnet     TYPE   i_billingdocumentbasic-totalnetamount,
             tottax     TYPE   i_billingdocumentbasic-totaltaxamount,
             planta     TYPE   i_billingdocumentbasic-yy1_planta_bdh.
    TYPES: END OF ty_s_billingdocument,
    ty_t_billingdoc TYPE STANDARD TABLE OF ty_s_billingdocument.

    TYPES: BEGIN OF ty_s_billingconditions,
             item      TYPE   i_billingdocumentitemprcgelmnt-billingdocumentitem,
             condtype  TYPE   i_billingdocumentitemprcgelmnt-conditiontype,
             baseprice TYPE  i_billingdocumentitemprcgelmnt-conditionbasevalue,
             ratevalue TYPE  i_billingdocumentitemprcgelmnt-conditionratevalue.
    TYPES: END OF ty_s_billingconditions,
    ty_t_billingconditions TYPE STANDARD TABLE OF ty_s_billingconditions.


    TYPES: BEGIN OF ty_s_unitofmeasurebyitem,
             billingitem   TYPE i_billingdocumentitem-billingdocumentitem,
             unitofmeasure TYPE i_unitofmeasuretext-unitofmeasurecommercialname.
    TYPES: END OF ty_s_unitofmeasurebyitem,
    ty_t_unitofmeasurebyitem TYPE STANDARD TABLE OF ty_s_unitofmeasurebyitem.



    DATA: validaddenda             TYPE abap_boolean,
          w_l_addenda              TYPE string,
          w_l_addenda_ext          TYPE string,
          is_l_billingitem         TYPE ty_t_billingidoc,
          is_l_billingdocument     TYPE ty_s_billingdocument,
          w_l_day                  TYPE string,
          w_l_month                TYPE string,
          w_l_year                 TYPE string,
          w_l_fecrec_str           TYPE string,
          w_l_amount_str           TYPE string,
          w_l_amount               TYPE i_billingdocumentitem-netamount,
          w_l_output_len           TYPE int4,
          w_l_currency             TYPE string,
          w_l_bpidentification     TYPE string,
          w_l_plant_desc           TYPE string,
          w_l_purchaseorder        TYPE string,
          w_l_remision             TYPE string,
          w_l_qty_str              TYPE string,
          w_l_line_num             TYPE string,
          is_l_unidadmeasurebyitem TYPE ty_t_unitofmeasurebyitem,
          is_l_conditionprices     TYPE ty_t_billingconditions.


    FIELD-SYMBOLS: <fs_billingitem>  TYPE ty_s_billingidocitem,
                   <fs_unit_by_item> TYPE  ty_s_unitofmeasurebyitem,
                   <fs_conditions>   TYPE  ty_s_billingconditions.


    validaddenda = check_addendatype( customernum = customernum  addendatype = 'STELLANTIS' salesdocumentnum = salesdocumentnum ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.

    w_l_addenda_ext =  '<factura TipoDocumentoFiscal="FA" tipoDocumento="&1"  fecha="&2" folioFiscal="&3" montoTotal="&4" referenciaProveedor="&5" serie="&6"  '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext =  ' version="1.0"><moneda tipoMoneda="&7"/> <proveedor codigo="&8" nombre="PAPELERA PRINCIPADO SA DE CV"/><destino codigo="&9" nombre="&10"/><otrosCargos codigo="V6" monto="&11"/>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.


    SELECT SINGLE
           billingdocument,
           yy1_tipodocumentostell_bdh,
           billingdocumentdate,
           totalnetamount,
           totaltaxamount,
           yy1_planta_bdh
      FROM i_billingdocumentbasic  WITH PRIVILEGED ACCESS
      WHERE billingdocument = @salesdocumentnum
      INTO  @is_l_billingdocument.

    CHECK sy-subrc EQ 0.


    SELECT billingdocumentitem,
          billingquantity,
          creditrelatedprice,
          netamount,
          product,
          taxamount,
          yy1_linenum_bdi
     FROM i_billingdocumentitem  WITH PRIVILEGED ACCESS
     WHERE billingdocument = @salesdocumentnum
     INTO TABLE @is_l_billingitem.

    CHECK sy-subrc EQ 0.

    SELECT billingdocumentitem,
           conditiontype,
           conditionbasevalue,
           conditionratevalue
      FROM i_billingdocumentitemprcgelmnt  WITH PRIVILEGED ACCESS
     WHERE billingdocument = @salesdocumentnum
      INTO TABLE @is_l_conditionprices.

    CHECK sy-subrc EQ 0.



    REPLACE '&1' IN w_l_addenda WITH is_l_billingdocument-tipodoc.

    w_l_day   = is_l_billingdocument-docdate+6(2).
    w_l_month = is_l_billingdocument-docdate+4(2).
    w_l_year  = is_l_billingdocument-docdate+0(4).

    CONCATENATE w_l_year '-' w_l_month '-' w_l_day INTO w_l_fecrec_str.

    REPLACE '&2' IN w_l_addenda WITH w_l_fecrec_str.

    REPLACE '&3' IN w_l_addenda WITH is_l_billingdocument-billingdoc+2.


    w_l_output_len = 2.

    w_l_amount = is_l_billingdocument-totnet + is_l_billingdocument-tottax.

    w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                                                                decimal_places =  w_l_output_len  ).

    REPLACE '&4' IN w_l_addenda WITH w_l_amount_str.

    REPLACE '&5' IN w_l_addenda WITH salesdocumentnum.


    REPLACE '&6' IN w_l_addenda WITH is_l_billingdocument-billingdoc+0(2).

    w_l_currency = zedoc_mx_addendas_get_data=>get_currency( salesdocumentnum = salesdocumentnum ).

    REPLACE '&7' IN w_l_addenda WITH w_l_currency.

    w_l_bpidentification = zedoc_mx_addendas_get_data=>get_bpidentificationnumber( customernum = customernum  ).

    REPLACE '&8' IN w_l_addenda WITH w_l_bpidentification.

    REPLACE '&9' IN w_l_addenda WITH is_l_billingdocument-planta.



    w_l_output_len = 2.

    w_l_amount =  is_l_billingdocument-tottax.

    w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                                                                decimal_places =  w_l_output_len  ).

    REPLACE '&11' IN w_l_addenda WITH w_l_amount_str.


    CALL METHOD zedoc_mx_addendas_get_data=>get_unit_measure_by_item
      EXPORTING
        salesdocumentnum     = salesdocumentnum
        language             = 'E'
      IMPORTING
        unit_measure_by_item = is_l_unidadmeasurebyitem.


    w_l_purchaseorder = zedoc_mx_addendas_get_data=>get_purchaseorder( salesdocumentnum = salesdocumentnum ).

    w_l_remision      = zedoc_mx_addendas_get_data=>get_remision( salesdocumentnum = salesdocumentnum  ).

    w_l_addenda_ext = '<partes>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    LOOP AT  is_l_billingitem
     ASSIGNING <fs_billingitem>.

      w_l_addenda_ext = '<parte cantidad="&12" fechaRecibo="&13" montoDeLinea="&14" numero="&15" precioUnitario="&16"  unidadDeMedida="&17"> <references ammendment="&18" ordenCompra="&19" packingList="&20" releaseRequisicion="&21"/> </parte>' .

      CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

      w_l_output_len = 2.

      w_l_qty_str = zedoc_mx_addendas_get_data=>output_qty_decimalplaces( qty_value = <fs_billingitem>-itemqty
                                                                          decimal_places =  w_l_output_len  ).

      REPLACE '&12' IN w_l_addenda WITH w_l_qty_str.

      REPLACE '&13' IN w_l_addenda WITH w_l_fecrec_str.

      w_l_amount = <fs_billingitem>-netamount.

      w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                                                                decimal_places =  w_l_output_len  ).

      REPLACE '&14' IN w_l_addenda WITH w_l_amount_str.


      REPLACE '&15' IN w_l_addenda WITH <fs_billingitem>-product.

      READ TABLE is_l_conditionprices
        ASSIGNING <fs_conditions>
        WITH KEY  item = <fs_billingitem>-item
                  condtype = 'PPR0'.



      w_l_amount = <fs_conditions>-ratevalue.

      w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                                                                decimal_places =  w_l_output_len  ).

      REPLACE '&16' IN w_l_addenda WITH w_l_amount_str.

      READ TABLE is_l_unidadmeasurebyitem
        ASSIGNING <fs_unit_by_item>
        WITH KEY  billingitem = <fs_billingitem>-item.

      IF sy-subrc EQ 0.

        REPLACE '&17' IN w_l_addenda WITH <fs_unit_by_item>-unitofmeasure.

      ENDIF.

      w_l_line_num = <fs_billingitem>-linenum.

      w_l_output_len = 5.

      w_l_line_num = zedoc_mx_addendas_get_data=>complete_left_zeros( str_number = w_l_line_num offset = w_l_output_len ).

      REPLACE '&18' IN w_l_addenda WITH w_l_line_num.

      REPLACE '&19' IN w_l_addenda WITH w_l_purchaseorder.

      REPLACE '&20' IN w_l_addenda WITH w_l_remision.

      REPLACE '&21' IN w_l_addenda WITH w_l_purchaseorder.


    ENDLOOP.

    w_l_addenda_ext = '</partes></factura>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.



    "ES20250626 BEG
    addenda = encode_base64( im_addenda = w_l_addenda ).


    "   addenda = w_l_addenda.

    "ES20250626 END


  ENDMETHOD.


  METHOD  addenda_waldos.

    DATA:
      w_l_purchaseorder TYPE string,
      w_l_addenda       TYPE string,
      w_l_addenda_ext   TYPE string,
      validaddenda      TYPE abap_boolean.

    validaddenda = check_addendatype( customernum = customernum  addendatype = 'GRUPO VIZION' salesdocumentnum = salesdocumentnum ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.

    w_l_addenda_ext =  '<waldos:numOrdenCompra xmlns:waldos="http://facturacion.waldos.com/addendaWaldos.xsd"> ' .
    CONCATENATE        w_l_addenda  w_l_addenda_ext INTO w_l_addenda.


    w_l_addenda_ext =  '&1</waldos:numOrdenCompra>'.
    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_purchaseorder = zedoc_mx_addendas_get_data=>get_purchaseorder( salesdocumentnum = salesdocumentnum ).

    REPLACE '&1' IN w_l_addenda WITH w_l_purchaseorder.

    addenda = encode_base64( im_addenda = w_l_addenda ).



  ENDMETHOD.


  METHOD addenda_continental.


    DATA: w_l_purchaseorder    TYPE string,
          w_l_addenda          TYPE string,
          w_l_addenda_ext      TYPE string,
          w_l_currency         TYPE string,
          w_l_bpidentification TYPE string,
          validaddenda         TYPE abap_boolean.


    validaddenda = check_addendatype( customernum = customernum  addendatype = 'CONTINENTAL' salesdocumentnum = salesdocumentnum ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.


    w_l_addenda_ext = '<CONTINENTALREC xmlns="http://repository.edicomnet.com/schemas/mx/cfd/addenda" xsi:schemaLocation="http://repository.edicomnet.com/schemas/mx/cfd/addenda schema.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"> '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = ' <creditMemo valor="NO"> <referencia>&01</referencia> </creditMemo> <refacturacion valor="NO">  <referencia>&02</referencia></refacturacion> '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = ' <planta>&03</planta><remision>&04</remision><ordenCompra>&05</ordenCompra><numProveedor>&06</numProveedor><numPedidoProv>&07</numPedidoProv> '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = '  <informacionBancaria> <Banco>&08</Banco> <Cuenta>&09</Cuenta><CuentaInterbancaria>&10</CuentaInterbancaria><Moneda>&11</Moneda></informacionBancaria> '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = ' <contactoNotificaciones><nombre>&12</nombre> <correo>&13</correo><telefono>&14</telefono> </contactoNotificaciones><detalles> '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    "loop at.
    w_l_addenda_ext = '    <detalle> <numItem>&15</numItem> <numMaterial>&16</numMaterial></detalle> '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    "endloop.
    w_l_addenda_ext = '  </detalles></CONTINENTALREC> '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.



    REPLACE ALL OCCURRENCES OF '&' IN w_l_addenda WITH 'E_'.

    addenda = encode_base64( im_addenda = w_l_addenda ).


  ENDMETHOD.

  METHOD addenda_walmart.

    TYPES: BEGIN OF ty_s_billingidocitem,
             item      TYPE   i_billingdocumentitem-billingdocumentitem,
             itemtext  TYPE   i_billingdocumentitem-billingdocumentitemtext,
             itemqty   TYPE   i_billingdocumentitem-billingquantity,
             unitprice TYPE   i_billingdocumentitem-creditrelatedprice,
             netamount TYPE   i_billingdocumentitem-netamount,
             product   TYPE   i_billingdocumentitem-product,
             taxamount TYPE   i_billingdocumentitem-taxamount,
             ean11     TYPE   i_billingdocumentitem-internationalarticlenumber,
             salesdoc  TYPE   i_billingdocumentitem-salesdocument,
             linenum   TYPE i_billingdocumentitem-yy1_linenum_bdi.
    TYPES: END OF ty_s_billingidocitem,
    ty_t_billingidoc TYPE STANDARD TABLE OF ty_s_billingidocitem.

    TYPES: BEGIN OF ty_s_billingdocument,
             billingdoc TYPE  i_billingdocumentbasic-billingdocument,
             tipodoc    TYPE   i_billingdocumentbasic-yy1_tipodocumentostell_bdh,
             docdate    TYPE   i_billingdocumentbasic-billingdocumentdate,
             totnet     TYPE   i_billingdocumentbasic-totalnetamount,
             tottax     TYPE   i_billingdocumentbasic-totaltaxamount,
             planta     TYPE   i_billingdocumentbasic-yy1_planta_bdh,
             company    type   i_billingdocumentbasic-companycode,
             pterms     TYPE   i_billingdocumentbasic-customerpaymentterms.
    TYPES: END OF ty_s_billingdocument,
    ty_t_billingdoc TYPE STANDARD TABLE OF ty_s_billingdocument.

    TYPES: BEGIN OF ty_s_billingconditions,
             item      TYPE   i_billingdocumentitemprcgelmnt-billingdocumentitem,
             condtype  TYPE   i_billingdocumentitemprcgelmnt-conditiontype,
             baseprice TYPE  i_billingdocumentitemprcgelmnt-conditionbasevalue,
             ratevalue TYPE  i_billingdocumentitemprcgelmnt-conditionratevalue.
    TYPES: END OF ty_s_billingconditions,
    ty_t_billingconditions TYPE STANDARD TABLE OF ty_s_billingconditions.


    TYPES: BEGIN OF ty_s_unitofmeasurebyitem,
             billingitem   TYPE i_billingdocumentitem-billingdocumentitem,
             unitofmeasure TYPE i_unitofmeasuretext-unitofmeasurecommercialname.
    TYPES: END OF ty_s_unitofmeasurebyitem,
    ty_t_unitofmeasurebyitem TYPE STANDARD TABLE OF ty_s_unitofmeasurebyitem.


    DATA: w_l_purchaseorder        TYPE string,
           w_cuspurdat             type  i_salesdocument-customerpurchaseorderdate,
          w_l_addenda              TYPE string,
          w_l_addenda_ext          TYPE string,
          w_l_currency             TYPE string,
          w_l_bpidentification     TYPE string,
          validaddenda             TYPE abap_boolean,
          w_l_folionr1             TYPE string,
          w_l_soldto_desc          TYPE string,
          is_l_billingitem         TYPE ty_t_billingidoc,
          is_l_billingdocument     TYPE ty_s_billingdocument,
          w_l_day                  TYPE string,
          w_l_month                TYPE string,
          w_l_year                 TYPE string,
          w_l_fecrec_str           TYPE string,
          w_l_amount_str           TYPE string,
          w_l_amount               TYPE i_billingdocumentitem-netamount,
          w_l_output_len           TYPE int4,
          is_l_unidadmeasurebyitem TYPE ty_t_unitofmeasurebyitem,
          is_l_conditionprices     TYPE ty_t_billingconditions.

    DATA:
      w_l_bp_mail      TYPE string,
      w_l_email_custom TYPE string,
      w_l_bp_mailnotif TYPE string,
      w_l_num_oc       TYPE string,
      w_l_id_cust      TYPE string,
      w_l_num_prov     TYPE string,
      w_l_bp_calle     TYPE string,
      w_l_bp_no_ext    TYPE string,
      w_l_bp_no_int    TYPE string,
      w_l_bp_colonia   TYPE string,
      w_l_bp_munic     TYPE string,
      w_l_bp_estado    TYPE string,
      w_l_bp_pais      TYPE string,
      w_l_bp_cp        TYPE string,
      w_l_bp2_calle    TYPE string,
      w_l_bp2_no_ext   TYPE string,
      w_l_bp2_no_int   TYPE string,
      w_l_bp2_colonia  TYPE string,
      w_l_bp2_munic    TYPE string,
      w_l_bp2_estado   TYPE string,
      w_l_bp2_pais     TYPE string,
      w_l_bp2_cp       TYPE string,
      w_l_bp_city      TYPE string,
      w_l_bp2_city     TYPE string,
      w_l_bp_phone     TYPE string,
      w_l_bp2_phone    TYPE string,
      w_l_email_zm     TYPE string,
      w_l_email_ve     TYPE string,
      w_l_sku          TYPE string,
      w_l_comments     TYPE string,
      w_l_so           TYPE i_salesdocument-salesdocument,
      w_l_text03       TYPE string,
      w_l_taxid        TYPE string,
      w_l_shtaxid2     TYPE string,
      w_l_shtaxid5     TYPE string,
      w_l_shdesc       TYPE string,
      w_l_qty_str      TYPE string,
      w_l_uuid         TYPE string,
      w_l_extid        type string,
      w_l_coname       type string,
      w_l_costreet     type string,
      w_l_cohouse      type string,
      w_l_codist       type string,
      w_l_cocity       type string,
      w_l_copost       type string,
      w_l_coaddr       type string,
      W_L_CORFC        TYPE STRING,
      w_l_timdat       type string,
      w_l_add1         TYPE string.

    FIELD-SYMBOLS: <fs_billingitem>  TYPE ty_s_billingidocitem,
                   <fs_unit_by_item> TYPE  ty_s_unitofmeasurebyitem,
                   <fs_conditions>   TYPE  ty_s_billingconditions.

    DATA:
      w_sorg TYPE  i_billingdocumentitembasic-salesorganization,
      w_dist TYPE  i_billingdocumentitembasic-distributionchannel,
      w_sold TYPE  i_billingdocumentitembasic-soldtoparty,
      w_ship TYPE  i_billingdocumentitembasic-shiptoparty.



    validaddenda = check_addendatype( customernum = customernum  addendatype = 'WALMART' salesdocumentnum = salesdocumentnum ).

    CHECK  validaddenda EQ abap_true.


    SELECT SINGLE
           billingdocument,
           yy1_tipodocumentostell_bdh,
           billingdocumentdate,
           totalnetamount,
           totaltaxamount,
           yy1_planta_bdh,
           companycode,
           customerpaymentterms
      FROM i_billingdocumentbasic  WITH PRIVILEGED ACCESS
      WHERE billingdocument = @salesdocumentnum
      INTO  @is_l_billingdocument.




    CHECK sy-subrc EQ 0.


    SELECT billingdocumentitem,
          billingdocumentitemtext,
          billingquantity,
          creditrelatedprice,
          netamount,
          product,
          taxamount,
          salesdocument,
          yy1_linenum_bdi
     FROM i_billingdocumentitem  WITH PRIVILEGED ACCESS
     WHERE billingdocument = @salesdocumentnum
     INTO TABLE @is_l_billingitem.

    CHECK sy-subrc EQ 0.

    SELECT billingdocumentitem,
           conditiontype,
           conditionbasevalue,
           conditionratevalue
      FROM i_billingdocumentitemprcgelmnt  WITH PRIVILEGED ACCESS
     WHERE billingdocument = @salesdocumentnum
      INTO TABLE @is_l_conditionprices.

    CHECK sy-subrc EQ 0.

    SELECT SINGLE
         i_billingdocumentitembasic~salesorganization,
      i_billingdocumentitembasic~distributionchannel,
      i_billingdocumentitembasic~soldtoparty,
         i_billingdocumentitembasic~shiptoparty,
          i_billingdocumentitembasic~salesdocument
      FROM i_billingdocumentitembasic
      WITH PRIVILEGED ACCESS
      WHERE billingdocument = @salesdocumentnum
      INTO ( @w_sorg, @w_dist, @w_sold, @w_ship, @w_l_so ).

    IF sy-subrc IS INITIAL.

      SELECT SINGLE
         i_customer~customername,
          i_customer~taxnumber1
      FROM i_customer
      WITH PRIVILEGED ACCESS
      WHERE customer   = @w_sold

      INTO ( @w_l_soldto_desc, @w_l_taxid ) .

      SELECT SINGLE
          i_bupaidentification~bpidentificationnumber

       FROM i_bupaidentification
       WITH PRIVILEGED ACCESS
       WHERE businesspartner   = @w_ship
         AND bpidentificationtype = 'BUP002'

       INTO @w_l_shtaxid2  .

      SELECT SINGLE
          i_bupaidentification~bpidentificationnumber

       FROM i_bupaidentification
       WITH PRIVILEGED ACCESS
       WHERE businesspartner   = @w_ship
         AND bpidentificationtype = 'BUP005'

       INTO @w_l_shtaxid5  .

      SELECT SINGLE
           i_customer~customername

        FROM i_customer
        WITH PRIVILEGED ACCESS
        WHERE customer   = @w_ship
        INTO @w_l_shdesc .

    ENDIF.


    CLEAR w_l_addenda.


    w_l_addenda_ext = '<cfdi:Addenda xmlns:cfdi="http://www.sat-gob.mx/cfd/3"> <Documento>UNB+UNOA:2+EVO90L:ZZ+925485MX00:8+&01+&02''UNH+140957+INVOIC:D:01B:UN:AMC002''BGM+380+&02+'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = '9''DTM+137:&03:204''FTX+ZZZ+++&04+ES''RFF+ON:&05''DTM+171:&6:102''RFF+BT:&06''NAD+BY+&07::9++&08+&09'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = '''RFF+GN:&10''NAD+SU+++&11+&12''RFF+GN:&13''RFF+IA:&14''NAD+ST+&15::9++&16 &17+&18'' '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_addenda_ext = 'CUX+2:&21:4''PAT+1++5:3:D:&22'''.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    "REPLACE '&01' in w_l_addenda with w_l_purchaseorder.

    w_l_timdat = zedoc_mx_addendas_get_data=>get_custinv_timbrado_date( salesdocumentnum = salesdocumentnum ).

    REPLACE '&01' in w_l_addenda with w_l_timdat.

    w_l_folionr1 = zedoc_mx_addendas_get_data=>get_folionr1( salesdocumentnum = salesdocumentnum ).

    REPLACE all OCCURRENCES OF '&02' IN w_l_addenda WITH w_l_folionr1.

    w_l_output_len = 2.

    w_l_amount = is_l_billingdocument-totnet + is_l_billingdocument-tottax.

    w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                                                                decimal_places =  w_l_output_len  ).



    REPLACE '&03' IN w_l_addenda WITH w_l_timdat.

    REPLACE '&04' IN w_l_addenda WITH w_l_amount_str.

    w_l_purchaseorder = zedoc_mx_addendas_get_data=>get_purchaseorder( salesdocumentnum = salesdocumentnum ).
    REPLACE '&05' IN w_l_addenda WITH w_l_purchaseorder.

   read table is_l_billingitem
      ASSIGNING <fs_billingitem>
      index 1.

   if sy-subrc is INITIAL.

   SELECT SINGLE

          i_salesdocument~customerpurchaseorderdate
        FROM i_salesdocument
         WITH PRIVILEGED ACCESS
         WHERE
          salesdocument = @<fs_billingitem>-salesdoc
          INTO  @w_cuspurdat.


    w_l_day   = w_cuspurdat+6(2).
    w_l_month = w_cuspurdat+4(2).
    w_l_year  = w_cuspurdat+0(4).

    CONCATENATE w_l_year '-' w_l_month '-' w_l_day INTO w_l_fecrec_str.

    REPLACE '&6' IN w_l_addenda WITH w_l_fecrec_str.



   ENDIF.




    REPLACE '&06' IN w_l_addenda WITH is_l_billingdocument-billingdoc+2.

    w_l_bpidentification = zedoc_mx_addendas_get_data=>get_bpidentificationnumber( customernum = customernum  ).

    REPLACE '&07' IN w_l_addenda WITH w_l_bpidentification.

    REPLACE '&08' IN w_l_addenda WITH  w_l_soldto_desc.

    CALL METHOD zedoc_mx_addendas_get_data=>get_bp_address
      EXPORTING
        customernum      = customernum
        salesdocumentnum = w_l_so
      CHANGING
        emailaddress     = w_l_bp_mail
        emailnot         = w_l_bp_mailnotif
        numprov          = w_l_num_prov
        street           = w_l_bp_calle
        housenum1        = w_l_bp_no_ext
        housenum2        = w_l_bp_no_int
        township         = w_l_bp_colonia
        county           = w_l_bp_munic
        cityname         = w_l_bp_estado
        country          = w_l_bp_pais
        postalcode       = w_l_bp_cp
        city             = w_l_bp_city
        st_street        = w_l_bp2_calle
        st_housenum1     = w_l_bp2_no_ext
        st_housenum2     = w_l_bp2_no_int
        st_township      = w_l_bp2_colonia
        st_county        = w_l_bp2_munic
        st_cityname      = w_l_bp2_estado
        st_country       = w_l_bp2_pais
        st_postalcode    = w_l_bp2_cp
        st_city          = w_l_bp2_city
        phone1           = w_l_bp_phone
        phone2           = w_l_bp2_phone
        text03           = w_l_text03.

    CONCATENATE  w_l_bp_calle '' w_l_bp_no_ext
     '+' w_l_bp2_colonia '+' w_l_bp2_munic '+'
     w_l_bp2_estado '+' w_l_bp2_city '+' w_l_bp2_cp
      INTO w_l_add1.

    REPLACE '&09' IN w_l_addenda WITH  w_l_add1.
    REPLACE '&10' IN w_l_addenda WITH  w_l_taxid.
"i_organizationaddress begin pending code?
   select single  i_companycode~companycodename,
                   i_companycode~addressid,
                    i_companycode~CITYNAME
     from i_companycode
     WITH PRIVILEGED ACCESS
     where companycode = @is_l_billingdocument-company
     into (@w_l_coname, @w_l_coaddr, @W_L_COCITY  ) .

   if sy-subrc is INITIAL.

"   select single
"        i_addresspostaladdress~streetname,
"        i_addresspostaladdress~housenumber,
"        i_addresspostaladdress~districtname,
"        I_ADDRESSPOSTALADDRESS~CITYNAME,
"        i_addresspostaladdress~postalcode
"     from I_ADDRESSPOSTALADDRESS
"     WITH PRIVILEGED ACCESS
"      where AddressID = @w_l_coaddr
"       AND CORRESPONDENCELANGUAGE = 'S'
"      into ( @w_l_costreet,@w_l_cohouse, @w_l_codist, @w_l_cocity, @w_l_copost ) .
    SELECT SINGLE I_AddlCompanyCodeInformation~COMPANYCODEPARAMETERVALUE
     FROM I_AddlCompanyCodeInformation
     WITH PRIVILEGED ACCESS
     WHERE COMPANYCODE   = @is_l_billingdocument-company
     AND COMPANYCODEPARAMETERTYPE = 'MX_RFC'
     INTO @W_L_CORFC.


          REPLACE '&11' IN w_l_addenda WITH w_l_coname.

          REPLACE '&12' IN W_L_ADDENDA WITH W_L_COCITY.

          REPLACE '&13' IN w_l_addenda WITH W_L_CORFC.

   else.

    REPLACE '&11' IN w_l_addenda WITH  'AEROSOL MEDICAL SYSTEMS'.
    REPLACE '&12' IN w_l_addenda WITH  'Arenal Tepepan:7+Tlalpan+CDMX'.
    REPLACE '&13' IN w_l_addenda WITH 'AMS9404278V1'.

   endif.
"i_organizationaddress end
    REPLACE '&14' IN w_l_addenda WITH  w_l_shtaxid2.

    REPLACE '&15' IN w_l_addenda WITH  w_l_shtaxid5.

    SELECT SINGLE I_businesspartner~BusinessPartnerIDByExtSystem
     from I_businesspartner
     WITH PRIVILEGED ACCESS
     WHERE businesspartner = @customernum
     Into  @W_l_EXTID.

    if sy-subrc is INITIAL.

    REPLACE '&16' IN w_l_addenda WITH  w_l_extid.

    endif.

    REPLACE '&17' IN w_l_addenda WITH  w_l_shdesc.

    CALL METHOD zedoc_mx_addendas_get_data=>get_bp_address
      EXPORTING
        customernum      = w_ship
        salesdocumentnum = w_l_so
      CHANGING
        emailaddress     = w_l_bp_mail
        emailnot         = w_l_bp_mailnotif
        numprov          = w_l_num_prov
        street           = w_l_bp_calle
        housenum1        = w_l_bp_no_ext
        housenum2        = w_l_bp_no_int
        township         = w_l_bp_colonia
        county           = w_l_bp_munic
        cityname         = w_l_bp_estado
        country          = w_l_bp_pais
        postalcode       = w_l_bp_cp
        city             = w_l_bp_city
        st_street        = w_l_bp2_calle
        st_housenum1     = w_l_bp2_no_ext
        st_housenum2     = w_l_bp2_no_int
        st_township      = w_l_bp2_colonia
        st_county        = w_l_bp2_munic
        st_cityname      = w_l_bp2_estado
        st_country       = w_l_bp2_pais
        st_postalcode    = w_l_bp2_cp
        st_city          = w_l_bp2_city
        phone1           = w_l_bp_phone
        phone2           = w_l_bp2_phone
        text03           = w_l_text03.

    CONCATENATE  w_l_bp_calle '' w_l_bp_no_ext
     '+' w_l_bp2_colonia '+' w_l_bp2_munic '+'
     w_l_bp2_estado '+' w_l_bp2_city '+' w_l_bp2_cp
      INTO w_l_add1.

    REPLACE '&18' IN w_l_addenda WITH  w_l_add1.

    w_l_currency = zedoc_mx_addendas_get_data=>get_currency( salesdocumentnum = salesdocumentnum ).

    REPLACE '&21' IN w_l_addenda WITH w_l_currency.
    REPLACE '&22' IN w_l_addenda WITH is_l_billingdocument-pterms+2(2).

    w_l_output_len = 2.
    DATA: w_items TYPE n.
    CLEAR w_items.
    LOOP AT is_l_billingitem
      ASSIGNING <fs_billingitem>.

      w_l_addenda_ext = 'LIN+1++&24:SRV::9''IMD+F++:::&25::ES''QTY+47:&26:EA''MOA+203:&27'''.

      CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

      w_l_addenda_ext = 'PRI+AAA:&28::::EA''TAX+7+VAT+++:::&29+B''MOA+124:&30'''.

      CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

      IF  <fs_billingitem>-ean11 IS INITIAL.

        SELECT SINGLE i_product~productstandardid
        FROM i_product
        WITH PRIVILEGED ACCESS
        WHERE product = @<fs_billingitem>-product
        INTO @<fs_billingitem>-ean11.


      ENDIF.

      REPLACE '&24' IN w_l_addenda WITH <fs_billingitem>-ean11.



      REPLACE '&25' IN w_l_addenda WITH <fs_billingitem>-itemtext.


     w_l_qty_str = zedoc_mx_addendas_get_data=>output_qty_decimalplaces( qty_value = <fs_billingitem>-itemqty
                                                                           decimal_places =  w_l_output_len  ).
      REPLACE '&26' IN w_l_addenda WITH w_l_qty_str.


      w_l_amount = <fs_billingitem>-netamount.

      w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                         decimal_places =  w_l_output_len  ).

      REPLACE '&27' IN w_l_addenda WITH w_l_amount_str.


      REPLACE '&28' IN w_l_addenda WITH w_l_amount_str.



      READ TABLE is_l_conditionprices
        ASSIGNING <fs_conditions>
        WITH KEY  item = <fs_billingitem>-item
                  condtype = 'TMX1'.

      IF sy-subrc EQ 0.

        w_l_amount = <fs_conditions>-ratevalue.

        w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                                                                decimal_places =  w_l_output_len  ).

        REPLACE '&29' IN w_l_addenda WITH w_l_amount_str.

      ENDIF.
      w_l_amount = <fs_billingitem>-taxamount.

      w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                       decimal_places =  w_l_output_len  ).




      REPLACE '&30' IN w_l_addenda WITH w_l_amount_str.

 "     REPLACE ALL OCCURRENCES OF '&' IN w_l_addenda WITH 'E_'.
      w_items = w_items + 1.

    ENDLOOP.

    w_l_addenda_ext = 'UNS+S''CNT+2:&31''MOA+9:&32''MOA+79:&33''MOA+125:&34''TAX+7+VAT+++:::&35+B''MOA+124:&36''UNT+30+140957''UNZ+1+&37'''.



    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    REPLACE '&31' IN w_l_addenda WITH w_items.


    w_l_amount = is_l_billingdocument-tottax + is_l_billingdocument-totnet.

    w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                       decimal_places =  w_l_output_len  ).


    REPLACE '&32' IN w_l_addenda WITH w_l_amount_str.

    w_l_amount =  is_l_billingdocument-totnet.

    w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                       decimal_places =  w_l_output_len  ).



    REPLACE '&33' IN w_l_addenda WITH w_l_amount_str.
    REPLACE '&34' IN w_l_addenda WITH w_l_amount_str.

    READ TABLE is_l_conditionprices
         ASSIGNING <fs_conditions>
         WITH KEY  item = <fs_billingitem>-item
                   condtype = 'TMX1'.

    IF sy-subrc EQ 0.

      w_l_amount = <fs_conditions>-ratevalue.

      w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                                                              decimal_places =  w_l_output_len  ).

      REPLACE '&35' IN w_l_addenda WITH w_l_amount_str.

    ENDIF.
    w_l_amount = is_l_billingdocument-tottax.

    w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                       decimal_places =  w_l_output_len  ).



    REPLACE '&36' IN w_l_addenda WITH w_l_amount_str.

    REPLACE '&37' IN w_l_addenda WITH w_l_folionr1.


    w_l_addenda_ext = '</Documento> </cfdi:Addenda>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.



    REPLACE  ALL OCCURRENCES OF '&' IN w_l_addenda WITH 'E_'.


    addenda = encode_base64( im_addenda = w_l_addenda ).


  ENDMETHOD.

  METHOD addenda_amazon.

    TYPES: BEGIN OF ty_s_billingdocument,
             billingdoc TYPE  i_billingdocumentbasic-billingdocument,
             tipodoc    TYPE   i_billingdocumentbasic-yy1_tipodocumentostell_bdh,
             docdate    TYPE   i_billingdocumentbasic-billingdocumentdate,
             totnet     TYPE   i_billingdocumentbasic-totalnetamount,
             tottax     TYPE   i_billingdocumentbasic-totaltaxamount,
             planta     TYPE   i_billingdocumentbasic-yy1_planta_bdh,
             company    TYPE   i_billingdocumentbasic-companycode,
             pterms     TYPE   i_billingdocumentbasic-customerpaymentterms.
    TYPES: END OF ty_s_billingdocument,
    ty_t_billingdoc TYPE STANDARD TABLE OF ty_s_billingdocument.


    DATA: w_l_purchaseorder    TYPE string,
          w_l_addenda          TYPE string,
          w_l_addenda_ext      TYPE string,
          w_l_currency         TYPE string,
          w_l_bpidentification TYPE string,
          is_l_billingdocument TYPE ty_s_billingdocument,
          validaddenda         TYPE abap_boolean.


    validaddenda = check_addendatype( customernum = customernum  addendatype = 'AMAZON' salesdocumentnum = salesdocumentnum ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.

    w_l_addenda = '<SapAddenda> xsi:noNamespace SchemaLocation="schema.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"'.

    w_l_addenda_ext = 'CondicionesDePago="PO:&1 &2 Días" ></SapAddenda>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    w_l_purchaseorder = zedoc_mx_addendas_get_data=>get_purchaseorder( salesdocumentnum = salesdocumentnum ).

    REPLACE '&1' IN w_l_addenda WITH w_l_purchaseorder.

    SELECT SINGLE
            billingdocument,
            yy1_tipodocumentostell_bdh,
            billingdocumentdate,
            totalnetamount,
            totaltaxamount,
            yy1_planta_bdh,
            companycode,
            customerpaymentterms
       FROM i_billingdocumentbasic  WITH PRIVILEGED ACCESS
       WHERE billingdocument = @salesdocumentnum
       INTO  @is_l_billingdocument.
    IF sy-subrc IS INITIAL.
      REPLACE '&2' IN w_l_addenda WITH is_l_billingdocument-pterms+2(2).
    ENDIF.



    REPLACE ALL OCCURRENCES OF '&' IN w_l_addenda WITH 'E_'.


    addenda = encode_base64( im_addenda = w_l_addenda ).


  ENDMETHOD.

  METHOD addenda_isseg.


    DATA: w_l_purchaseorder    TYPE string,
          w_l_addenda          TYPE string,
          w_l_addenda_ext      TYPE string,
          w_l_currency         TYPE string,
          w_l_bpidentification TYPE string,
          validaddenda         TYPE abap_boolean.


    validaddenda = check_addendatype( customernum = customernum  addendatype = 'ISSEG' salesdocumentnum = salesdocumentnum ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.


    w_l_addenda_ext = '<InfoAdicional OrdenCompra="&1"/> '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.



    w_l_purchaseorder = zedoc_mx_addendas_get_data=>get_purchaseorder( salesdocumentnum = salesdocumentnum ).

    REPLACE '&1' IN w_l_addenda WITH w_l_purchaseorder.



    REPLACE ALL OCCURRENCES OF '&' IN w_l_addenda WITH 'E_'.
    addenda = encode_base64( im_addenda = w_l_addenda ).


  ENDMETHOD.

  METHOD addenda_promeco.
    TYPES: BEGIN OF ty_s_billingidocitem,
             item      TYPE   i_billingdocumentitem-billingdocumentitem,
             itemtext  TYPE   i_billingdocumentitem-billingdocumentitemtext,
             itemqty   TYPE   i_billingdocumentitem-billingquantity,
             unitprice TYPE   i_billingdocumentitem-creditrelatedprice,
             netamount TYPE   i_billingdocumentitem-netamount,
             product   TYPE   i_billingdocumentitem-product,
             taxamount TYPE   i_billingdocumentitem-taxamount,
             ean11     TYPE   i_billingdocumentitem-internationalarticlenumber,
             linenum   TYPE i_billingdocumentitem-yy1_linenum_bdi.
    TYPES: END OF ty_s_billingidocitem,
    ty_t_billingidoc TYPE STANDARD TABLE OF ty_s_billingidocitem.

    TYPES: BEGIN OF ty_s_billingdocument,
             billingdoc TYPE  i_billingdocumentbasic-billingdocument,
             tipodoc    TYPE   i_billingdocumentbasic-yy1_tipodocumentostell_bdh,
             docdate    TYPE   i_billingdocumentbasic-billingdocumentdate,
             totnet     TYPE   i_billingdocumentbasic-totalnetamount,
             tottax     TYPE   i_billingdocumentbasic-totaltaxamount,
             planta     TYPE   i_billingdocumentbasic-yy1_planta_bdh,
             pterms     TYPE   i_billingdocumentbasic-customerpaymentterms.
    TYPES: END OF ty_s_billingdocument,
    ty_t_billingdoc TYPE STANDARD TABLE OF ty_s_billingdocument.


    DATA: w_l_purchaseorder    TYPE string,
          w_l_addenda          TYPE string,
          w_l_addenda_ext      TYPE string,
          w_l_currency         TYPE string,
          w_l_bpidentification TYPE string,
          validaddenda         TYPE abap_boolean,
          w_l_output_len       TYPE int4,
          w_l_amount_str       TYPE string,
          w_l_amount           TYPE i_billingdocumentitem-netamount,
          is_l_billingitem     TYPE ty_t_billingidoc,
          is_l_billingdocument TYPE ty_s_billingdocument.

    FIELD-SYMBOLS: <fs_billingitem>  TYPE ty_s_billingidocitem.


    validaddenda = check_addendatype( customernum = customernum  addendatype = 'PROMECO' salesdocumentnum = salesdocumentnum ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.


    w_l_addenda_ext = '<Ariba><Encabezado><Referencia><NoRef>2</NoRef><TipoRef>Orden</TipoRef><ValorRef>&2</ValorRef></Referencia></Encabezado><Detalle>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.


    w_l_purchaseorder = zedoc_mx_addendas_get_data=>get_purchaseorder( salesdocumentnum = salesdocumentnum ).

    REPLACE '&2' IN w_l_addenda WITH w_l_purchaseorder.

    SELECT billingdocumentitem,
                billingdocumentitemtext,
                billingquantity,
                creditrelatedprice,
                netamount,
                product,
                taxamount,
                yy1_linenum_bdi
           FROM i_billingdocumentitem  WITH PRIVILEGED ACCESS
           WHERE billingdocument = @salesdocumentnum
           INTO TABLE @is_l_billingitem.


    w_l_output_len = 2.
    DATA: w_items TYPE n.

    CLEAR w_items.

    LOOP AT is_l_billingitem
      ASSIGNING <fs_billingitem>.

      w_items = w_items + 1.

      "loop at. "ORDER
      w_l_addenda_ext = '<Referencia><NoLinea>&3</NoLinea><TipoRef>Orden</TipoRef><ValorRef>&4</ValorRef></Referencia>'.

      CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

      REPLACE '&3' IN w_l_addenda WITH w_items.

      REPLACE '&4' IN w_l_addenda WITH <fs_billingitem>-linenum.

    ENDLOOP.

    w_l_addenda_ext = '</Detalle></Ariba>'.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    REPLACE ALL OCCURRENCES OF '&' IN w_l_addenda WITH 'E_'.
    repLACE ALL OCCURRENCES OF '#' IN w_l_addenda WITH 'N_'.

    addenda = encode_base64( im_addenda = w_l_addenda ).


  ENDMETHOD.

  METHOD addenda_nadro.
    TYPES: BEGIN OF ty_s_billingidocitem,
             item      TYPE   i_billingdocumentitem-billingdocumentitem,
             itemtext  TYPE   i_billingdocumentitem-billingdocumentitemtext,
             itemqty   TYPE   i_billingdocumentitem-billingquantity,
             unitprice TYPE   i_billingdocumentitem-creditrelatedprice,
             netamount TYPE   i_billingdocumentitem-netamount,
             product   TYPE   i_billingdocumentitem-product,
             taxamount TYPE   i_billingdocumentitem-taxamount,
             ean11     TYPE   i_billingdocumentitem-internationalarticlenumber,
             linenum   TYPE i_billingdocumentitem-yy1_linenum_bdi.
    TYPES: END OF ty_s_billingidocitem,
    ty_t_billingidoc TYPE STANDARD TABLE OF ty_s_billingidocitem.

    TYPES: BEGIN OF ty_s_billingdocument,
             billingdoc TYPE  i_billingdocumentbasic-billingdocument,
             tipodoc    TYPE   i_billingdocumentbasic-yy1_tipodocumentostell_bdh,
             docdate    TYPE   i_billingdocumentbasic-billingdocumentdate,
             totnet     TYPE   i_billingdocumentbasic-totalnetamount,
             tottax     TYPE   i_billingdocumentbasic-totaltaxamount,
             planta     TYPE   i_billingdocumentbasic-yy1_planta_bdh,
             pterms     TYPE   i_billingdocumentbasic-customerpaymentterms.
    TYPES: END OF ty_s_billingdocument,
    ty_t_billingdoc TYPE STANDARD TABLE OF ty_s_billingdocument.


    DATA: w_l_purchaseorder    TYPE string,
          w_l_addenda          TYPE string,
          w_l_addenda_ext      TYPE string,
          w_l_currency         TYPE string,
          w_l_bpidentification TYPE string,
          validaddenda         TYPE abap_boolean,
          w_l_output_len       TYPE int4,
                  w_l_amount_str           TYPE string,
          w_l_amount           TYPE i_billingdocumentitem-netamount,
          is_l_billingitem     TYPE ty_t_billingidoc,
          is_l_billingdocument TYPE ty_s_billingdocument.

 FIELD-SYMBOLS: <fs_billingitem>  TYPE ty_s_billingidocitem.

    validaddenda = check_addendatype( customernum = customernum  addendatype = 'NADRO' salesdocumentnum = salesdocumentnum ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.


    w_l_addenda_ext = '<DatosNadro><Orden>&1</Orden><Plazo>&2</Plazo><EntregaEntrante>0</EntregaEntrante> '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.




    w_l_purchaseorder = zedoc_mx_addendas_get_data=>get_purchaseorder( salesdocumentnum = salesdocumentnum ).

    REPLACE '&1' IN w_l_addenda WITH w_l_purchaseorder.

SELECT SINGLE
           billingdocument,
           yy1_tipodocumentostell_bdh,
           billingdocumentdate,
           totalnetamount,
           totaltaxamount,
           yy1_planta_bdh,
           customerpaymentterms
      FROM i_billingdocumentbasic  WITH PRIVILEGED ACCESS
      WHERE billingdocument = @salesdocumentnum
      INTO  @is_l_billingdocument.



    REPLACE '&2' IN w_l_addenda WITH is_l_billingDOCUMENT-PTERMS+2(2).

  SELECT billingdocumentitem,
            billingdocumentitemtext,
            billingquantity,
            creditrelatedprice,
            netamount,
            product,
            taxamount,
            yy1_linenum_bdi
       FROM i_billingdocumentitem  WITH PRIVILEGED ACCESS
       WHERE billingdocument = @salesdocumentnum
       INTO TABLE @is_l_billingitem.


    w_l_output_len = 2.
    DATA: w_items TYPE n.

    CLEAR w_items.

    LOOP AT is_l_billingitem
      ASSIGNING <fs_billingitem>.

      W_ITEMS = W_ITEMS + 1.

      w_l_addenda_ext = '<PosicionOC>&3</PosicionOC><TotalOC>&4</TotalOC><CodEAN>&5</CodEAN> '.

      CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

     REPLACE '&3' IN w_l_addenda WITH W_ITEMS.

      IF  <fs_billingitem>-ean11 IS INITIAL.

        SELECT SINGLE i_product~productstandardid
        FROM i_product
        WITH PRIVILEGED ACCESS
        WHERE product = @<fs_billingitem>-product
        INTO @<fs_billingitem>-ean11.


      ENDIF.




      w_l_amount = <fs_billingitem>-netamount + <fs_billingitem>-TAXamount.

      w_l_amount_str = zedoc_mx_addendas_get_data=>output_amount_decimalplaces( amt_value = w_l_amount
                                         decimal_places =  w_l_output_len  ).

      REPLACE '&4' IN w_l_addenda WITH w_l_amount_str.

      REPLACE '&5' IN w_l_addenda WITH <fs_billingitem>-ean11.

    ENDLOOP.

    w_l_addenda_ext = '</DatosNadro> '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.

    REPLACE  ALL OCCURRENCES OF '&' IN w_l_addenda WITH 'E_'.
    addenda = encode_base64( im_addenda = w_l_addenda ).


  ENDMETHOD.

  METHOD addenda_astrazeneca.


    DATA: w_l_purchaseorder    TYPE string,
          w_l_addenda          TYPE string,
          w_l_addenda_ext      TYPE string,
          w_l_currency         TYPE string,
          w_l_bpidentification TYPE string,
          validaddenda         TYPE abap_boolean.


    validaddenda = check_addendatype( customernum = customernum  addendatype = 'ASTRAZENECA' salesdocumentnum = salesdocumentnum ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.


    w_l_addenda_ext = ' '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.



    "    REPLACE '&4' IN w_l_addenda WITH w_l_bpidentification.
    REPLACE ALL OCCURRENCES OF '&' IN w_l_addenda WITH 'E_'.
    addenda = encode_base64( im_addenda = w_l_addenda ).


  ENDMETHOD.


  METHOD addenda_glaxo.


    DATA: w_l_purchaseorder    TYPE string,
          w_l_addenda          TYPE string,
          w_l_addenda_ext      TYPE string,
          w_l_currency         TYPE string,
          w_l_bpidentification TYPE string,
          validaddenda         TYPE abap_boolean.


    validaddenda = check_addendatype( customernum = customernum  addendatype = 'GLAXO' salesdocumentnum = salesdocumentnum ).

    CHECK  validaddenda EQ abap_true.

    CLEAR w_l_addenda.


    w_l_addenda_ext = ' '.

    CONCATENATE  w_l_addenda  w_l_addenda_ext INTO w_l_addenda.



    "    REPLACE '&4' IN w_l_addenda WITH w_l_bpidentification.
    REPLACE ALL OCCURRENCES OF '&' IN w_l_addenda WITH 'E_'.
    addenda = encode_base64( im_addenda = w_l_addenda ).


  ENDMETHOD.

  METHOD check_addendaon.


    addendaon = abap_false.

    CHECK  salesdocumentnum IS NOT INITIAL.

    addendaon = abap_true.



  ENDMETHOD.


  METHOD check_addendatype.

    TYPES: BEGIN OF ty_s_range_kunnr,
             sing   TYPE zrange_sing,
             option TYPE zrange_option,
             low    TYPE kunnr,
             high   TYPE kunnr.
    TYPES: END OF ty_s_range_kunnr.

    DATA:
      lt_business_data  TYPE TABLE OF y_service_consu_addendabycusto=>tys_yy_1_addendabycustomerboty,
      lo_http_client    TYPE REF TO if_web_http_client,
      lo_client_proxy   TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request        TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_response       TYPE REF TO /iwbep/if_cp_response_read_lst,
      w_l_range_kunnr   TYPE ty_s_range_kunnr,
      lt_range_kunnr    TYPE RANGE OF kunnr,
      lo_filter_factory TYPE REF TO /iwbep/if_cp_filter_factory,
      lo_filter_node_1  TYPE REF TO /iwbep/if_cp_filter_node.

    FIELD-SYMBOLS:<fs_addenda>   TYPE  y_service_consu_addendabycusto=>tys_yy_1_addendabycustomerboty.

    validaddenda = abap_false.

    TRY.

        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
        comm_scenario  = 'YY1_Z_OUT_OD_ADDENDA'
        comm_system_id = 'CS_OUT_EDOCUMENTS' ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).


        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
        EXPORTING
        is_proxy_model_key = VALUE #( repository_id = 'DEFAULT'
        proxy_model_id = 'Y_SERVICE_CONSU_ADDENDABYCUSTO'
        proxy_model_version = '0001' )
        io_http_client = lo_http_client
        iv_relative_service_root = '' ).




        ASSERT lo_http_client IS BOUND.

        CLEAR lt_range_kunnr.

        w_l_range_kunnr-sing = 'I'.
        w_l_range_kunnr-option = 'EQ'.
        w_l_range_kunnr-low = customernum.

        SHIFT w_l_range_kunnr-low LEFT DELETING LEADING '0'.

        APPEND w_l_range_kunnr TO lt_range_kunnr.

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'YY_1_ADDENDABYCUSTOMERBO' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).
        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'CUSTOMER'
                                                                it_range             = lt_range_kunnr ).

        lo_request->set_filter( lo_filter_node_1 ).

        lo_request->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).


      CATCH cx_http_dest_provider_error INTO DATA(lx_destination). "#EC NO_HANDLER
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).   "#EC NO_HANDLER
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).    "#EC NO_HANDLER
        " Handle Exception

      CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error). "#EC NO_HANDLER
        " Handle Exception
        RAISE SHORTDUMP lx_web_http_client_error.   "#EC NO_HANDLER


    ENDTRY.

    READ TABLE lt_business_data
      ASSIGNING  <fs_addenda>
      INDEX 1.

    CHECK sy-subrc EQ 0.

    CHECK <fs_addenda>-addenda_type CS addendatype.

    validaddenda = abap_true.


  ENDMETHOD.


  METHOD encode_base64.

    CALL METHOD cl_web_http_utility=>encode_base64
      EXPORTING
        unencoded = im_addenda
      RECEIVING
        encoded   = rt_addenda.

    IF im_init_tag IS INITIAL.

      CONCATENATE  '<content>' rt_addenda  INTO rt_addenda.

    ELSE.

      CONCATENATE  im_init_tag rt_addenda  INTO rt_addenda.


    ENDIF.

    IF im_end_tag IS INITIAL.

      CONCATENATE  rt_addenda '</content>'   INTO rt_addenda.

    ELSE.

      CONCATENATE  rt_addenda im_end_tag INTO rt_addenda.


    ENDIF.



  ENDMETHOD.


  METHOD get_cfdi_relacionados.

    TYPES: BEGIN OF y_s_salesdocument,
             salesdocument TYPE i_billingdocumentitembasic-salesdocument,
           END OF y_s_salesdocument,
           y_t_salesdocument TYPE STANDARD TABLE OF y_s_salesdocument,


           BEGIN OF y_s_subsequentdocument,
             subsequentdocument TYPE i_salesorderitmsubsqntprocflow-subsequentdocument,
           END OF y_s_subsequentdocument,
           y_t_subsequentdocument TYPE STANDARD TABLE OF y_s_subsequentdocument,

           BEGIN OF y_s_billingdocument,
             billingdocument TYPE i_billingdocumentbasic-billingdocument,
           END OF y_s_billingdocument,
           y_t_billingdocument TYPE STANDARD TABLE OF y_s_billingdocument,

           BEGIN OF y_s_journalentry,
             companycode  TYPE i_billingdocumentbasic-companycode,
             journalentry TYPE i_billingdocumentbasic-accountingdocument,
           END OF y_s_journalentry,
           y_t_journalentry TYPE STANDARD TABLE OF y_s_journalentry,

           BEGIN OF y_s_uuid,
             uuidrelation TYPE i_journalentry-jrnlentrycntryspecificref1,
           END OF y_s_uuid,
           y_t_uuid TYPE STANDARD TABLE OF y_s_uuid.


    DATA: is_l_salesorder          TYPE y_t_salesdocument,
          is_l_request_downpayment TYPE y_t_subsequentdocument,
          is_l_downpayments        TYPE y_t_journalentry,
          is_l_uuid                TYPE y_t_uuid,
          w_l_cfdi_relacionado     TYPE if_badi_interface_cust_data_v4=>ty_related_doc_data,
          w_l_uuid_relacionado     TYPE if_badi_interface_cust_data_v4=>ty_uuid.

    FIELD-SYMBOLS: <fs_downpayemnt> TYPE y_s_journalentry,
                   <fs_uuid>        TYPE y_s_uuid.

    "0 chck logic is only valid for Invoice Type F2.

    SELECT
     billingdocument
     FROM i_billingdocumentbasic WITH PRIVILEGED ACCESS
   WHERE billingdocument = @salesdocumentnum
     AND billingdocumenttype = 'F2'

   INTO TABLE  @is_l_downpayments  .

    CHECK sy-subrc EQ 0.

    CLEAR is_l_downpayments.

    "1. Read Invoice item -> retrive Sales  order
    SELECT
      i_billingdocumentitembasic~salesdocument
    FROM
      i_billingdocumentitembasic  WITH PRIVILEGED ACCESS
   WHERE billingdocument = @salesdocumentnum
    INTO TABLE @is_l_salesorder.

    CHECK sy-subrc EQ 0.

    SORT is_l_salesorder.

    DELETE ADJACENT DUPLICATES FROM is_l_salesorder.

    CHECK lines( is_l_salesorder ) GT 0.

    " Retrive Request For Downpayment

    SELECT
      i_salesorderitmsubsqntprocflow~subsequentdocument
    FROM
      i_salesorderitmsubsqntprocflow WITH PRIVILEGED ACCESS
    FOR ALL ENTRIES IN @is_l_salesorder
    WHERE salesorder = @is_l_salesorder-salesdocument
      AND subsequentdocument <> @salesdocumentnum
    INTO  TABLE @is_l_request_downpayment.

    CHECK sy-subrc EQ 0.

    SORT is_l_request_downpayment.

    DELETE ADJACENT DUPLICATES FROM is_l_request_downpayment.

    CHECK lines( is_l_request_downpayment ) GT 0.

    SELECT
      companycode,
      accountingdocument
      FROM i_billingdocumentbasic WITH PRIVILEGED ACCESS
    FOR ALL ENTRIES IN @is_l_request_downpayment
    WHERE billingdocument = @is_l_request_downpayment-subsequentdocument
      AND billingdocumenttype = 'FAZ'
     INTO TABLE @is_l_downpayments.

    CHECK sy-subrc EQ 0.

    SORT is_l_downpayments.

    DELETE ADJACENT DUPLICATES FROM is_l_downpayments.

    CHECK lines( is_l_downpayments ) GT 0.

    SELECT
      jrnlentrycntryspecificref1
      FROM i_journalentry WITH PRIVILEGED ACCESS
    FOR ALL ENTRIES IN @is_l_downpayments
    WHERE companycode = @is_l_downpayments-companycode
      AND accountingdocument = @is_l_downpayments-journalentry
    INTO TABLE @is_l_uuid.

    CHECK sy-subrc EQ 0.

    SORT is_l_uuid.

    CHECK lines( is_l_downpayments ) GT 0.


    CLEAR w_l_cfdi_relacionado.

    w_l_cfdi_relacionado-related_doc_type = '07'.

    LOOP AT is_l_uuid
      ASSIGNING <fs_uuid>.

      w_l_uuid_relacionado-uuid =  <fs_uuid>-uuidrelation.

      APPEND w_l_uuid_relacionado TO  w_l_cfdi_relacionado-related_doc_uuid.

    ENDLOOP.

    APPEND w_l_cfdi_relacionado TO cfdi_relacionados.

  ENDMETHOD.


  METHOD if_badi_interface_cust_data_v4~fill_custom_data_v4.
    "---------------------------------------------------------------------"
    " This method can be implement to change the following data           "
    " USO_CFDI, ADDENDA, CFDI_RELACIONADOS, EXPORTACION                   "
    "                         Importing Parameters                        "
    " IS_MAPPING_SOURCE:{ SALESDOCINFO{SALESDOCUMENTNUM,CUSTOMERNUM,      "
    " DELIVERYDOCUMENTNUM}ACCOUNTINGDOCINFO{ACCOUNTINGDCOUMENTNUM,        "
    " FISCALYEAR}, COMPANYCODE,                                          "
    "                        Changing Paramters                           "
    " CS_CUSTOM_DATA: USE_OF_CFDI, ADDENDA                                "
    " CT_RELATED_DOC_DATA: Table {RELATED_DOC_UUID(Table contains UUIDs), "
    "  RELATED_DOC_TYPE }                                                 "
    " CV_EXPORTACION                                                      "
    "---------------------------------------------------------------------"

    CHECK ( check_addendaon( salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
                             deliverydocumentnum = is_mapping_source-salesdocinfo-deliverydocumentnum ) ) .

*Global
    CALL METHOD addenda_global
      EXPORTING
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.

*chopo

    CALL METHOD addenda_chopo
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.


*Read CFDI_relacionados
    CALL METHOD get_cfdi_relacionados
      EXPORTING
        salesdocumentnum  = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        cfdi_relacionados = ct_related_doc_data.

*Fist Addenda RobertBosh
    CALL METHOD addenda_robertbosh
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.

*2nd DHl
    CALL METHOD addenda_dhl
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.
*3er Firmex
    CALL METHOD addenda_firmex
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.

*4to Grupo Inditex
    CALL METHOD addenda_inditex
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.

* 5to Addenda Waldos
    CALL METHOD addenda_waldos
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.

* 6to Helizondo
    CALL METHOD addenda_harinaselizondo
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.
* 7tho SanMina
    CALL METHOD addenda_sanmina
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.

* 8to Colgate
    CALL METHOD addenda_colgate
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.

* 9th GM
    CALL METHOD addenda_gm
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.

*10th Pepsico

    CALL METHOD addenda_pepsico
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.


*11th PFizer

    CALL METHOD addenda_pfizer
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.

*12th Stelanties

    CALL METHOD addenda_stellanties
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.

*13th BMW

    CALL METHOD addenda_bmw
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.


    CALL METHOD addenda_continental
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.

    CALL METHOD addenda_walmart
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.

    CALL METHOD addenda_isseg
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.


    CALL METHOD addenda_promeco
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.


    CALL METHOD addenda_nadro
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.



    CALL METHOD addenda_amazon
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.



    CALL METHOD addenda_astrazeneca
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.


    CALL METHOD addenda_glaxo
      EXPORTING
        customernum      = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        addenda          = cs_custom_data-addenda
        use_of_cfdi      = cs_custom_data-use_of_cfdi.

*14Th Addenda Tmp Addenda Domicilio Receptor

    CALL METHOD addenda_domicilio_receptor
      EXPORTING
        customernum           = is_mapping_source-salesdocinfo-customernum
        salesdocumentnum      = is_mapping_source-salesdocinfo-salesdocumentnum
        deliverydocumentnum   = is_mapping_source-salesdocinfo-deliverydocumentnum
        accountingdocumentnum = is_mapping_source-accountingdocinfo-accountingdcoumentnum
        fiscalyear            = is_mapping_source-accountingdocinfo-fiscalyear
        companycode           = is_mapping_source-companycode
      CHANGING
        addenda               = cs_custom_data-addenda
        use_of_cfdi           = cs_custom_data-use_of_cfdi.

    CALL METHOD tipo_relacion
      EXPORTING
        accountingdocument = is_mapping_source-accountingdocinfo-accountingdcoumentnum
        fiscalyear         = is_mapping_source-accountingdocinfo-fiscalyear
        salesdocument      = is_mapping_source-salesdocinfo-salesdocumentnum
      CHANGING
        related            = ct_related_doc_data.

  ENDMETHOD.


  METHOD
         tipo_relacion.
    DATA:
      ls_related_doc TYPE if_badi_interface_cust_data_v4=>ty_related_doc_data,
      lt_related_doc TYPE if_badi_interface_cust_data_v4=>tt_related_doc_data,
      w_l_c36        TYPE if_badi_interface_cust_data_v4=>ty_uuid,
      w_l_uuid       TYPE string.

    FIELD-SYMBOLS <fs_uuid> TYPE if_badi_interface_cust_data_v4=>ty_uuid.


    DATA: wdoctype TYPE i_accountingdocumentjournal-accountingdocumenttype.
    DATA: w_accdoc TYPE i_billingdocumentbasic-accountingdocument,
          w_fy     TYPE i_billingdocumentbasic-fiscalyear,
          w_com    TYPE i_billingdocumentbasic-companycode.

    DATA: w_accdoc2 TYPE i_billingdocumentbasic-accountingdocument,
          w_fy2     TYPE i_billingdocumentbasic-fiscalyear,
          w_com2    TYPE i_billingdocumentbasic-companycode.

    IF salesdocument IS NOT INITIAL
    AND accountingdocument IS INITIAL.

      ls_related_doc-related_doc_type = '03'.

      CLEAR: w_accdoc2,w_fy2,w_com2.

      SELECT SINGLE  i_billingdocumentbasic~accountingdocument,
             i_billingdocumentbasic~fiscalyear,
             i_billingdocumentbasic~companycode
              FROM  i_billingdocumentbasic
              WITH PRIVILEGED ACCESS
               WHERE billingdocument = @salesdocument
                 AND ( billingdocumenttype = 'G2'
                  OR billingdocumenttype = 'IG'
                  OR billingdocumenttype = 'LG'
                  OR billingdocumenttype = 'CBRE' )


              INTO (@w_accdoc2,@w_fy2,@w_com2 ).

      IF sy-subrc IS INITIAL.


      ENDIF.


    ENDIF.

    IF w_accdoc2 IS INITIAL.

      w_accdoc2 = accountingdocument.
      w_fy2 = fiscalyear.

    ENDIF.

    IF w_accdoc2 IS NOT INITIAL.

      SELECT SINGLE i_accountingdocumentjournal~accountingdocumenttype
       FROM i_accountingdocumentjournal
       WITH PRIVILEGED ACCESS
       WHERE accountingdocument = @w_accdoc2
        AND fiscalyear = @w_fy2
        AND (   accountingdocumenttype = 'DG'
          OR    accountingdocumenttype = 'RV' )
        INTO @wdoctype.

      CHECK sy-subrc IS INITIAL.

      CLEAR w_l_uuid.
      CLEAR w_l_c36.
      "prueba de UUID ERNESTO
*    w_l_uuid = zedoc_mx_addendas_get_data=>get_custinv_uuid( salesdocumentnum = 'HI00000059' ).
*    w_l_c36 = w_l_uuid.
      DATA: w_salesdocument TYPE i_journalentryitem-salesdocument.
      CLEAR w_salesdocument.

      TYPES: BEGIN OF y_s_salesdocument,
               salesdocument TYPE i_journalentryitem-salesdocument,
             END OF y_s_salesdocument,
             y_t_salesdocument TYPE STANDARD TABLE OF y_s_salesdocument.
      DATA ls_salesdocument TYPE y_t_salesdocument.

      FIELD-SYMBOLS: <fs_salesdocument> TYPE y_s_salesdocument.

      SELECT  i_journalentryitem~salesdocument
            FROM i_journalentryitem
            WITH PRIVILEGED ACCESS
             WHERE accountingdocument = @w_accdoc2
            AND fiscalyear = @w_fy2
            AND ledger = '0L'
            AND glaccounttype = 'P'
            INTO TABLE @ls_salesdocument.

      IF sy-subrc IS INITIAL
      AND ls_salesdocument[] IS NOT INITIAL.

        LOOP AT ls_salesdocument
        ASSIGNING <fs_salesdocument>.

          CLEAR w_salesdocument.
          CLEAR w_l_c36.

          w_salesdocument = <fs_salesdocument>-salesdocument.


          DATA: w_billingdocument TYPE i_billingdocumentitembasic-billingdocument.

          TYPES: BEGIN OF y_s_billdocument,
                   billingdocument TYPE i_billingdocumentitembasic-billingdocument,
                 END OF y_s_billdocument,
                 y_t_billdocument TYPE STANDARD TABLE OF y_s_billdocument.

          DATA: is_l_billdoc TYPE y_t_billdocument.

          SELECT  i_billingdocumentitembasic~billingdocument
          FROM i_billingdocumentitembasic
          WITH PRIVILEGED ACCESS
          WHERE salesdocument = @w_salesdocument

          INTO TABLE @is_l_billdoc.

          IF sy-subrc IS INITIAL.

            SELECT  i_billingdocumentbasic~billingdocument
            FROM i_billingdocumentbasic
            WITH PRIVILEGED ACCESS
            FOR ALL ENTRIES IN @is_l_billdoc       "#EC CI_NO_TRANSFORM
            WHERE billingdocument = @is_l_billdoc-billingdocument
              AND billingdocumentiscancelled NE 'X'
            INTO @w_billingdocument.
              EXIT.

            ENDSELECT.

          ENDIF.



          IF sy-subrc IS INITIAL.
            CLEAR: w_accdoc,w_fy,w_com.

            SELECT SINGLE  i_billingdocumentbasic~accountingdocument,
            i_billingdocumentbasic~fiscalyear,
            i_billingdocumentbasic~companycode
             FROM  i_billingdocumentbasic
             WITH PRIVILEGED ACCESS
              WHERE billingdocument = @w_billingdocument

             INTO (@w_accdoc,@w_fy,@w_com ).

            IF sy-subrc IS INITIAL.

              DATA: w_bill_uuid TYPE i_journalentry-jrnlentrycntryspecificref1.


              SELECT SINGLE  i_journalentry~jrnlentrycntryspecificref1
                FROM  i_journalentry
                WITH PRIVILEGED ACCESS
                WHERE accountingdocument = @w_accdoc
                  AND fiscalyear = @w_fy
                  AND companycode = @w_com
                  INTO @w_bill_uuid.

              IF sy-subrc IS INITIAL.

*           w_l_c36 = w_bill_uuid+0(36) .
                w_l_c36-uuid = w_bill_uuid+0(36).

              ENDIF.


            ENDIF.

          ENDIF.


          CHECK w_l_c36 IS NOT INITIAL.

          APPEND  w_l_c36+0(36) TO ls_related_doc-related_doc_uuid .

          IF  ls_related_doc-related_doc_type IS INITIAL.

            ls_related_doc-related_doc_type = '01'.

          ENDIF.

          SORT ls_related_doc-related_doc_uuid .

          DELETE ADJACENT DUPLICATES FROM ls_related_doc-related_doc_uuid .


        ENDLOOP.



        APPEND ls_related_doc TO lt_related_doc.


      ENDIF.


      related =  lt_related_doc.

    ENDIF.





  ENDMETHOD.
ENDCLASS.
