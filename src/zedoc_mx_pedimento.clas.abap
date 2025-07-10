CLASS zedoc_mx_pedimento DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_badi_interface_pediment.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZEDOC_MX_PEDIMENTO IMPLEMENTATION.


  METHOD if_badi_interface_pediment~fill_pediment.


    TYPES: BEGIN OF ty_s_billingidocumentitem,
             itembatch    TYPE   i_billingdocumentitem-batch,
             itemmaterial TYPE i_billingdocumentitem-product,
             itemplant    TYPE i_billingdocumentitem-plant.
    TYPES: END OF ty_s_billingidocumentitem,
    ty_t_billingidocumentitem TYPE STANDARD TABLE OF  ty_s_billingidocumentitem.


    CLEAR ct_pediment_data.

    DATA: is_l_pedimento      TYPE edoc_mx_badi_customsdata_tab,
          w_l_pedimento       TYPE edoc_mx_badi_customsdata_ouput,
          w_l_len             TYPE int4,
          is_l_billingdocitem TYPE ty_t_billingidocumentitem,
          is_l_batch_by_suppl TYPE STANDARD TABLE OF i_batch-batchbysupplier.

    FIELD-SYMBOLS: <fs_batch_by_suppl> TYPE  i_batch-batchbysupplier.



    SELECT batch,
           product,
           plant
      FROM i_billingdocumentitem  WITH PRIVILEGED ACCESS
     WHERE billingdocument = @is_source-salesdocumentnum
       AND salesdocumentitem = @is_source-salesdocitemnum
       INTO TABLE @is_l_billingdocitem.


    CHECK sy-subrc EQ 0.

    CHECK lines( is_l_billingdocitem ) GT 0.


    SELECT batchbysupplier  "#EC CI_NO_TRANSFORM
      FROM i_batch WITH PRIVILEGED ACCESS
      FOR ALL ENTRIES IN @is_l_billingdocitem
     WHERE plant = @is_l_billingdocitem-itemplant
       AND material = @is_l_billingdocitem-itemmaterial
       AND batch    = @is_l_billingdocitem-itembatch
      INTO TABLE @is_l_batch_by_suppl.

    CHECK sy-subrc EQ 0.

    LOOP AT is_l_batch_by_suppl
      ASSIGNING <fs_batch_by_suppl>.

      CONDENSE <fs_batch_by_suppl>.


      w_l_len = strlen( <fs_batch_by_suppl> ).

      IF ( w_l_len GT 2 ).

        w_l_pedimento-pediment_num = <fs_batch_by_suppl>+0(2).


      ENDIF.

      IF ( w_l_len GE 4 ).

        w_l_pedimento-pediment_num+4 =  <fs_batch_by_suppl>+2(2).


      ENDIF.

      IF ( w_l_len GE 8 ).

        w_l_pedimento-pediment_num+8 = <fs_batch_by_suppl>+4(4).


      ENDIF.

      IF ( w_l_len GE 15 ).

        w_l_pedimento-pediment_num+14 = <fs_batch_by_suppl>+8(7).

      ENDIF.




      APPEND w_l_pedimento TO is_l_pedimento.




    ENDLOOP.


    ct_pediment_data = is_l_pedimento.



  ENDMETHOD.
ENDCLASS.
