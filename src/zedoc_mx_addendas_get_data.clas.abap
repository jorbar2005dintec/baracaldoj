CLASS zedoc_mx_addendas_get_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF ty_s_unitofmeasurebyitem,
             billingitem   TYPE i_billingdocumentitem-billingdocumentitem,
             unitofmeasure TYPE i_unitofmeasuretext-unitofmeasurecommercialname.
    TYPES: END OF ty_s_unitofmeasurebyitem,
    ty_t_unitofmeasurebyitem TYPE STANDARD TABLE OF ty_s_unitofmeasurebyitem.

    TYPES: BEGIN OF ty_s_purchaseorderbyitem,
             salesorder     TYPE i_salesorderitem-salesorder,
             salesorderitem TYPE i_salesorderitem-salesorderitem,
             purchaseorder  TYPE i_salesorderitem-purchaseorderbycustomer.
    TYPES: END OF ty_s_purchaseorderbyitem,
    ty_t_purchaseorderbyitem TYPE STANDARD TABLE OF ty_s_purchaseorderbyitem.

    TYPES: BEGIN OF ty_s_customer_oc_data,
             salesdocument           TYPE i_salesdocumentitem-salesdocument,
             salesdocumentitem       TYPE i_salesdocumentitem-salesdocumentitem,
             purchaseorderbycustomer TYPE i_salesdocumentitem-purchaseorderbycustomer,
             materialbycustomer      TYPE i_salesdocumentitem-materialbycustomer.
    TYPES: END OF ty_s_customer_oc_data,
    ty_t_customer_oc_data TYPE STANDARD TABLE OF ty_s_customer_oc_data.

    TYPES: BEGIN OF ty_s_vbak,
             salesorder TYPE i_salesorderitem-salesorder,
             delivery   TYPE i_billingdocumentitem-referencesddocument.
    TYPES: END OF ty_s_vbak,
    ty_t_entregas TYPE STANDARD TABLE OF ty_s_vbak.

    CLASS-METHODS:

      get_currency  IMPORTING salesdocumentnum    TYPE vbeln_va
                    RETURNING VALUE(currencycode) TYPE string,

      get_purchaseorderbyitem  IMPORTING salesdocumentnum  TYPE vbeln_va
                               CHANGING  purchaseorderitem TYPE ty_t_purchaseorderbyitem,

      get_customer_oc_data IMPORTING salesdocument    TYPE vbeln_va
                           CHANGING  customer_oc_data TYPE ty_t_customer_oc_data
                                     entregas         TYPE ty_t_entregas,

      get_bp_parfunc_email IMPORTING customernum TYPE kunag
                                     sorg        TYPE vkorg
                                     dist        TYPE vtweg
                                     divi        TYPE spart
                           CHANGING  email1      TYPE string
                                     email2      TYPE string,

      get_bp_employee_so  IMPORTING salesdocumentnum   TYPE vbeln_va
                          RETURNING VALUE(employee_bo) TYPE string,

      get_purchaseorder   IMPORTING salesdocumentnum     TYPE vbeln_va
                          RETURNING VALUE(purchaseorder) TYPE string,

      get_folionr1        IMPORTING salesdocumentnum TYPE vbeln_va
                          RETURNING VALUE(folionr1)  TYPE string,

      get_uso_cfdi_from_billingdoc
        IMPORTING billingdocument TYPE vbeln_va
        RETURNING VALUE(usocfdi)  TYPE string,

      get_uso_cfdi_from_belnr
        IMPORTING accountingDocument        TYPE belnr_d
                  companyCode               TYPE bukrs
                  year                      TYPE gjahr
        RETURNING VALUE(cs_receptor_v7)     TYPE edo_mx_comprobante_receptor6,


      get_uso_cfdi_from_deliverydoc
        IMPORTING deliverydocument TYPE vbeln_vl
        RETURNING VALUE(usocfdi)   TYPE string,

      get_custinv_uuid    IMPORTING salesdocumentnum TYPE vbeln_va
                          RETURNING VALUE(uuid)      TYPE string,

      get_custinv_timbrado_date    IMPORTING salesdocumentnum TYPE vbeln_va
                          RETURNING VALUE(datetime)      TYPE string,

      get_uuid_edoc       IMPORTING uuid_file   TYPE sysuuid_x16
                          RETURNING VALUE(uuid) TYPE sysuuid_x16,

      get_remision        IMPORTING salesdocumentnum TYPE vbeln_va
                          RETURNING VALUE(remision)  TYPE string,


      get_unit_measure_by_item   IMPORTING salesdocumentnum     TYPE vbeln_va
                                           language             TYPE string
                                 EXPORTING unit_measure_by_item TYPE ty_t_unitofmeasurebyitem,


      get_bussinesspartneremail  IMPORTING customernum         TYPE kunag
                                 RETURNING VALUE(emailaddress) TYPE string,

      get_bpidentificationnumber IMPORTING customernum                 TYPE kunag
                                 RETURNING VALUE(identificationnumber) TYPE string,


      get_buspartnerindependentemail  IMPORTING customernum         TYPE kunag
                                      RETURNING VALUE(emailpartner) TYPE string,



      get_bp_address  IMPORTING customernum   TYPE kunag
                                salesdocumentnum     TYPE vbeln_va
                      CHANGING
                                emailaddress  TYPE string
                                emailnot      TYPE string
                                numprov       TYPE string

                                street        TYPE string
                                housenum1     TYPE string
                                housenum2     TYPE string

                                township      TYPE string
                                county        TYPE string
                                cityname      TYPE string
                                country       TYPE string
                                postalcode    TYPE string

                                city          TYPE string

                                st_street     TYPE string
                                st_housenum1  TYPE string
                                st_housenum2  TYPE string

                                st_township   TYPE string
                                st_county     TYPE string
                                st_cityname   TYPE string
                                st_country    TYPE string
                                st_postalcode TYPE string
                                st_city       TYPE string

                                phone1        TYPE string
                                phone2        TYPE string
                                text03        TYPE string
                      ,


      output_qty_decimalplaces   IMPORTING qty_value      TYPE  i_billingdocumentitem-billingquantity
                                           decimal_places TYPE  int4
                                 RETURNING VALUE(qty_str) TYPE  string,

      output_amount_decimalplaces IMPORTING amt_value      TYPE  i_billingdocumentitem-netamount
                                            decimal_places TYPE  int4
                                  RETURNING VALUE(amt_str) TYPE  string,


      complete_left_zeros         IMPORTING str_number        TYPE string
                                            offset            TYPE int4
                                  RETURNING VALUE(number_str) TYPE  string.






  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZEDOC_MX_ADDENDAS_GET_DATA IMPLEMENTATION.


  METHOD complete_left_zeros .

    DATA: w_l_len    TYPE i,
          w_l_offset TYPE i.

    number_str = str_number.

    number_str = condense( number_str ).

    w_l_len = strlen( str_number ).

    WHILE ( offset GT w_l_len ).

      CONCATENATE '0' number_str INTO number_str.

      w_l_len = strlen( number_str ).

    ENDWHILE.


  ENDMETHOD.


  METHOD get_bpidentificationnumber.

    SELECT SINGLE
           bpidentificationnumber AS bpidentificationnumber
      FROM i_bupaidentification WITH PRIVILEGED ACCESS
     WHERE businesspartner = @customernum
      INTO @identificationnumber.

    CHECK sy-subrc EQ 0.



  ENDMETHOD.


  METHOD get_bp_address.

    TYPES: BEGIN OF ty_s_range_bp,
             sing   TYPE zrange_sing,
             option TYPE zrange_option,
             low    TYPE string,
             high   TYPE string.
    TYPES: END OF ty_s_range_bp.

    TYPES: BEGIN OF ty_s_range_email,
             sing   TYPE zrange_sing,
             option TYPE zrange_option,
             low    TYPE zrange_email_low,
             high   TYPE zrange_email_low.
    TYPES: END OF ty_s_range_email,
    ty_t_range_email TYPE STANDARD TABLE OF ty_s_range_email.

    DATA:
      ls_entity_key             TYPE y_service_consuption_cus_mail=>tys_a_address_email_address_ty,
      ls_business_data          TYPE y_service_consuption_cus_mail=>tys_a_address_email_address_ty,
      lo_http_client            TYPE REF TO if_web_http_client,
      lo_resource               TYPE REF TO /iwbep/if_cp_resource_entity,
      lo_client_proxy           TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request                TYPE REF TO /iwbep/if_cp_request_read,
      lo_response               TYPE REF TO /iwbep/if_cp_response_read,

      lt_business_data_list     TYPE TABLE OF y_service_consuption_cus_mail=>tys_a_business_partner_addre_2,
      lt_customer_text          TYPE TABLE OF y_service_consuption_cus_mail=>tys_a_customer_text_type,
      lo_requestlist            TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_responselist           TYPE REF TO /iwbep/if_cp_response_read_lst,
      lo_filter_factory         TYPE REF TO /iwbep/if_cp_filter_factory,
      lo_filter_factoryemail    TYPE REF TO /iwbep/if_cp_filter_factory,
      lo_filter_node_1          TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_business_partner TYPE RANGE OF string,
      lt_range_bp_company       TYPE RANGE OF string,
      ls_range_bp               TYPE ty_s_range_bp.

    DATA:
      lt_business_dataemail   TYPE TABLE OF y_service_consuption_cus_mail=>tys_a_address_email_address_ty,
      lo_requestemail         TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_responseemail        TYPE REF TO /iwbep/if_cp_response_read_lst,
      lo_filter_node_2        TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_business_email TYPE RANGE OF zrange_email_low,

      ls_range_business_email TYPE ty_s_range_email.

    DATA:
      lt_business_data_usage   TYPE TABLE OF y_service_consuption_cus_mail=>tys_a_bu_pa_address_usage_type,
      lt_business_data_contact TYPE TABLE OF y_service_consuption_cus_mail=>tys_a_bpcontact_to_func_and__2,
      lt_business_data_phone   TYPE TABLE OF y_service_consuption_cus_mail=>tys_a_address_phone_number_typ,
      lt_business_data_id      TYPE TABLE OF y_service_consuption_cus_mail=>tys_a_bu_pa_identification_typ.


    FIELD-SYMBOLS:
                   <fs_data_list>       TYPE y_service_consuption_cus_mail=>tys_a_business_partner_addre_2,
                   <fs_data_list_usage> TYPE y_service_consuption_cus_mail=>tys_a_bu_pa_address_usage_type,
                   <fs_data_list_id>    TYPE y_service_consuption_cus_mail=>tys_a_bu_pa_identification_typ,
                   <fs_data_phone>      TYPE y_service_consuption_cus_mail=>tys_a_address_phone_number_typ,
                   <fs_customer_text>   TYPE y_service_consuption_cus_mail=>tys_a_customer_text_type,
                   <fs_data_listemail>  TYPE y_service_consuption_cus_mail=>tys_a_address_email_address_ty.



    TRY.



        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
        comm_scenario = 'Z_OUTB_OD_CSCEN_EMAILBYCUST'
        comm_system_id = 'Z_READ_EMAIL_BY_CUSTM_V2' ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).


        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
        EXPORTING
        is_proxy_model_key = VALUE #( repository_id = 'DEFAULT'
        proxy_model_id = 'Y_SERVICE_CONSUPTION_CUS_MAIL'
        proxy_model_version = '0001' )
        io_http_client = lo_http_client
        iv_relative_service_root = '' ).


        ASSERT lo_http_client IS BOUND.

        ls_range_bp-sing = 'I'.
        ls_range_bp-option = 'EQ'.
        ls_range_bp-low = customernum.

        APPEND ls_range_bp TO lt_range_business_partner.
        APPEND ls_range_bp TO lt_range_bp_company.
        "customer text
        lo_requestlist = lo_client_proxy->create_resource_for_entity_set( 'A_CUSTOMER_TEXT' )->create_request_for_read( ).
        " Create the filter tree
        lo_filter_factory = lo_requestlist->create_filter_factory( ).
        lo_filter_node_1 = lo_filter_factory->create_by_range( iv_property_path = 'CUSTOMER'
        it_range = lt_range_business_partner ).

        lo_requestlist->set_filter( lo_filter_node_1 ).
        lo_requestlist->set_top( 50 )->set_skip( 0 ).
        lo_responselist = lo_requestlist->execute( ).
        lo_responselist->get_business_data( IMPORTING et_business_data = lt_customer_text ).



        "address
        lo_requestlist = lo_client_proxy->create_resource_for_entity_set( 'A_BUSINESS_PARTNER_ADDRESS' )->create_request_for_read( ).
        " Create the filter tree
        lo_filter_factory = lo_requestlist->create_filter_factory( ).
        lo_filter_node_1 = lo_filter_factory->create_by_range( iv_property_path = 'BUSINESS_PARTNER'
        it_range = lt_range_business_partner ).

        lo_requestlist->set_filter( lo_filter_node_1 ).
        lo_requestlist->set_top( 50 )->set_skip( 0 ).
        lo_responselist = lo_requestlist->execute( ).
        lo_responselist->get_business_data( IMPORTING et_business_data = lt_business_data_list ).

        "Contact
        lo_requestlist = lo_client_proxy->create_resource_for_entity_set( 'A_BPCONTACT_TO_FUNC_AND_DE' )->create_request_for_read( ).
        lo_filter_factory = lo_requestlist->create_filter_factory( ).
        lo_filter_node_1 = lo_filter_factory->create_by_range( iv_property_path = 'BUSINESS_PARTNER_COMPANY'
        it_range = lt_range_bp_company ).
        lo_requestlist->set_filter( lo_filter_node_1 ).
        lo_requestlist->set_top( 50 )->set_skip( 0 ).
        lo_responselist = lo_requestlist->execute( ).
        lo_responselist->get_business_data( IMPORTING et_business_data = lt_business_data_contact ).
        "usage
        lo_requestlist = lo_client_proxy->create_resource_for_entity_set( 'A_BU_PA_ADDRESS_USAGE' )->create_request_for_read( ).




        lo_filter_factory = lo_requestlist->create_filter_factory( ).
        lo_filter_node_1 = lo_filter_factory->create_by_range( iv_property_path = 'BUSINESS_PARTNER'
        it_range = lt_range_business_partner ).

        lo_requestlist->set_filter( lo_filter_node_1 ).
        lo_requestlist->set_top( 50 )->set_skip( 0 ).
        lo_responselist = lo_requestlist->execute( ).
*        lo_responselist->get_business_data( IMPORTING et_business_data = lt_business_data_usage ).
        "id
        lo_requestlist = lo_client_proxy->create_resource_for_entity_set( 'A_BU_PA_IDENTIFICATION' )->create_request_for_read( ).

        lo_filter_factory = lo_requestlist->create_filter_factory( ).
        lo_filter_node_1 = lo_filter_factory->create_by_range( iv_property_path = 'BUSINESS_PARTNER'
        it_range = lt_range_business_partner ).

        lo_requestlist->set_filter( lo_filter_node_1 ).
        lo_requestlist->set_top( 50 )->set_skip( 0 ).
        lo_responselist = lo_requestlist->execute( ).
        lo_responselist->get_business_data( IMPORTING et_business_data = lt_business_data_id ).

        READ TABLE lt_business_data_id
        ASSIGNING <fs_data_list_id>
        INDEX 1.

        IF sy-subrc IS INITIAL.

          numprov = <fs_data_list_id>-bpidentification_number.

        ENDIF.

        SORT lt_customer_text BY long_text_id.

        READ TABLE lt_customer_text
        ASSIGNING <fs_customer_text>
        WITH KEY  long_text_id = 'TX03'.

        IF sy-subrc IS INITIAL.

          text03 = <fs_customer_text>-long_text.

        ENDIF.

        ls_range_business_email-sing = 'I'.
        ls_range_business_email-option = 'EQ'.

        DATA: WADDRESS_SH TYPE  I_SALESDOCUMENTPARTNER-ADDRESSID.

        clear waddress_sh.

        if salesdocumentnum is not INITIAL.
         SELECT SINGLE I_SALESDOCUMENTPARTNER~ADDRESSID
         FROM   I_SALESDOCUMENTPARTNER
         WITH PRIVILEGED ACCESS
         WHERE SALESDOCUMENT  = @SALESDOCumentnum
           AND PARTNERFUNCTION = 'WE'
           INTO @WADDRESS_SH .

          if sy-subrc is INITIAL.

            shift waddress_sh LEFT DELETING LEADING '0'.

          endif.

         endif.


        LOOP AT lt_business_data_list
        ASSIGNING <fs_data_list>.

          ls_range_business_email-low = <fs_data_list>-address_id.

          APPEND ls_range_business_email TO lt_range_business_email.

          LOOP AT lt_business_data_usage
       "   read table lt_business_data_usage
            ASSIGNING <fs_data_list_usage>
            WHERE address_id = <fs_data_list>-address_id.
            "  with key address_id = <fs_data_list>-address_id.

            CASE <fs_data_list_usage>-address_usage.
              WHEN 'XXDEFAULT'.


                cityname =  <fs_data_list>-region.
                country =  <fs_data_list>-country.
                housenum1 =  <fs_data_list>-house_number.
                housenum2 =  <fs_data_list>-house_number_supplement_te.
                street =  <fs_data_list>-street_name.
                township =  <fs_data_list>-city_name.

                county =  <fs_data_list>-district.
                postalcode =  <fs_data_list>-postal_code.
                city = <fs_data_list>-home_city_name.

              WHEN 'SHIP_TO'.

                CHECK <fs_data_list_usage>-standard_usage <> space.

                if waddress_sh is not initial.

                 check <fs_data_list>-address_id = waddress_sh.

                endif.



                st_cityname =  <fs_data_list>-region.
                st_country =  <fs_data_list>-country.
                st_housenum1 =  <fs_data_list>-house_number.
                st_housenum2 =  <fs_data_list>-house_number_supplement_te.
                st_street =  <fs_data_list>-street_name.
                st_township =  <fs_data_list>-city_name.

                st_county =  <fs_data_list>-district.
                st_postalcode =  <fs_data_list>-postal_code.
                st_city = <fs_data_list>-home_city_name.

            ENDCASE.

          ENDLOOP.

        ENDLOOP.




        "email
        lo_requestemail = lo_client_proxy->create_resource_for_entity_set( 'A_ADDRESS_EMAIL_ADDRESS' )->create_request_for_read( ).
        lo_filter_factoryemail = lo_requestemail->create_filter_factory( ).
        lo_filter_node_2 = lo_filter_factoryemail->create_by_range( iv_property_path = 'ADDRESS_ID'
        it_range = lt_range_business_email ).
        lo_requestemail->set_filter( lo_filter_node_2 ).
        lo_requestemail->set_top( 50 )->set_skip( 0 ).
        lo_responseemail = lo_requestemail->execute( ).
        lo_responseemail->get_business_data( IMPORTING et_business_data = lt_business_dataemail ).


        "phone

        lo_requestlist = lo_client_proxy->create_resource_for_entity_set( 'A_ADDRESS_PHONE_NUMBER' )->create_request_for_read( ).
        lo_filter_factory = lo_requestlist->create_filter_factory( ).
        lo_filter_node_1 = lo_filter_factory->create_by_range( iv_property_path = 'ADDRESS_ID'
        it_range = lt_range_business_email ).
        lo_requestlist->set_filter( lo_filter_node_1 ).
        lo_requestlist->set_top( 50 )->set_skip( 0 ).
        lo_responselist = lo_requestlist->execute( ).
        lo_responselist->get_business_data( IMPORTING et_business_data = lt_business_data_phone ).


        LOOP AT lt_business_data_usage
     "   read table lt_business_data_usage
          ASSIGNING <fs_data_list_usage>
       .
          "  with key address_id = <fs_data_list>-address_id.

          CASE <fs_data_list_usage>-address_usage.
            WHEN 'XXDEFAULT'.

              LOOP AT lt_business_data_phone
              ASSIGNING <fs_data_phone>
              WHERE address_id = <fs_data_list_usage>-address_id
                AND phone_number IS NOT INITIAL.

                phone1 = <fs_data_phone>-phone_number.
                EXIT.

              ENDLOOP.

            WHEN 'SHIP_TO'.
              LOOP AT lt_business_data_phone
        ASSIGNING <fs_data_phone>
        WHERE address_id = <fs_data_list_usage>-address_id
          AND phone_number IS NOT INITIAL.

                phone2 = <fs_data_phone>-phone_number.
                EXIT.
              ENDLOOP.


          ENDCASE.
        ENDLOOP.

        LOOP AT lt_business_dataemail
        ASSIGNING <fs_data_listemail>.

          IF <fs_data_listemail>-person IS INITIAL.

            emailaddress = <fs_data_listemail>-email_address.

          ELSE.

            emailnot = <fs_data_listemail>-email_address.

          ENDIF.

        ENDLOOP.

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
        RAISE SHORTDUMP lx_web_http_client_error.


    ENDTRY.


  ENDMETHOD.


  METHOD get_bp_employee_so.

  ENDMETHOD.

  METHOD get_uso_cfdi_from_belnr.


      DATA: w_factor    TYPE I_journalentryitem-yy1_factor_cob,
            W_factortyp TYPE I_journalentryitem-yy1_factoraje1_cob.

      DATA: w_name   TYPE i_customer-customername,
            w_tax    TYPE i_customer-taxnumber1,
            w_postal TYPE i_customer-postalcode.

      CLEAR: W_factor, W_factortyp.

      check accountingdocument is not initial.

      SELECT SINGLE  I_journalentryitem~yy1_factor_cob,
                      I_journalentryitem~yy1_factoraje1_cob
        FROM  I_journalentryitem
        WITH PRIVILEGED ACCESS
        WHERE accountingdocument = @accountingdocument
          AND fiscalyear = @year
          AND companycode = @CompanyCode
          AND sourceledger = '0L'
          AND yy1_factoraje1_cob IS NOT INITIAL
          INTO (  @w_factor, @W_factortyp ).

      IF sy-subrc IS INITIAL.

        SELECT SINGLE
        i_customer~taxnumber1,
        i_customer~customername,
        i_customer~postalcode
        FROM i_customer
        WITH PRIVILEGED ACCESS
        WHERE customer = @w_factor
        INTO ( @w_tax, @w_name, @w_postal ).

        IF sy-subrc IS INITIAL.

          cs_receptor_v7-rfc = w_tax.
          cs_receptor_v7-nombre = w_name.
          cs_receptor_v7-domicilio_fiscal_receptor = w_postal.
          cs_receptor_v7-regimen_fiscal_receptor = '601'.
*return here when factoraje find its data

         return.


        ENDIF.



      ENDIF.


  ENDMETHOD.

  METHOD
   get_bp_parfunc_email.
    "   importing customernum         TYPE kunag
    "                sorg type vkorg
    "                dist type vtweg

    "                divi type spart
    "                changing email1 type string
    "                         email2 type string,
    TYPES: BEGIN OF ty_s_bpfunc,
             bp   TYPE i_bupaidentification-bpidentificationnumber,
             func TYPE i_custsalespartnerfunc-partnerfunction.
    TYPES: END OF ty_s_bpfunc,
    ty_t_bpfunc TYPE STANDARD TABLE OF ty_s_bpfunc.


    DATA: is_l_bpfunc                TYPE ty_t_bpfunc.

    TYPES: BEGIN OF ty_s_bp,
             bp TYPE i_bupaidentification-businesspartner.

    TYPES: END OF ty_s_bp,
    ty_t_bp TYPE STANDARD TABLE OF ty_s_bp.


    DATA: is_l_bp                TYPE ty_t_bp.

    FIELD-SYMBOLS <fs_bp> TYPE ty_s_bp.



    SELECT i_custsalespartnerfunc~bpcustomernumber,
           i_custsalespartnerfunc~partnerfunction
    FROM i_custsalespartnerfunc
    WITH PRIVILEGED ACCESS

    WHERE customer = @customernum
      AND salesorganization = @sorg
      AND distributionchannel = @dist
      AND division = @divi
      AND ( partnerfunction = 'VE' OR partnerfunction = 'ZM' )
      INTO TABLE @is_l_bpfunc.

     CHECK lines( is_l_bpfunc ) GT 0.
 "#EC CI_NO_TRANSFORM
    SELECT i_bupaidentification~businesspartner
      FROM i_bupaidentification
      WITH PRIVILEGED ACCESS
      FOR ALL ENTRIES IN @is_l_bpfunc  "#EC CI_NO_TRANSFORM
      WHERE bpidentificationnumber = @is_l_bpfunc-bp
      INTO TABLE @is_l_bp.



    TYPES: BEGIN OF ty_s_range_bp,
             sing   TYPE zrange_sing,
             option TYPE zrange_option,
             low    TYPE string,
             high   TYPE string.
    TYPES: END OF ty_s_range_bp.

    TYPES: BEGIN OF ty_s_range_email,
             sing   TYPE zrange_sing,
             option TYPE zrange_option,
             low    TYPE zrange_email_low,
             high   TYPE zrange_email_low.
    TYPES: END OF ty_s_range_email,
    ty_t_range_email TYPE STANDARD TABLE OF ty_s_range_email.

    DATA:
      ls_entity_key             TYPE y_service_consuption_cus_mail=>tys_a_address_email_address_ty,
      ls_business_data          TYPE y_service_consuption_cus_mail=>tys_a_address_email_address_ty,
      lo_http_client            TYPE REF TO if_web_http_client,
      lo_resource               TYPE REF TO /iwbep/if_cp_resource_entity,
      lo_client_proxy           TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request                TYPE REF TO /iwbep/if_cp_request_read,
      lo_response               TYPE REF TO /iwbep/if_cp_response_read,

      lt_business_data_list     TYPE TABLE OF y_service_consuption_cus_mail=>tys_a_business_partner_addre_2,
      lo_requestlist            TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_responselist           TYPE REF TO /iwbep/if_cp_response_read_lst,
      lo_filter_factory         TYPE REF TO /iwbep/if_cp_filter_factory,
      lo_filter_factoryemail    TYPE REF TO /iwbep/if_cp_filter_factory,
      lo_filter_node_1          TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_business_partner TYPE RANGE OF string,
      lt_range_bp_company       TYPE RANGE OF string,
      ls_range_bp               TYPE ty_s_range_bp.

    DATA:
      lt_business_dataemail   TYPE TABLE OF y_service_consuption_cus_mail=>tys_a_address_email_address_ty,
      lo_requestemail         TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_responseemail        TYPE REF TO /iwbep/if_cp_response_read_lst,
      lo_filter_node_2        TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_business_email TYPE RANGE OF zrange_email_low,

      ls_range_business_email TYPE ty_s_range_email.

    DATA:
      lt_business_data_usage   TYPE TABLE OF y_service_consuption_cus_mail=>tys_a_bu_pa_address_usage_type,
      lt_business_data_contact TYPE TABLE OF y_service_consuption_cus_mail=>tys_a_bpcontact_to_func_and__2,
      lt_business_data_phone   TYPE TABLE OF y_service_consuption_cus_mail=>tys_a_address_phone_number_typ,
      lt_business_data_id      TYPE TABLE OF y_service_consuption_cus_mail=>tys_a_bu_pa_identification_typ.


    FIELD-SYMBOLS: <fs_data_list>       TYPE y_service_consuption_cus_mail=>tys_a_business_partner_addre_2,
                   <fs_data_list_usage> TYPE y_service_consuption_cus_mail=>tys_a_bu_pa_address_usage_type,
                   <fs_data_list_id>    TYPE y_service_consuption_cus_mail=>tys_a_bu_pa_identification_typ,
                   <fs_data_phone>      TYPE y_service_consuption_cus_mail=>tys_a_address_phone_number_typ,
                   <fs_data_listemail>  TYPE y_service_consuption_cus_mail=>tys_a_address_email_address_ty.



    TRY.



        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
        comm_scenario = 'Z_OUTB_OD_CSCEN_EMAILBYCUST'
        comm_system_id = 'Z_READ_EMAIL_BY_CUSTM_V2' ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).


        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
        EXPORTING
        is_proxy_model_key = VALUE #( repository_id = 'DEFAULT'
        proxy_model_id = 'Y_SERVICE_CONSUPTION_CUS_MAIL'
        proxy_model_version = '0001' )
        io_http_client = lo_http_client
        iv_relative_service_root = '' ).


        ASSERT lo_http_client IS BOUND.

        LOOP AT is_l_bp
        ASSIGNING <fs_bp>.

          ls_range_bp-sing = 'I'.
          ls_range_bp-option = 'EQ'.
          ls_range_bp-low = <fs_bp>-bp.

          APPEND ls_range_bp TO lt_range_business_partner.


        ENDLOOP.

        "address
        lo_requestlist = lo_client_proxy->create_resource_for_entity_set( 'A_BUSINESS_PARTNER_ADDRESS' )->create_request_for_read( ).
        " Create the filter tree
        lo_filter_factory = lo_requestlist->create_filter_factory( ).
        lo_filter_node_1 = lo_filter_factory->create_by_range( iv_property_path = 'BUSINESS_PARTNER'
        it_range = lt_range_business_partner ).

        lo_requestlist->set_filter( lo_filter_node_1 ).
        lo_requestlist->set_top( 50 )->set_skip( 0 ).
        lo_responselist = lo_requestlist->execute( ).
        lo_responselist->get_business_data( IMPORTING et_business_data = lt_business_data_list ).


        ls_range_business_email-sing = 'I'.
        ls_range_business_email-option = 'EQ'.

        LOOP AT lt_business_data_list
        ASSIGNING <fs_data_list>.

          ls_range_business_email-low = <fs_data_list>-address_id.

          APPEND ls_range_business_email TO lt_range_business_email.
        ENDLOOP.
        "email
        lo_requestemail = lo_client_proxy->create_resource_for_entity_set( 'A_ADDRESS_EMAIL_ADDRESS' )->create_request_for_read( ).
        lo_filter_factoryemail = lo_requestemail->create_filter_factory( ).
        lo_filter_node_2 = lo_filter_factoryemail->create_by_range( iv_property_path = 'ADDRESS_ID'
        it_range = lt_range_business_email ).
        lo_requestemail->set_filter( lo_filter_node_2 ).
        lo_requestemail->set_top( 50 )->set_skip( 0 ).
        lo_responseemail = lo_requestemail->execute( ).
        lo_responseemail->get_business_data( IMPORTING et_business_data = lt_business_dataemail ).



        LOOP AT lt_business_dataemail
        ASSIGNING <fs_data_listemail>.

          IF sy-tabix = 1.

            email1 = <fs_data_listemail>-email_address.

          ELSE.

            email2 = <fs_data_listemail>-email_address.

          ENDIF.

        ENDLOOP.

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
        RAISE SHORTDUMP lx_web_http_client_error.


    ENDTRY.





  ENDMETHOD.


  METHOD get_buspartnerindependentemail.

  ENDMETHOD.


  METHOD get_bussinesspartneremail.

    TYPES: BEGIN OF ty_s_range_bp,
             sing   TYPE zrange_sing,
             option TYPE zrange_option,
             low    TYPE string,
             high   TYPE string.
    TYPES: END OF ty_s_range_bp.

    TYPES: BEGIN OF ty_s_range_email,
             sing   TYPE zrange_sing,
             option TYPE zrange_option,
             low    TYPE zrange_email_low,
             high   TYPE zrange_email_low.
    TYPES: END OF ty_s_range_email,
    ty_t_range_email TYPE STANDARD TABLE OF ty_s_range_email.

    DATA:
      ls_entity_key             TYPE y_service_consuption_cus_mail=>tys_a_address_email_address_ty,
      ls_business_data          TYPE y_service_consuption_cus_mail=>tys_a_address_email_address_ty,
      lo_http_client            TYPE REF TO if_web_http_client,
      lo_resource               TYPE REF TO /iwbep/if_cp_resource_entity,
      lo_client_proxy           TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request                TYPE REF TO /iwbep/if_cp_request_read,
      lo_response               TYPE REF TO /iwbep/if_cp_response_read,

      lt_business_data_list     TYPE TABLE OF y_service_consuption_cus_mail=>tys_a_business_partner_addre_2,
      lo_requestlist            TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_responselist           TYPE REF TO /iwbep/if_cp_response_read_lst,
      lo_filter_factory         TYPE REF TO /iwbep/if_cp_filter_factory,
      lo_filter_factoryemail    TYPE REF TO /iwbep/if_cp_filter_factory,
      lo_filter_node_1          TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_business_partner TYPE RANGE OF string,
      ls_range_bp               TYPE ty_s_range_bp.

    DATA:
      lt_business_dataemail   TYPE TABLE OF y_service_consuption_cus_mail=>tys_a_address_email_address_ty,
      lo_requestemail         TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_responseemail        TYPE REF TO /iwbep/if_cp_response_read_lst,
      lo_filter_node_2        TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_business_email TYPE RANGE OF zrange_email_low,
      ls_range_business_email TYPE ty_s_range_email.

    FIELD-SYMBOLS: <fs_data_list>      TYPE y_service_consuption_cus_mail=>tys_a_business_partner_addre_2,
                   <fs_data_listemail> TYPE y_service_consuption_cus_mail=>tys_a_address_email_address_ty.



    TRY.



        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
        comm_scenario = 'Z_OUTB_OD_CSCEN_EMAILBYCUST'
        comm_system_id = 'Z_READ_EMAIL_BY_CUSTM_V2' ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).


        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
        EXPORTING
        is_proxy_model_key = VALUE #( repository_id = 'DEFAULT'
        proxy_model_id = 'Y_SERVICE_CONSUPTION_CUS_MAIL'
        proxy_model_version = '0001' )
        io_http_client = lo_http_client
        iv_relative_service_root = '' ).







        ASSERT lo_http_client IS BOUND.

        ls_range_bp-sing = 'I'.
        ls_range_bp-option = 'EQ'.
        ls_range_bp-low = customernum.

        APPEND ls_range_bp TO lt_range_business_partner.

        lo_requestlist = lo_client_proxy->create_resource_for_entity_set( 'A_BUSINESS_PARTNER_ADDRESS' )->create_request_for_read( ).
        " Create the filter tree
        lo_filter_factory = lo_requestlist->create_filter_factory( ).
        lo_filter_node_1 = lo_filter_factory->create_by_range( iv_property_path = 'BUSINESS_PARTNER'
        it_range = lt_range_business_partner ).

        lo_requestlist->set_filter( lo_filter_node_1 ).
        lo_requestlist->set_top( 50 )->set_skip( 0 ).
        lo_responselist = lo_requestlist->execute( ).
        lo_responselist->get_business_data( IMPORTING et_business_data = lt_business_data_list ).

        ls_range_business_email-sing = 'I'.
        ls_range_business_email-option = 'EQ'.

        LOOP AT lt_business_data_list
        ASSIGNING <fs_data_list>.

          ls_range_business_email-low = <fs_data_list>-address_id.

          APPEND ls_range_business_email TO lt_range_business_email.

        ENDLOOP.

        lo_requestemail = lo_client_proxy->create_resource_for_entity_set( 'A_ADDRESS_EMAIL_ADDRESS' )->create_request_for_read( ).
        lo_filter_factoryemail = lo_requestemail->create_filter_factory( ).
        lo_filter_node_2 = lo_filter_factoryemail->create_by_range( iv_property_path = 'ADDRESS_ID'
        it_range = lt_range_business_email ).
        lo_requestemail->set_filter( lo_filter_node_2 ).
        lo_requestemail->set_top( 50 )->set_skip( 0 ).
        lo_responseemail = lo_requestemail->execute( ).
        lo_responseemail->get_business_data( IMPORTING et_business_data = lt_business_dataemail ).

        LOOP AT lt_business_dataemail
        ASSIGNING <fs_data_listemail>.

          CHECK <fs_data_listemail>-person IS INITIAL.

          emailaddress = <fs_data_listemail>-email_address.

        ENDLOOP.

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
        RAISE SHORTDUMP lx_web_http_client_error.


    ENDTRY.


  ENDMETHOD.


  METHOD get_currency.

    SELECT SINGLE
           i_billingdocumentbasic~transactioncurrency
      FROM i_billingdocumentbasic WITH PRIVILEGED ACCESS
     WHERE billingdocument = @salesdocumentnum
      INTO @currencycode.


  ENDMETHOD.


  METHOD get_custinv_uuid.

    TYPES: BEGIN OF ty_s_range_dockey,
             sing   TYPE zrange_sing,
             option TYPE zrange_option,
             low    TYPE edoc_source_key,
             high   TYPE edoc_source_key.
    TYPES: END OF ty_s_range_dockey.


    DATA: lo_client_proxy       TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_http_client        TYPE REF TO if_web_http_client,
          ls_entity_key         TYPE y_service_consup_get_uuid_edoc=>tys_electronic_doc_file_type,
          ls_business_data      TYPE y_service_consup_get_uuid_edoc=>tys_electronic_doc_file_type,
          lo_resource           TYPE REF TO /iwbep/if_cp_resource_entity,
          lo_request            TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response           TYPE REF TO /iwbep/if_cp_response_read_lst,
          lt_business_data      TYPE TABLE OF y_service_consup_get_uuid_edoc=>tys_electronic_doc_file_type,
          lo_filter_factory     TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1      TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_docsourcekey TYPE RANGE OF edoc_source_key,
          lo_filter_node_root   TYPE REF TO /iwbep/if_cp_filter_node,
          w_l_range_vbeln       TYPE ty_s_range_dockey.


    FIELD-SYMBOLS: <fs_data_list> TYPE y_service_consup_get_uuid_edoc=>tys_electronic_doc_file_type.


    TRY.

        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
        comm_scenario = 'Z_OUT_OD_CSCEN_GET_UUID'
        comm_system_id = 'CS_Z_OUT_OD_CSCEN_GET_UUID' ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).


        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v4_remote_proxy(
        EXPORTING
        is_proxy_model_key = VALUE #( repository_id = 'DEFAULT'
        proxy_model_id = 'Y_SERVICE_CONSUP_GET_UUID_EDOC'
        proxy_model_version = '0001' )
        io_http_client = lo_http_client
        iv_relative_service_root = '' ).




        ASSERT lo_http_client IS BOUND.

        w_l_range_vbeln-sing = 'I'.
        w_l_range_vbeln-option = 'EQ'.
        w_l_range_vbeln-low = salesdocumentnum.

        APPEND w_l_range_vbeln TO lt_range_docsourcekey.

        lo_request = lo_client_proxy->create_resource_for_entity_set( 'ELECTRONIC_DOC_FILE' )->create_request_for_read( ).
        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).
        lo_filter_node_1 = lo_filter_factory->create_by_range( iv_property_path = 'ELECTRONIC_DOC_SOURCE_KEY'
        it_range = lt_range_docsourcekey ).

        lo_filter_node_root = lo_filter_node_1.

        lo_request->set_filter( lo_filter_node_root ).
        lo_request->set_top( 50 )->set_skip( 0 ).
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        LOOP AT lt_business_data
        ASSIGNING <fs_data_list>.

          CHECK <fs_data_list>-electronic_doc_file_uuid IS NOT INITIAL.

          uuid = zedoc_mx_addendas_get_data=>get_uuid_edoc( uuid_file = <fs_data_list>-electronic_doc_file_uuid ).


        ENDLOOP.


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


  ENDMETHOD.

 METHOD get_custinv_timbrado_date.

   TYPES: BEGIN OF ty_s_range_dockey,
            sing   TYPE zrange_sing,
            option TYPE zrange_option,
            low    TYPE edoc_source_key,
            high   TYPE edoc_source_key.
   TYPES: END OF ty_s_range_dockey.


   DATA: lo_client_proxy       TYPE REF TO /iwbep/if_cp_client_proxy,
         lo_http_client        TYPE REF TO if_web_http_client,
         ls_entity_key         TYPE y_service_consup_get_uuid_edoc=>tys_electronic_doc_file_type,
         ls_business_data      TYPE y_service_consup_get_uuid_edoc=>tys_electronic_doc_file_type,
         lo_resource           TYPE REF TO /iwbep/if_cp_resource_entity,
         lo_request            TYPE REF TO /iwbep/if_cp_request_read_list,
         lo_response           TYPE REF TO /iwbep/if_cp_response_read_lst,
         lt_business_data      TYPE TABLE OF y_service_consup_get_uuid_edoc=>tys_electronic_doc_file_type,
         lo_filter_factory     TYPE REF TO /iwbep/if_cp_filter_factory,
         lo_filter_node_1      TYPE REF TO /iwbep/if_cp_filter_node,
         lt_range_docsourcekey TYPE RANGE OF edoc_source_key,
         lo_filter_node_root   TYPE REF TO /iwbep/if_cp_filter_node,
         w_l_range_vbeln       TYPE ty_s_range_dockey.


   FIELD-SYMBOLS: <fs_data_list> TYPE y_service_consup_get_uuid_edoc=>tys_electronic_doc_file_type.
   DATA: w_l_day        TYPE string,
         w_l_month      TYPE string,
         w_l_year       TYPE string,
         w_l_fecrec_str TYPE string.


   TRY.

       DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
       comm_scenario = 'Z_OUT_OD_CSCEN_GET_UUID'
       comm_system_id = 'CS_Z_OUT_OD_CSCEN_GET_UUID' ).

       lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).


       lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v4_remote_proxy(
       EXPORTING
       is_proxy_model_key = VALUE #( repository_id = 'DEFAULT'
       proxy_model_id = 'Y_SERVICE_CONSUP_GET_UUID_EDOC'
       proxy_model_version = '0001' )
       io_http_client = lo_http_client
       iv_relative_service_root = '' ).




       ASSERT lo_http_client IS BOUND.

       w_l_range_vbeln-sing = 'I'.
       w_l_range_vbeln-option = 'EQ'.
       w_l_range_vbeln-low = salesdocumentnum.

       APPEND w_l_range_vbeln TO lt_range_docsourcekey.

       lo_request = lo_client_proxy->create_resource_for_entity_set( 'ELECTRONIC_DOC_FILE' )->create_request_for_read( ).
       " Create the filter tree
       lo_filter_factory = lo_request->create_filter_factory( ).
       lo_filter_node_1 = lo_filter_factory->create_by_range( iv_property_path = 'ELECTRONIC_DOC_SOURCE_KEY'
       it_range = lt_range_docsourcekey ).

       lo_filter_node_root = lo_filter_node_1.

       lo_request->set_filter( lo_filter_node_root ).
       lo_request->set_top( 50 )->set_skip( 0 ).
       lo_response = lo_request->execute( ).
       lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

       LOOP AT lt_business_data
       ASSIGNING <fs_data_list>.

         CHECK <fs_data_list>-electronic_doc_file_uuid IS NOT INITIAL.

         "        concatenate <fs_data_list>-electronic_doc_file_crea_2  <fs_data_list>-electronic_doc_file_creati into datetime.

         w_l_day   = <fs_data_list>-electronic_doc_file_crea_2+6(2).
         w_l_month = <fs_data_list>-electronic_doc_file_crea_2+4(2).
         w_l_year  = <fs_data_list>-electronic_doc_file_crea_2+0(4).
         DATA: w_l_tim TYPE string.

         "  w_l_tim = w_l_timdat+4(4).

         CONCATENATE w_l_year '-' w_l_month '-' w_l_day
      "     w_l_timdat+4
         INTO w_l_fecrec_str.

         CONCATENATE w_l_fecrec_str <fs_data_list>-electronic_doc_file_creati
          INTO datetime.

       ENDLOOP.


     CATCH cx_http_dest_provider_error INTO DATA(lx_destination). "#EC NO_HANDLER
       " Handle remote Exception
       " It contains details about the problems of your http(s) connection

     CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).    "#EC NO_HANDLER
       " Handle remote Exception
       " It contains details about the problems of your http(s) connection

     CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).     "#EC NO_HANDLER
       " Handle Exception

     CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error). "#EC NO_HANDLER
       " Handle Exception
       RAISE SHORTDUMP lx_web_http_client_error.   "#EC NO_HANDLER


   ENDTRY.


 ENDMETHOD.
  METHOD  get_customer_oc_data.

    TYPES: BEGIN OF ty_s_vbak,
             salesorder TYPE i_salesorderitem-salesorder,
             delivery   TYPE i_billingdocumentitem-referencesddocument.
    TYPES: END OF ty_s_vbak,
    ty_t_vbak TYPE STANDARD TABLE OF ty_s_vbak.


    DATA: is_l_vbak                TYPE ty_t_vbak,
          w_l_purchaseorder        TYPE string,
          is_l_purchaseorderbyitem TYPE ty_t_purchaseorderbyitem.


    FIELD-SYMBOLS : <fs_vbak> TYPE vbeln.




    SELECT
     i_billingdocumentitem~salesdocument,
       i_billingdocumentitem~referencesddocument

     FROM
     i_billingdocumentitem WITH PRIVILEGED ACCESS
     WHERE billingdocument = @salesdocument
     INTO TABLE @is_l_vbak.

    CHECK sy-subrc EQ 0.

    SORT is_l_vbak.

    DELETE ADJACENT DUPLICATES FROM is_l_vbak.

    CHECK lines( is_l_vbak ) GT 0.

    entregas = is_l_vbak.

    SELECT
    i_salesdocumentitem~salesdocument,
    i_salesdocumentitem~salesdocumentitem,

    i_salesdocumentitem~purchaseorderbycustomer,
     i_salesdocumentitem~materialbycustomer

    FROM i_salesdocumentitem
    WITH PRIVILEGED ACCESS
    FOR ALL ENTRIES IN @is_l_vbak

    WHERE
    salesdocument =  @is_l_vbak-salesorder


    INTO TABLE @customer_oc_data.


    CHECK sy-subrc EQ 0.

  ENDMETHOD.


  METHOD get_folionr1.

    SELECT SINGLE yy1_folionr1_bdh
      FROM i_billingdocumentbasic WITH PRIVILEGED ACCESS
     WHERE billingdocument = @salesdocumentnum
      INTO @folionr1.


  ENDMETHOD.


  METHOD get_purchaseorder.

    DATA: is_l_vbak         TYPE STANDARD TABLE OF vbeln_va,
          w_l_purchaseorder TYPE string.

    FIELD-SYMBOLS : <fs_vbak> TYPE vbeln.

    CLEAR purchaseorder .

    SELECT
    i_billingdocumentitem~salesdocument
    FROM
    i_billingdocumentitem WITH PRIVILEGED ACCESS
    WHERE billingdocument = @salesdocumentnum
    INTO TABLE @is_l_vbak.

    CHECK sy-subrc EQ 0.

    READ TABLE is_l_vbak
    ASSIGNING <fs_vbak>
    INDEX 1.

    CHECK sy-subrc EQ 0.


    SELECT SINGLE i_salesorder~purchaseorderbycustomer
    FROM i_salesorder WITH PRIVILEGED ACCESS
    WHERE salesorder = @<fs_vbak>
    INTO @w_l_purchaseorder.

    CHECK sy-subrc = 0.

    purchaseorder = w_l_purchaseorder.


  ENDMETHOD.


  METHOD get_purchaseorderbyitem.

    TYPES: BEGIN OF ty_s_vbak,
             salesorder TYPE i_salesorderitem-salesorder.
    TYPES: END OF ty_s_vbak,
    ty_t_vbak TYPE STANDARD TABLE OF ty_s_vbak.


    DATA: is_l_vbak                TYPE ty_t_vbak,
          w_l_purchaseorder        TYPE string,
          is_l_purchaseorderbyitem TYPE ty_t_purchaseorderbyitem.


    FIELD-SYMBOLS : <fs_vbak> TYPE vbeln.


    SELECT
    i_billingdocumentitem~salesdocument
    FROM
    i_billingdocumentitem WITH PRIVILEGED ACCESS
    WHERE billingdocument = @salesdocumentnum
    INTO TABLE @is_l_vbak.


    CHECK sy-subrc EQ 0.

    SORT is_l_vbak.

    DELETE ADJACENT DUPLICATES FROM is_l_vbak.

    CHECK lines( is_l_vbak ) GT 0.

    SELECT salesorder,
    salesorderitem,
    purchaseorderbycustomer
    FROM i_salesorderitem WITH PRIVILEGED ACCESS
    FOR ALL ENTRIES IN @is_l_vbak
    WHERE salesorder EQ @is_l_vbak-salesorder
    INTO TABLE @purchaseorderitem.


    CHECK sy-subrc EQ 0.


  ENDMETHOD.


  METHOD get_remision.

    SELECT SINGLE yy1_remision1_bdh
      FROM i_billingdocumentbasic WITH PRIVILEGED ACCESS
     WHERE billingdocument = @salesdocumentnum
      INTO @remision.


  ENDMETHOD.


  METHOD get_unit_measure_by_item.

    TYPES: BEGIN OF ty_s_unit_measure,
             billingitem TYPE i_billingdocumentitem-billingdocumentitem,
             baseunit    TYPE i_billingdocumentitem-baseunit.
    TYPES: END OF ty_s_unit_measure,
    ty_t_unit_measure TYPE STANDARD TABLE OF ty_s_unit_measure.

    TYPES: BEGIN OF ty_s_unit_measure_text,
             baseunit       TYPE i_billingdocumentitem-baseunit,
             commercialname TYPE i_unitofmeasuretext-unitofmeasurecommercialname.
    TYPES: END OF ty_s_unit_measure_text,
    ty_t_unit_measure_text TYPE STANDARD TABLE OF ty_s_unit_measure_text.


    DATA: is_l_unit_of_measure    TYPE ty_t_unit_measure,
          is_l_unitofmeasuretext  TYPE ty_t_unit_measure_text,
          w_l_unitofmeasurebyitem TYPE ty_s_unitofmeasurebyitem.


    FIELD-SYMBOLS: <fs_unit_of_measure>   TYPE ty_s_unit_measure,
                   <fs_unitofmeasuretext> TYPE ty_s_unit_measure_text.



    SELECT billingdocumentitem,
           baseunit
      FROM i_billingdocumentitem WITH PRIVILEGED ACCESS
     WHERE billingdocument = @salesdocumentnum
      INTO TABLE @is_l_unit_of_measure.


    CHECK sy-subrc EQ 0.

    CHECK lines( is_l_unit_of_measure ) GT 0.

    SELECT unitofmeasure,                          "#EC CI_NO_TRANSFORM
    unitofmeasurecommercialname
    FROM i_unitofmeasuretext WITH PRIVILEGED ACCESS
    FOR ALL ENTRIES IN @is_l_unit_of_measure
    WHERE language = @language
    AND unitofmeasure = @is_l_unit_of_measure-baseunit
    INTO TABLE @is_l_unitofmeasuretext .


    CHECK sy-subrc EQ 0.

    LOOP AT is_l_unit_of_measure
    ASSIGNING <fs_unit_of_measure>.

      w_l_unitofmeasurebyitem-billingitem = <fs_unit_of_measure>-billingitem.

      READ TABLE is_l_unitofmeasuretext
      ASSIGNING <fs_unitofmeasuretext>
      WITH KEY baseunit = <fs_unit_of_measure>-baseunit.

      CHECK sy-subrc EQ 0.

      w_l_unitofmeasurebyitem-unitofmeasure = <fs_unitofmeasuretext>-commercialname.

      APPEND w_l_unitofmeasurebyitem TO unit_measure_by_item.

    ENDLOOP.



  ENDMETHOD.


  METHOD get_uso_cfdi_from_billingdoc.



    SELECT SINGLE yy1_usodecfdisales_bdh
      FROM i_billingdocumentbasic WITH PRIVILEGED ACCESS
     WHERE billingdocument =  @billingdocument
      INTO @usocfdi.

  ENDMETHOD.


  METHOD get_uso_cfdi_from_deliverydoc.




    SELECT SINGLE yy1_usodecfdisales_dlh
      FROM i_deliverydocument WITH PRIVILEGED ACCESS
     WHERE deliverydocument =  @deliverydocument
      INTO @usocfdi.


  ENDMETHOD.


  METHOD get_uuid_edoc.

    DATA:
      ls_entity_key    TYPE y_service_consup_get_uuid_edoc=>tys_electronic_doc_file_type,
      ls_business_data TYPE y_service_consup_get_uuid_edoc=>tys_electronic_doc_file_type,
      lo_http_client   TYPE REF TO if_web_http_client,
      lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request       TYPE REF TO /iwbep/if_cp_request_read,
      lo_response      TYPE REF TO /iwbep/if_cp_response_read.



    TRY.

        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
               comm_scenario = 'Z_OUT_OD_CSCEN_GET_UUID'
               comm_system_id = 'CS_Z_OUT_OD_CSCEN_GET_UUID' ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v4_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'Y_SERVICE_CONSUP_GET_UUID_EDOC'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '' ).

        ASSERT lo_http_client IS BOUND.


        " Set entity key
        ls_entity_key = VALUE #(
                  electronic_doc_file_uuid  =  uuid_file ).

        " Navigate to the resource
        lo_resource = lo_client_proxy->create_resource_for_entity_set( 'ELECTRONIC_DOC_FILE' )->navigate_with_key( ls_entity_key ).

        " Execute the request and retrieve the business data
        lo_response = lo_resource->create_request_for_read( )->execute( ).
        lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

        uuid = ls_business_data-electronic_doc_uuid.

  CATCH cx_http_dest_provider_error INTO DATA(lx_destination).
     " Handle remote Exception
        " It contains details about the problems of your http(s) connection
   RAISE SHORTDUMP lx_destination.
      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection
   RAISE SHORTDUMP lx_remote.
      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception
   RAISE SHORTDUMP lx_gateway.
      CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
        " Handle Exception
        RAISE SHORTDUMP lx_web_http_client_error.


    ENDTRY.

  ENDMETHOD.


  METHOD output_amount_decimalplaces.

    DATA: w_l_len    TYPE i,
          w_l_offset TYPE i.

    amt_str = amt_value.

    amt_str = condense( amt_str ).

    w_l_len = strlen( amt_str ).

    IF ( amt_str CS '.' ).

      w_l_offset = w_l_len - sy-fdpos - 1 .

    ENDIF.

    WHILE ( w_l_offset LT decimal_places ).

      CONCATENATE amt_str '0' INTO amt_str.

      w_l_offset = w_l_offset + 1.


    ENDWHILE.


  ENDMETHOD.


  METHOD output_qty_decimalplaces.

    DATA: w_l_len    TYPE i,
          w_l_offset TYPE i.

    qty_str = qty_value.

    qty_str = condense( qty_str ).

    w_l_len = strlen( qty_str ).

    IF ( qty_str CS '.' ).

      w_l_offset = w_l_len - sy-fdpos - 1 .

    ENDIF.

    IF w_l_offset LT decimal_places.

      WHILE ( w_l_offset LT decimal_places ).

        CONCATENATE qty_str '0' INTO qty_str.

        w_l_offset = w_l_offset + 1.


      ENDWHILE.

    ENDIF.

    IF decimal_places LT w_l_offset.

      WHILE ( decimal_places LT w_l_offset ).

        w_l_len = strlen( qty_str ).

        w_l_len = w_l_len - 1.

        qty_str = qty_str+0(w_l_len).


        w_l_offset = w_l_offset - 1.


      ENDWHILE.

      IF decimal_places EQ 0.

        REPLACE '.' IN qty_str WITH space.

        qty_str = condense( qty_str ).


      ENDIF.

    ENDIF.




  ENDMETHOD.
ENDCLASS.
