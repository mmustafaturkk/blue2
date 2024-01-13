CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.

    TYPES: BEGIN OF ty_header.
             INCLUDE TYPE za_supplierinvoice.
    TYPES:
             _SuplrInvcItemPurOrdRef TYPE TABLE OF za_suplrinvcitempurordref WITH NON-UNIQUE DEFAULT KEY,
*             to_purchaseordernote TYPE TABLE OF za_purchaseordernote WITH EMPTY KEY,
           END OF ty_header.

    DATA: gt_header_pro TYPE STANDARD TABLE OF string,
          gt_item_pro   TYPE STANDARD TABLE OF string.

    TYPES: BEGIN OF ty_errordetails,
             contentid    TYPE string,
             code         TYPE string,
             message      TYPE string,
             longtext_url TYPE string,
             propertyref  TYPE string,
             severity     TYPE string,
             transition   TYPE string,
             target       TYPE string,
           END OF ty_errordetails.

    TYPES: BEGIN OF ty_message,
             lang  TYPE string,
             value TYPE string,
           END OF ty_message.


    TYPES: BEGIN OF ty_application,
             component_id      TYPE string,
             service_namespace TYPE string,
             service_id        TYPE string,
             service_version   TYPE string,
           END OF ty_application.

    TYPES: BEGIN OF ty_error_res,
             sap_transaction TYPE string,
             sap_note        TYPE string,
           END OF ty_error_res.

    TYPES: BEGIN OF ty_innererror,
             application      TYPE ty_application,
             transactionid    TYPE string,
             timestamp        TYPE string,
             error_resolution TYPE ty_error_res,
             longtext_url     TYPE string,
             errordetails     TYPE STANDARD TABLE OF ty_errordetails WITH EMPTY KEY,
           END OF ty_innererror.


    TYPES: BEGIN OF ty_error,
             code       TYPE string,
             message    TYPE ty_message,
             innererror TYPE ty_innererror,
           END OF ty_error.

    TYPES: BEGIN OF ty_error2,
             error TYPE ty_error,
           END OF ty_error2.

    TYPES: BEGIN OF ty_return,
             message TYPE string,
           END OF ty_return.

    DATA: ls_error  TYPE ty_error2,
          lt_return TYPE STANDARD TABLE OF ty_return WITH EMPTY KEY.



  PRIVATE SECTION.

    TYPES: BEGIN OF ty_inputs.
             INCLUDE TYPE zmm_001_s_purch_order_header.
    TYPES:   items TYPE STANDARD TABLE OF zmm_001_s_purch_order_item WITH EMPTY KEY,
           END OF ty_inputs.

    TYPES: BEGIN OF ty_input_inv.
             INCLUDE TYPE zmm_001_s_sup_invoice_header.
    TYPES:   items TYPE STANDARD TABLE OF zmm_001_s_sup_invoice_item WITH EMPTY KEY,
           END OF ty_input_inv.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Header RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE Header.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE Header.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE Header.

    METHODS read FOR READ
      IMPORTING keys FOR READ Header RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK Header.

    METHODS rba_Item FOR READ
      IMPORTING keys_rba FOR READ Header\_Item FULL result_requested RESULT result LINK association_links.

    METHODS cba_Item FOR MODIFY
      IMPORTING entities_cba FOR CREATE Header\_Item.

    METHODS pur FOR MODIFY
      IMPORTING keys FOR ACTION Header~pur.

    METHODS inv FOR MODIFY
      IMPORTING keys FOR ACTION Header~inv.

    METHODS atc FOR MODIFY
      IMPORTING keys FOR ACTION Header~atc.

    METHODS int FOR MODIFY
      IMPORTING keys FOR ACTION Header~int.


ENDCLASS.

CLASS lhc_Header IMPLEMENTATION.

  METHOD get_instance_authorizations.

    READ ENTITIES OF zmm_001_dd_header IN LOCAL MODE
        ENTITY header
           FIELDS ( headeruuid docno )
           WITH CORRESPONDING #( keys )
         RESULT DATA(lt_button)
         FAILED failed.

    result =
       VALUE #( FOR ls_button IN lt_button
         ( %key = ls_button-%key
           %action-pur = COND #( WHEN ls_button-docno IS NOT INITIAL
                                                         THEN if_abap_behv=>fc-o-disabled
                                                         ELSE if_abap_behv=>fc-o-enabled )
                                                         ) ).


  ENDMETHOD.

  METHOD create.
    DATA: ls_create    TYPE zmm_001_t_head,
          lv_timestamp TYPE timestampl.

    GET TIME STAMP FIELD lv_timestamp.
    DATA(generator) = cl_uuid_factory=>create_system_uuid(  ).


    LOOP AT entities INTO DATA(ls_ent).

      TRY.
          ls_create-header_uuid  = generator->create_uuid_x16(  ).
        CATCH cx_uuid_error.
      ENDTRY.
      ls_create-comcode      = ls_ent-comcode .
      ls_create-supplier     = ls_ent-supplier .
      ls_create-pordate      = ls_ent-pordate .
      ls_create-doccur       = ls_ent-doccur .
      ls_create-createdby    = sy-uname .
      ls_create-createdat    = lv_timestamp .

      INSERT VALUE #( %cid = ls_ent-%cid
                      headeruuid = ls_create-header_uuid
                       ) INTO TABLE mapped-header.

      INSERT zmm_001_t_head FROM @ls_create.

      IF sy-subrc EQ 0.

        DATA(lv_msg) = new_message( id = 'ZMM_001_MSG_EXP'
                        number = '001'
                        severity = cl_abap_behv=>ms-success
                        ).

        APPEND VALUE #( %cid = ls_ent-%cid
        headeruuid = ls_create-header_uuid
        %msg = lv_msg ) TO reported-header.

      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD update.

    DATA: lt_update TYPE TABLE OF zmm_001_t_head.

    LOOP AT entities INTO DATA(ls_entity).
      SELECT SINGLE * FROM zmm_001_t_head WHERE header_uuid = @ls_entity-headeruuid INTO @DATA(ls_update).
    ENDLOOP.

    lt_update =
        VALUE #( FOR ls_ent IN entities
               (
                 comcode      = COND #( WHEN ls_ent-comcode IS NOT INITIAL
                                                    THEN ls_ent-comcode
                                                    ELSE ls_update-comcode
                                                     )
                 doccur       = COND #( WHEN ls_ent-doccur IS NOT INITIAL
                                                    THEN ls_ent-doccur
                                                    ELSE ls_update-doccur
                                                     )
                 pordate      = COND #( WHEN ls_ent-pordate IS NOT INITIAL
                                                    THEN ls_ent-pordate
                                                    ELSE ls_update-pordate
                                                     )
                 supplier     = COND #( WHEN ls_ent-supplier IS NOT INITIAL
                                                    THEN ls_ent-supplier
                                                    ELSE ls_update-supplier
                                                     )
                 createdby     = COND #( WHEN ls_ent-createdby IS NOT INITIAL
                                                    THEN ls_ent-createdby
                                                    ELSE ls_update-createdby
                                                     )
                 createdat     = COND #( WHEN ls_ent-createdat IS NOT INITIAL
                                                    THEN ls_ent-createdat
                                                    ELSE ls_update-createdat
                                                     )
                 docno        = COND #( WHEN ls_ent-docno IS NOT INITIAL
                                                    THEN ls_ent-docno
                                                    ELSE ls_update-docno
                                                     )
                 header_uuid  = ls_ent-headeruuid
                                                           ) ).

    UPDATE zmm_001_t_head FROM TABLE @lt_update.

  ENDMETHOD.

  METHOD delete.
    LOOP AT keys INTO DATA(ls_keys).
      DELETE FROM zmm_001_t_head WHERE header_uuid = @ls_keys-headeruuid.
    ENDLOOP.
  ENDMETHOD.

  METHOD read.

    SELECT * FROM zmm_001_dd_header
    FOR ALL ENTRIES IN @keys
    WHERE headeruuid = @keys-headeruuid
    INTO CORRESPONDING FIELDS OF TABLE @result.

  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_item.
  ENDMETHOD.

  METHOD cba_item.

    DATA: ls_item TYPE zmm_001_t_item.
    DATA(generator) = cl_uuid_factory=>create_system_uuid(  ).

    LOOP AT entities_cba ASSIGNING FIELD-SYMBOL(<fs_cba>).
      LOOP AT <fs_cba>-%target INTO DATA(ls_cba).

        ls_item-header_uuid = <fs_cba>-headeruuid .
        TRY.
            ls_item-item_uuid   = generator->create_uuid_x16(  ). .
          CATCH cx_uuid_error.
        ENDTRY.
        ls_item-matgr       = ls_cba-matgr .
        ls_item-netpr       = ls_cba-netpr .
        ls_item-plant       = ls_cba-plant .
        ls_item-poritex     = ls_cba-poritex .
        ls_item-wbsel       = ls_cba-wbsel.
        ls_item-currcode    = ls_cba-Currcode .

        "Pass data back to UI
        INSERT VALUE #( %cid = ls_cba-%cid
                        itemuuid = ls_item-item_uuid
                      ) INTO  TABLE mapped-item.

        INSERT VALUE #( %cid = ls_cba-%cid
                        headeruuid = <fs_cba>-headeruuid
                      ) INTO  TABLE mapped-header.

        INSERT zmm_001_t_item FROM @ls_item.

        IF sy-subrc EQ 0.

          DATA(lv_msg) = new_message( id = 'ZMM_001_MSG_EXP'
                          number = '001'
                          severity = cl_abap_behv=>ms-success
                          ).

          APPEND VALUE #( %cid = ls_cba-%cid
          itemuuid = ls_item-item_uuid
          %msg = lv_msg ) TO reported-item.

        ENDIF.

      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.

  METHOD pur.
    TYPES: tt_soi_deep_create TYPE STANDARD TABLE OF za_purchaseorderitem048d29431d WITH NON-UNIQUE DEFAULT KEY.
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
      ls_req                  TYPE ty_inputs,
      lt_return               TYPE STANDARD TABLE OF ty_return WITH EMPTY KEY,
      lv_po_number            TYPE ty_s_deep_create-purchaseorder.

    SELECT *
    FROM zmm_001_t_head
    FOR ALL ENTRIES IN @keys
    WHERE header_uuid = @keys-headeruuid
    INTO TABLE @DATA(lt_header).

    SELECT *
    FROM zmm_001_t_item
    FOR ALL ENTRIES IN @keys
    WHERE header_uuid = @keys-headeruuid
    INTO TABLE @DATA(lt_item).

    READ TABLE lt_header INTO DATA(ls_header) INDEX 1.
    IF sy-subrc EQ 0.
      MOVE-CORRESPONDING ls_header TO ls_req.
    ENDIF.

    MOVE-CORRESPONDING lt_item TO ls_req-items.

    DATA(lo_run) = NEW zmm_001_cl_call_purchase_order( input = ls_req ).

*    lo_run->run(
*      IMPORTING
*        ev_po_number = lv_po_number
*      CHANGING
*        ct_return    = lt_return
*    ).

    IF lv_po_number IS NOT INITIAL.

      ls_header-docno = lv_po_number.
*      MODIFY zmm_001_t_head FROM @ls_header.
      IF sy-subrc EQ 0.
        DATA(lv_msg) = new_message( id = 'ZMM_001_MSG_EXP'
                          number = '001'
                          severity = cl_abap_behv=>ms-success
                          ).

        APPEND VALUE #( headeruuid = ls_header-header_uuid
        %msg = lv_msg ) TO reported-header.

      ENDIF.
    ELSE.

      LOOP AT lt_return INTO DATA(ls_return).

        APPEND VALUE #( headeruuid = ls_header-header_uuid
        %msg = new_message_with_text(
                 severity = if_abap_behv_message=>severity-error
                 text     = ls_return-message
               ) ) TO reported-header.

      ENDLOOP.

    ENDIF.

*////////////////////////////////////////////////////////////////////////////////////////////////
*////////////////////////////////////////////////////////////////////////////////////////////////
*////////////////////////////////////////////////////////////////////////////////////////////////
*////////////////////////////////////////////////////////////////////////////////////////////////
*////////////////////////////////////////////////////////////////////////////////////////////////
*////////////////////////////////////////////////////////////////////////////////////////////////
*    TRY.
*        DATA(lo_mail) = cl_bcs_mail_message=>create_instance( ).
*        lo_mail->set_sender('mustafa.turk@nttdata.com').
*        lo_mail->add_recipient('ahmetfaruk.koseoglu@nttdata.com').
**        lo_mail->add_recipient( iv_address = 'ahmetfaruk.koseoglu@bs.nttdata.com' iv_copy = cl_bcs_mail_message=>cc ).
*        lo_mail->set_subject('Test Mail').
*        lo_mail->set_main( cl_bcs_mail_textpart=>create_instance(
*          iv_content      = '<h1>Hello</h1><p>This is a test mail.</p>'
*          iv_content_type = 'text/html'
*        ) ).
**        lo_mail->add_attachment( cl_bcs_mail_textpart=>create_instance(
**          iv_content      = 'This is a text attachment'
**          iv_content_type = 'text/plain'
**          iv_filename     = 'Text_Attachment.txt'
**        ) ).
*        lo_mail->send( IMPORTING et_status = DATA(lt_status) ).
*      CATCH cx_bcs_mail INTO DATA(lx_mail).
*    ENDTRY.



  ENDMETHOD.


  METHOD inv.


    DATA:
      ls_business_data        TYPE ty_header,
      ls_business_data_return TYPE ty_header,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      ls_req                  TYPE ty_input_inv,
      lt_return               TYPE STANDARD TABLE OF ty_return WITH EMPTY KEY,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lv_error                TYPE fkk_intf_char1.

    SELECT *
    FROM zmm_001_t_head
    FOR ALL ENTRIES IN @keys
    WHERE header_uuid = @keys-headeruuid
    INTO TABLE @DATA(lt_header).

    SELECT *
    FROM zmm_001_t_item
    FOR ALL ENTRIES IN @keys
    WHERE header_uuid = @keys-headeruuid
    INTO TABLE @DATA(lt_item).

    READ TABLE lt_header INTO DATA(ls_header) INDEX 1.
    IF sy-subrc EQ 0.
      MOVE-CORRESPONDING ls_header TO ls_req.
    ENDIF.

    MOVE-CORRESPONDING lt_item TO ls_req-items.

    DATA(lo_run) = NEW zmm_001_cl_call_sup_invoice( ).
    DATA(lv_type) = 'INV'.
    lo_run->create_invoice(
      IMPORTING
        es_req   = ls_req
        ev_type  = lv_type
      CHANGING
        ct_return = lt_return
        cv_error  = lv_error
    ).
    READ TABLE lt_return INDEX 1 INTO DATA(ls_return).

    IF lv_error IS INITIAL.
      APPEND VALUE #( headeruuid = ls_header-header_uuid
      %msg = new_message_with_text(
               severity = if_abap_behv_message=>severity-success
               text     = ls_return-message
             ) ) TO reported-header.
    ELSE.
      APPEND VALUE #( headeruuid = ls_header-header_uuid
      %msg = new_message_with_text(
               severity = if_abap_behv_message=>severity-error
               text     = ls_return-message
             ) ) TO reported-header.
    ENDIF.


  ENDMETHOD.

  METHOD atc.

    DATA:
      ls_business_data TYPE zattachmentcontentset,
      lo_http_client   TYPE REF TO if_web_http_client,
      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request       TYPE REF TO /iwbep/if_cp_request_create,
      lo_response      TYPE REF TO /iwbep/if_cp_response_create.


    TRY.
        " Create http client
*        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
*                                                     comm_scenario  = 'ZMM_001_CS_EXPENSE'
*                                                     comm_system_id = 'ZMM_001_CS_EXP'
*                                                     service_id     = 'ZMM_001_OBS_EXPENSE_REST' ).
*        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

        DATA(lo_http_destination) =
     cl_http_destination_provider=>create_by_url( 'https://my406905-api.s4hana.cloud.sap/sap/opu/odata/sap/API_CV_ATTACHMENT_SRV/AttachmentContentSet' ).
        "alternatively create HTTP destination via destination service
        "cl_http_destination_provider=>create_by_cloud_destination( i_name = '<...>'
        "                            i_service_instance_name = '<...>' )

        DATA(lo_web_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_http_destination ) .
        DATA(lo_web_http_req2) = lo_web_http_client->get_http_request( ).
        lo_web_http_req2->set_header_fields( VALUE #(
        ( name = 'x-csrf-token' value = 'fetch' )
        ) ).

        DATA lv_token TYPE string.
        DATA: lv_username TYPE string,
              lv_pass     TYPE string.
##NEEDED
        lv_username = 'ZCOMUSER'.
        lv_pass = 'PWUmQnbHX+NBlFRwgjrxvUfNlioLtoHmqyVvkr8o'.

        lo_web_http_req2->set_authorization_basic(
          EXPORTING
            i_username = lv_username
            i_password = lv_pass
*          RECEIVING
*            r_value    =
        ).

        DATA(lo_web_http_response2) = lo_web_http_client->execute( if_web_http_client=>get ).
        lv_token = lo_web_http_response2->get_header_field(
          EXPORTING
            i_name  = 'x-csrf-token'
        ).
*        CATCH cx_web_message_error.

        DATA(lo_web_http_req) = lo_web_http_client->get_http_request( ).
        lo_web_http_req->set_header_fields( VALUE #(
        ( name = 'slug' value = 'berk.png' )
        ( name = 'Content' value = 'C:\Users\10124294\Downloads\berk.png' )
        ( name = 'Content-Type' value = 'image/png' )
        ( name = 'BusinessObjectTypeName' value = 'BUS2012' )
        ( name = 'LinkedSAPObjectKey' value = '4700000055' )
        ( name = 'x-csrf-token' value = lv_token )
        ) ).

*        CATCH cx_web_message_error.

        DATA lv_data TYPE string.

        lo_web_http_req->set_authorization_basic(
          EXPORTING
            i_username = lv_username
            i_password = lv_pass
*          RECEIVING
*            r_value    =
        ).

        lv_data = 'iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAIAAAD91JpzAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAARSURBVBhXY3growJEYEpGBQAkHgS13mWMCAAAAABJRU5ErkJggg=='.

        DATA: utility  TYPE REF TO cl_web_http_utility,
              lv_data2 TYPE xstring.
        CREATE OBJECT utility.

        lv_data2 = utility->decode_x_base64( encoded = lv_data ).
*        lo_web_http_req->set_binary(
*          EXPORTING
*            i_data   = lv_data
**            i_offset = 0
**            i_length = -1
**          RECEIVING
**            r_value  =
*        ).

*        lo_web_http_req->set_formfield_encoding( formfield_encoding = lo_web_http_req->co_formfield_encoding_raw ).

*        DATA(lo_part) = lo_web_http_req->add_multipart( ).
*        lo_part->set_header_field(
*          EXPORTING
*            i_name  = 'content-disposition'
*            i_value = 'form-data;name="file";filename="berk.png"'
**           RECEIVING
**             r_value =
*        ).
*
*        lo_part->set_header_field(
*          EXPORTING
*            i_name  = 'content-type'
*            i_value = 'image/png'
**           RECEIVING
**             r_value =
*        ).


        DATA(lv_len) = xstrlen( lv_data2 ).
        lo_web_http_req->set_binary(
          EXPORTING
            i_data   = lv_data2
            i_offset = 0
            i_length = lv_len
*           RECEIVING
*             r_value  =
        ).
*         CATCH cx_web_message_error.
*        lo_part->set_binary(
*          EXPORTING
*            i_data   = lv_data2
*            i_offset = 0
*            i_length = lv_len
**          RECEIVING
**            r_value  =
*        ).
*        CATCH cx_web_message_error.
*        CATCH cx_web_message_error.
*         CATCH cx_web_message_error.
*         CATCH cx_web_message_error.


*        CATCH cx_web_message_error.
*        CATCH cx_web_message_error.


*        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
*          EXPORTING
*            iv_service_definition_name = 'ZMM_001_SC_ATTACHMENT'
*            io_http_client             = lo_web_http_client
*            iv_relative_service_root   = '/sap/opu/odata/sap/API_CV_ATTACHMENT_SRV/AttachmentContentSet' ).
*
*        ASSERT lo_web_http_client IS BOUND.

* Prepare business data
*        ls_business_data = VALUE #(
*                  documentinforecorddoctype     = 'GOS'
*                  documentinforecorddocnumber   = 'EXT48000000000140'
*                  documentinforecorddocversion  = '00'
*                  documentinforecorddocpart     = '000'
*                  logicaldocument               = '37A4C6332DD81EEEA2EE61D0755FB90F'
*                  archivedocumentid             = '37A4C6332DD81EEEA2EE61D0755FD90F'
*                  linkedsapobjectkey            = '4700000055'
*                  businessobjecttypename        = 'BUS2012'
*                  semanticobject                = ''
*                  workstationapplication        = ''
*                  filesize                      = '28760'
*                  filename                      = 'berk.pdf'
*                  documenturl                   = ''
*                  mimetype                      = '*/*'
*                  content                       = ''
*                  createdbyuser                 = 'CC0000000002'
*                  createdbyuserfullname         = 'CC0000000002'
*                  creationdatetime              = 20170101123000
*                  businessobjecttype            = 'BUS2012'
*                  lastchangedbyuser             = 'CC0000000002'
*                  lastchangedbyuserfullname     = 'CC0000000002'
*                  changeddatetime               = 20170101123000
*                  storagecategory               = ''
*                  archivelinkrepository         = ''
*                  sapobjecttype                 = ''
*                  sapobjectnodetype             = ''
*                  harmonizeddocumenttype        = ''
*                  attachmentdeletionisallowed   = abap_true
*                  attachmentrenameisallowed     = abap_false
*                  source                        = 'GOS'
*                  attachmentcontenthash         = ''
*                  ).

        " Navigate to the resource and create a request for the create operation
*        lo_request = lo_client_proxy->create_resource_for_entity_set( 'ATTACHMENTCONTENTSET' )->create_request_for_create( ).
*
*        " Set the business data for the created entity
*        lo_request->set_business_data( ls_business_data ).
*
*        " Execute the request
*        lo_response = lo_request->execute( ).

        DATA(lo_web_http_response) = lo_web_http_client->execute( if_web_http_client=>post ).
        DATA(lv_response) = lo_web_http_response->get_text( ).
        DATA(lv_code) = lo_web_http_response->get_status( ).

        " Get the after image
*lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).


      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception

      CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
        " Handle Exception
        RAISE SHORTDUMP lx_web_http_client_error.
      CATCH cx_http_dest_provider_error INTO DATA(lx_http_dest_provider_error).
        " Handle Exception
    ENDTRY.

  ENDMETHOD.

  METHOD int.

    DATA:
      ls_business_data        TYPE ty_header,
      ls_business_data_return TYPE ty_header,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      ls_req                  TYPE ty_input_inv,
      lt_return               TYPE STANDARD TABLE OF ty_return WITH EMPTY KEY,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lv_error                TYPE zmm_000_de_char1.

    SELECT *
    FROM zmm_001_t_head
    FOR ALL ENTRIES IN @keys
    WHERE header_uuid = @keys-headeruuid
    INTO TABLE @DATA(lt_header).

    SELECT *
    FROM zmm_001_t_item
    FOR ALL ENTRIES IN @keys
    WHERE header_uuid = @keys-headeruuid
    INTO TABLE @DATA(lt_item).

    READ TABLE lt_header INTO DATA(ls_header) INDEX 1.
    IF sy-subrc EQ 0.
      MOVE-CORRESPONDING ls_header TO ls_req.
    ENDIF.

    MOVE-CORRESPONDING lt_item TO ls_req-items.

    DATA(lo_run) = NEW zmm_001_cl_call_sup_invoice( ).
    DATA(lv_type) = 'INT'.
    lo_run->create_invoice(
      IMPORTING
        es_req   = ls_req
        ev_type  = lv_type
      CHANGING
        ct_return = lt_return
        cv_error  = lv_error
    ).
    READ TABLE lt_return INDEX 1 INTO DATA(ls_return).

    IF lv_error IS INITIAL.
      APPEND VALUE #( headeruuid = ls_header-header_uuid
      %msg = new_message_with_text(
               severity = if_abap_behv_message=>severity-success
               text     = ls_return-message
             ) ) TO reported-header.
    ELSE.
      APPEND VALUE #( headeruuid = ls_header-header_uuid
      %msg = new_message_with_text(
               severity = if_abap_behv_message=>severity-error
               text     = ls_return-message
             ) ) TO reported-header.
    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_Item DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE Item.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE Item.

    METHODS read FOR READ
      IMPORTING keys FOR READ Item RESULT result.

    METHODS rba_Header FOR READ
      IMPORTING keys_rba FOR READ Item\_Header FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_Item IMPLEMENTATION.

  METHOD update.

    DATA: lt_update TYPE TABLE OF zmm_001_t_item.

    LOOP AT entities INTO DATA(ls_entity).
      SELECT SINGLE * FROM zmm_001_t_item WHERE item_uuid = @ls_entity-itemuuid INTO @DATA(ls_update).
    ENDLOOP.

    lt_update =
        VALUE #( FOR ls_ent IN entities
               (
                 matgr    = COND #( WHEN ls_ent-matgr IS NOT INITIAL
                                                    THEN ls_ent-matgr
                                                    ELSE ls_update-matgr
                                                     )
                 netpr    = COND #( WHEN ls_ent-netpr IS NOT INITIAL
                                                    THEN ls_ent-netpr
                                                    ELSE ls_update-netpr
                                                     )
                 plant    = COND #( WHEN ls_ent-plant IS NOT INITIAL
                                                    THEN ls_ent-plant
                                                    ELSE ls_update-plant
                                                     )
                 poritex  = COND #( WHEN ls_ent-poritex IS NOT INITIAL
                                                    THEN ls_ent-poritex
                                                    ELSE ls_update-poritex
                                                     )
                 wbsel    = COND #( WHEN ls_ent-wbsel IS NOT INITIAL
                                                    THEN ls_ent-wbsel
                                                    ELSE ls_update-wbsel
                                                     )
                 currcode = COND #( WHEN ls_ent-Currcode IS NOT INITIAL
                                                    THEN ls_ent-Currcode
                                                    ELSE ls_update-currcode
                                                     )
                 item_uuid   = ls_update-item_uuid
                 header_uuid = ls_update-header_uuid
                                                     ) ).

    UPDATE zmm_001_t_item FROM TABLE @lt_update.


  ENDMETHOD.

  METHOD delete.

    LOOP AT keys INTO DATA(ls_keys).
      DELETE FROM zmm_001_t_item WHERE item_uuid = @ls_keys-itemuuid.
    ENDLOOP.

  ENDMETHOD.

  METHOD read.

    SELECT * FROM zmm_001_dd_item
    FOR ALL ENTRIES IN @keys
    WHERE itemuuid = @keys-itemuuid
    INTO CORRESPONDING FIELDS OF TABLE @result.

  ENDMETHOD.

  METHOD rba_header.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZMM_001_DD_HEADER DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZMM_001_DD_HEADER IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
