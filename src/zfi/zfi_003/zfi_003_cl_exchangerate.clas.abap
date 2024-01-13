CLASS zfi_003_cl_exchangerate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
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
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZFI_003_CL_EXCHANGERATE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: ls_response     TYPE  ty_response,
          ls_req_response TYPE ty_handle_response,
          lt_req_response TYPE ty_handle_response,
          lt_log          TYPE TABLE OF zfi_003_log,
          ls_log          TYPE zfi_003_log.
    TRY.
        " Create http client
        DATA(lo_http_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
                                                     comm_scenario  = 'ZFI_003_CS_EXCHANGERATE'
                                                     comm_system_id = 'ZFI_003_CS_EXCHANGERATE' "'ZAFKTEST_CS'
                                                     service_id     = 'ZFI_003_OBS_EXCHANGERATE_REST' ).

        DATA(lo_web_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_http_destination ) .
        DATA(lo_web_http_req)    = lo_web_http_client->get_http_request( ).


        SELECT DISTINCT exchangeratetype,
                        sourcecurrency,
                        targetcurrency,
                        validitystartdate,
                        exchangerate
        FROM i_exchangeraterawdata AS raw
        WHERE validitystartdate LE @sy-datum
        AND validitystartdate GE '20230101'
        INTO TABLE @DATA(lt_exchange).

        DATA lv_query TYPE string.
        DATA lv_abs   TYPE ukurs_curr.


        LOOP AT lt_exchange INTO DATA(ls_exchange).
          lv_abs = abs( ls_exchange-exchangerate ).

          lo_web_http_req->set_header_fields( VALUE #( ( name = 'x-csrf-token' value = 'fetch' ) ) ).

          DATA(lo_web_http_response) = lo_web_http_client->execute( if_web_http_client=>get ).
          DATA(lv_token) = lo_web_http_response->get_header_field(
            EXPORTING
              i_name  = 'x-csrf-token'
          ).

          FREE lo_web_http_req.
          lo_web_http_req = lo_web_http_client->get_http_request( ).
          lo_web_http_req->set_header_fields( VALUE #(
          ( name = 'x-csrf-token'           value = lv_token )
          ) ).

          DATA(lv_datetime) = |{ ls_exchange-validitystartdate+0(4) }-{ ls_exchange-validitystartdate+4(2) }-{ ls_exchange-validitystartdate+6(2) }T00:00:00|.
          DATA(lv_query1) = |ExchangeRateType='{ ls_exchange-exchangeratetype }'&SourceCurrency='{ ls_exchange-sourcecurrency }'&TargetCurrency='{ ls_exchange-targetcurrency }'|.
          DATA(lv_query2) = |&ValidityStartDate=datetime'{ lv_datetime }'&ExcRate={ lv_abs }m|.
          CONCATENATE lv_query1 lv_query2 INTO lv_query.
          lo_web_http_req->set_query( query = lv_query ).

          FREE lo_web_http_response.
*          CATCH cx_web_http_client_error.
          lo_web_http_response = lo_web_http_client->execute( if_web_http_client=>post ).
*          CATCH cx_web_http_client_error.
          DATA(lv_response) = lo_web_http_response->get_text( ).
          DATA(ls_status)   = lo_web_http_response->get_status( ).
          lo_web_http_client->close( ).
**        MOVE-CORRESPONDING ls_status TO ls_req_response.
*          MOVE-CORRESPONDING ls_status TO lt_req_response.
          IF ls_status-code NE '200'.
            ls_log-ratetype = ls_exchange-exchangeratetype.
            ls_log-sourcecur = ls_exchange-sourcecurrency.
            ls_log-targetcur = ls_exchange-targetcurrency.
            ls_log-valdate = ls_exchange-validitystartdate.
            ls_log-excrate = ls_exchange-exchangerate.
            ls_log-message = lv_response.

            APPEND ls_log TO lt_log.

          ENDIF.

        ENDLOOP.

        IF lt_log IS NOT INITIAL.
          MODIFY zfi_003_log FROM TABLE @lt_log.
        ENDIF.

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
*            CATCH cx_root INTO DATA(lc_root).
*              DATA(lv_message) = lc_root->get_longtext( ).
*          ENDTRY.
*        ELSE.
**          ls_req_response-message = 'Başarılı'.
**            cs_response-message = 'Başarılı'.
*        ENDIF.

      CATCH cx_http_dest_provider_error INTO DATA(lo_provider_error).
*        ls_req_response-message = lo_provider_error->get_longtext( ).
*        ls_req_response-code    = '400'.
*        ls_req_response-reason  = 'Destination problem.'.
*          cs_response-message = lo_provider_error->get_longtext( ).
*          cs_response-code    = '400'.
*          cs_response-reason  = 'Destination problem.'.

      CATCH cx_web_http_client_error INTO DATA(lo_client_error).
*        ls_req_response-message = lo_client_error->get_longtext( ).
*        ls_req_response-code    = '400'.
*        ls_req_response-reason  = 'Client problem.'.
*          cs_response-message = lo_client_error->get_longtext( ).
*          cs_response-code    = '400'.
*          cs_response-reason  = 'Client problem.'.

    ENDTRY.
  ENDMETHOD.
ENDCLASS.
