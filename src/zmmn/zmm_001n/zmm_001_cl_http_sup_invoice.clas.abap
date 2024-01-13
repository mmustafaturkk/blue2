CLASS zmm_001_cl_http_sup_invoice DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_return,
             message TYPE string,
           END OF ty_return.

    TYPES: BEGIN OF ty_input_inv.
             INCLUDE TYPE zmm_001_s_sup_invoice_header.
    TYPES:   items TYPE STANDARD TABLE OF zmm_001_s_sup_invoice_item WITH EMPTY KEY,
           END OF ty_input_inv.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: ls_req            TYPE ty_input_inv,
          lc_header_content TYPE string VALUE 'content-type',
          lc_content_type   TYPE string VALUE 'text/json'.
ENDCLASS.



CLASS ZMM_001_CL_HTTP_SUP_INVOICE IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA(lv_req_body) = request->get_text( ).
    DATA(get_method) = request->get_method( ).

    "first deserialize the request
    xco_cp_json=>data->from_string( lv_req_body )->apply( VALUE #(
        ( xco_cp_json=>transformation->pascal_case_to_underscore )
      ) )->write_to( REF #( ls_req ) ).

    DATA: lo_http_client  TYPE REF TO if_web_http_client,
          lo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request      TYPE REF TO /iwbep/if_cp_request_create,
          lo_response     TYPE REF TO /iwbep/if_cp_response_create,
*          lv_po_number    TYPE ty_s_deep_create-purchaseorde,
          lt_return       TYPE STANDARD TABLE OF ty_return WITH EMPTY KEY,
          lv_error        TYPE zmm_000_de_char1.

    DATA(lo_invoice) = NEW zmm_001_cl_call_sup_invoice( ).

    lo_invoice->create_invoice(
      IMPORTING
        es_req    = ls_req
        ev_type   = ls_req-type
      CHANGING
        ct_return = lt_return
        cv_error  = lv_error
    ).

    IF lv_error IS INITIAL.
      response->set_status('200').
    ELSE.
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
