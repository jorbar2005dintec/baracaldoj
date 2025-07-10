"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>com.sap.gateway.srvd_a2x.api_electronicdocfile.v0001</em>
CLASS y_service_consup_get_uuid_edoc DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of ELECTRONIC_DOC_FILE_TYPE</p>
      BEGIN OF tys_value_controls_1,
        "! ELECTRONIC_DOC_FILE_CREA_2
        electronic_doc_file_crea_2 TYPE /iwbep/v4_value_control,
        "! ELECTRONIC_DOC_UUID
        electronic_doc_uuid        TYPE /iwbep/v4_value_control,
        "! ELECTRONIC_DOC_LAST_CHANGE
        electronic_doc_last_change TYPE /iwbep/v4_value_control,
        "! ELECTRONIC_DOC_CREATION_DA
        electronic_doc_creation_da TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_1.

    TYPES:
      "! <p class="shorttext synchronized">ElectronicDocFile_Type</p>
      BEGIN OF tys_electronic_doc_file_type,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_1,
        "! <em>Key property</em> ElectronicDocFileUUID
        electronic_doc_file_uuid   TYPE sysuuid_x16,
        "! ElectronicDocFileType
        electronic_doc_file_type_2 TYPE c LENGTH 10,
        "! ElectronicDocFileName
        electronic_doc_file_name   TYPE string,
        "! ElectronicDocFileCreationTime
        electronic_doc_file_creati TYPE timn,
        "! ElectronicDocFileCreationDate
        electronic_doc_file_crea_2 TYPE datn,
        "! ElectronicDocFileContent
        electronic_doc_file_conten TYPE xstring,
        "! ElectronicDocUUID
        electronic_doc_uuid        TYPE sysuuid_x16,
        "! ElectronicDocCompanyCode
        electronic_doc_company_cod TYPE c LENGTH 4,
        "! ElectronicDocCountry
        electronic_doc_country     TYPE c LENGTH 3,
        "! ElectronicDocCountry_Text
        electronic_doc_country_tex TYPE c LENGTH 50,
        "! ElectronicDocSourceType
        electronic_doc_source_type TYPE c LENGTH 10,
        "! ElectronicDocSourceType_Text
        electronic_doc_source_ty_2 TYPE c LENGTH 100,
        "! ElectronicDocSourceKey
        electronic_doc_source_key  TYPE c LENGTH 32,
        "! ElectronicDocType
        electronic_doc_type        TYPE c LENGTH 10,
        "! ElectronicDocType_Text
        electronic_doc_type_text   TYPE c LENGTH 30,
        "! ElectronicDocProcess
        electronic_doc_process     TYPE c LENGTH 10,
        "! ElectronicDocProcess_Text
        electronic_doc_process_tex TYPE c LENGTH 60,
        "! ElectronicDocProcessStatus
        electronic_doc_process_sta TYPE c LENGTH 10,
        "! ElectronicDocProcessStatus_Text
        electronic_doc_process_s_2 TYPE c LENGTH 30,
        "! ElectronicDocLastChangeDate
        electronic_doc_last_change TYPE datn,
        "! ElectronicDocLastChangeTime
        electronic_doc_last_chan_2 TYPE timn,
        "! ElectronicDocCreationDate
        electronic_doc_creation_da TYPE datn,
        "! ElectronicDocCreationTime
        electronic_doc_creation_ti TYPE timn,
      END OF tys_electronic_doc_file_type,
      "! <p class="shorttext synchronized">List of ElectronicDocFile_Type</p>
      tyt_electronic_doc_file_type TYPE STANDARD TABLE OF tys_electronic_doc_file_type WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! ElectronicDocFile
        "! <br/> Collection of type 'ElectronicDocFile_Type'
        electronic_doc_file TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'ELECTRONIC_DOC_FILE',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for complex types</p>
      BEGIN OF gcs_complex_type,
         "! Dummy field - Structure must not be empty
         dummy TYPE int1 VALUE 0,
      END OF gcs_complex_type.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for ElectronicDocFile_Type</p>
        "! See also structure type {@link ..tys_electronic_doc_file_type}
        BEGIN OF electronic_doc_file_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF electronic_doc_file_type,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define ElectronicDocFile_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_electronic_doc_file_type RAISING /iwbep/cx_gateway.

ENDCLASS.


CLASS y_service_consup_get_uuid_edoc IMPLEMENTATION.

  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'com.sap.gateway.srvd_a2x.api_electronicdocfile.v0001' ) ##NO_TEXT.

    def_electronic_doc_file_type( ).

  ENDMETHOD.


  METHOD def_electronic_doc_file_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'ELECTRONIC_DOC_FILE_TYPE'
                                    is_structure              = VALUE tys_electronic_doc_file_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'ElectronicDocFile_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'ELECTRONIC_DOC_FILE' ).
    lo_entity_set->set_edm_name( 'ElectronicDocFile' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_FILE_UUID' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocFileUUID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_FILE_TYPE_2' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocFileType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_FILE_NAME' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocFileName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_FILE_CREATI' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocFileCreationTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_FILE_CREA_2' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocFileCreationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_FILE_CONTEN' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocFileContent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Binary' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_UUID' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocUUID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_COMPANY_COD' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocCompanyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_COUNTRY_TEX' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocCountry_Text' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_SOURCE_TYPE' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocSourceType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_SOURCE_TY_2' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocSourceType_Text' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 100 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_SOURCE_KEY' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocSourceKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_TYPE' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_TYPE_TEXT' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocType_Text' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_PROCESS' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocProcess' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_PROCESS_TEX' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocProcess_Text' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_PROCESS_STA' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocProcessStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_PROCESS_S_2' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocProcessStatus_Text' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_LAST_CHANGE' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocLastChangeDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_LAST_CHAN_2' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocLastChangeTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_CREATION_DA' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocCreationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELECTRONIC_DOC_CREATION_TI' ).
    lo_primitive_property->set_edm_name( 'ElectronicDocCreationTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.

  ENDMETHOD.


ENDCLASS.
