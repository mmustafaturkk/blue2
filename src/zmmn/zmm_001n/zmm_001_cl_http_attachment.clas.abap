CLASS zmm_001_cl_http_attachment DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_message,
             lang  TYPE string,
             value TYPE string,
           END OF ty_message.

    TYPES: BEGIN OF ty_error,
             code    TYPE string,
             message TYPE ty_message,
           END OF ty_error.

    TYPES: BEGIN OF ty_response,
             error TYPE ty_error,
           END OF ty_response.

    TYPES: BEGIN OF ty_handle_response,
             code    TYPE string,
             reason  TYPE string,
             message TYPE string,
           END OF ty_handle_response.

    METHODS set_response IMPORTING is_handle_response TYPE ty_handle_response
                         CHANGING  co_response        TYPE REF TO if_web_http_response.
    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZMM_001_CL_HTTP_ATTACHMENT IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.
    DATA: ls_req          TYPE zmm_001_s_attachment_req,
          ls_response     TYPE  ty_handle_response,
          ls_req_response TYPE ty_handle_response,
          ls_handle_response TYPE ty_handle_response,
          lo_response        TYPE REF TO if_web_http_response.
    DATA(lv_request) = request->get_text( ).

    TRY.
        CALL METHOD /ui2/cl_json=>deserialize
          EXPORTING
            json         = lv_request
            pretty_name  = /ui2/cl_json=>pretty_mode-user_low_case
            assoc_arrays = abap_true
          CHANGING
            data         = ls_req.

      CATCH cx_root INTO DATA(lc_root).
        DATA(lv_message) = lc_root->get_longtext( ).
    ENDTRY.

    DATA(lo_attachment) = NEW zcl_mm_001_attachment(  ).
    lo_attachment->attachment(
      EXPORTING
        iv_busobjecttype   = 'BUS2081'
        iv_docno           = ls_req-document_no
        iv_attachment_name = ls_req-attachment_name
        iv_xstring         = ls_req-content
      CHANGING
        cs_response        = ls_response
    ).

*    TRY.
*        " Create http client
*        DATA(lo_http_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
*                                                     comm_scenario  = 'ZMM_001_CS_EXPENSE'
*                                                     comm_system_id = 'Z_CSYS_HTTP_ATTACHMENT'
*                                                     service_id     = 'ZMM_001_OBS_EXPENSE_REST' ).
**        DATA(lo_http_destination) =
**     cl_http_destination_provider=>create_by_url( 'https://my406905-api.s4hana.cloud.sap/sap/opu/odata/sap/API_CV_ATTACHMENT_SRV/AttachmentContentSet' ).
**        "alternatively create HTTP destination via destination service
**        "cl_http_destination_provider=>create_by_cloud_destination( i_name = '<...>'
**        "                            i_service_instance_name = '<...>' )
*
*        DATA(lo_web_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_http_destination ) .
*        DATA(lo_web_http_req)    = lo_web_http_client->get_http_request( ).
*        lo_web_http_req->set_header_fields( VALUE #(
*        ( name = 'x-csrf-token' value = 'fetch' )
*        ) ).
*
*        DATA(lo_web_http_response) = lo_web_http_client->execute( if_web_http_client=>get ).
*        DATA(lv_token) = lo_web_http_response->get_header_field(
*          EXPORTING
*            i_name  = 'x-csrf-token'
*        ).
**        CATCH cx_web_message_error.
*        FREE lo_web_http_req.
*        lo_web_http_req = lo_web_http_client->get_http_request( ).
*        lo_web_http_req->set_header_fields( VALUE #(
*        ( name = 'slug'                   value = ls_req-attachment_name )
**        ( name = 'Content-Type'           value = ls_req-content_type )
*        ( name = 'BusinessObjectTypeName' value = 'BUS2081' )
*        ( name = 'LinkedSAPObjectKey'     value = ls_req-document_no )
*        ( name = 'x-csrf-token'           value = lv_token )
*        ( name = 'Accept'                 value = 'application/json' )
*        ) ).
*
**        CATCH cx_web_message_error.
*        ""Buradaki "," den sonra işlemi kaldırıldı.Content Fioriden direkt olarak base64 formatta geliyor
**        FIND ',' IN ls_req-content MATCH OFFSET DATA(lv_offset).
**        IF sy-subrc EQ 0.
**          lv_offset += 1.
**          DATA(lv_content) = ls_req-content+lv_offset.
**        ELSE.
**          lv_content = ls_req-content.
**        ENDIF.
**
**        DATA(lv_xstring) = cl_web_http_utility=>decode_x_base64( encoded = lv_content ).
*        DATA(lv_xstring) = cl_web_http_utility=>decode_x_base64( encoded = ls_req-content ).
*
**        SELECT SINGLE attachment FROM zfi_001_alw_h2 INTO @DATA(lv_att).
*        DATA(lv_len) = xstrlen( lv_xstring ).
**        DATA(lv_len) = xstrlen( lv_att ).
*        lo_web_http_req->set_binary(
*          EXPORTING
*            i_data   = lv_xstring
**            i_data   = lv_att
*            i_offset = 0
*            i_length = lv_len
**           RECEIVING
**             r_value  =
*        ).
*        FREE lo_web_http_response.
*        lo_web_http_response = lo_web_http_client->execute( if_web_http_client=>post ).
*        DATA(lv_response) = lo_web_http_response->get_text( ).
*        DATA(ls_status)   = lo_web_http_response->get_status( ).
*        MOVE-CORRESPONDING ls_status TO ls_req_response.
*
*        IF ls_status-code NE '201'.
*          TRY.
*              CALL METHOD /ui2/cl_json=>deserialize
*                EXPORTING
*                  json         = lv_response
*                  pretty_name  = /ui2/cl_json=>pretty_mode-user_low_case
*                  assoc_arrays = abap_true
*                CHANGING
*                  data         = ls_response.
*
*              ls_req_response-message = ls_response-error-message-value.
*            CATCH cx_root INTO lc_root.
*              lv_message = lc_root->get_longtext( ).
*          ENDTRY.
*        ELSE.
*          ls_req_response-message = 'Başarılı'.
*        ENDIF.
*
*      CATCH cx_http_dest_provider_error INTO DATA(lo_provider_error).
*        ls_req_response-message = lo_provider_error->get_longtext( ).
*        ls_req_response-code    = '400'.
*        ls_req_response-reason  = 'Destination problem.'.
*
*      CATCH cx_web_http_client_error INTO DATA(lo_client_error).
*        ls_req_response-message = lo_client_error->get_longtext( ).
*        ls_req_response-code    = '400'.
*        ls_req_response-reason  = 'Client problem.'.
*
*    ENDTRY.
*    set_response( EXPORTING is_handle_response = ls_req_response  CHANGING co_response = response ).

  ENDMETHOD.


  METHOD set_response.
    DATA(lv_json_string) = xco_cp_json=>data->from_abap( is_handle_response )->apply( VALUE #(
      ( xco_cp_json=>transformation->underscore_to_pascal_case )
      ) )->to_string( ).

    co_response->set_text( lv_json_string ).
    co_response->set_header_field( i_name = 'content-type' i_value = 'text/json' ).
  ENDMETHOD.
ENDCLASS.
