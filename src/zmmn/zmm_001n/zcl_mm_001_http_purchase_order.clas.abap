CLASS zcl_mm_001_http_purchase_order DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF ty_inputs.
             INCLUDE TYPE zmm_001_s_purch_order_header.
    TYPES:   items TYPE STANDARD TABLE OF zmm_001_s_purch_order_item WITH EMPTY KEY,
           END OF ty_inputs,

           BEGIN OF ty_output,
             items TYPE STANDARD TABLE OF zmm_001_s_pur_order_response WITH EMPTY KEY,
           END OF ty_output.

    TYPES: BEGIN OF ty_return,
             message TYPE string,
           END OF ty_return.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: ls_req            TYPE ty_inputs,
          lv_error(1)       TYPE c,
          lv_text           TYPE string,
          es_response       TYPE ty_output,
          lc_header_content TYPE string VALUE 'content-type',
          lc_content_type   TYPE string VALUE 'text/json',
          lt_return         TYPE STANDARD TABLE OF ty_return WITH EMPTY KEY.

ENDCLASS.



CLASS ZCL_MM_001_HTTP_PURCHASE_ORDER IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.
    DATA(lv_req_body) = request->get_text( ).
    DATA(get_method) = request->get_method( ).

    "first deserialize the request
    xco_cp_json=>data->from_string( lv_req_body )->apply( VALUE #(
        ( xco_cp_json=>transformation->pascal_case_to_underscore )
      ) )->write_to( REF #( ls_req ) ).

    TYPES: tt_soi_deep_create TYPE STANDARD TABLE OF za_purchaseordereb04c73093 WITH NON-UNIQUE DEFAULT KEY.
    TYPES: BEGIN OF ty_s_deep_create.
             INCLUDE TYPE za_purchaseordereb04c73093.
    TYPES:   _purchaseorderitem TYPE  tt_soi_deep_create,
           END OF ty_s_deep_create.

    DATA:
      ls_business_data        TYPE ty_s_deep_create,
      ls_business_data_return TYPE ty_s_deep_create,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lv_po_number            TYPE ty_s_deep_create-purchaseorder.

    DATA(lo_run) = NEW zmm_001_cl_call_purchase_order( input = ls_req ).

*    lo_run->run(
*      IMPORTING
*        ev_po_number = lv_po_number
*      CHANGING
*        ct_return    = lt_return
*    ).

    lo_run->create_invoice(
      IMPORTING
        ev_invoice_number = DATA(lv_invoicenumber)
      CHANGING
        ct_return         = lt_return
    ).

*    IF lv_po_number IS NOT INITIAL.
    IF lv_invoicenumber IS NOT INITIAL.

*      APPEND INITIAL LINE TO lt_return ASSIGNING FIELD-SYMBOL(<lfs_return>).
*      <lfs_return>-message = |İşlem başarılı Purchase Order = { lv_po_number }|.
*      <lfs_return>-message = |İşlem başarılı Purchase Order = { lv_invoicenumber }|.
      response->set_status('200').

    ELSE.

*      APPEND INITIAL LINE TO lt_return ASSIGNING <lfs_return>.
*      <lfs_return>-message = |İşlem başarısız|.

      response->set_status('500').
    ENDIF.

    DATA(lv_json_string) = xco_cp_json=>data->from_abap( lt_return )->apply( VALUE #(
    ( xco_cp_json=>transformation->underscore_to_pascal_case )
    ) )->to_string( ).

    response->set_text( lv_json_string ).
    response->set_header_field( i_name = lc_header_content
    i_value = lc_content_type ).
  ENDMETHOD.
ENDCLASS.
