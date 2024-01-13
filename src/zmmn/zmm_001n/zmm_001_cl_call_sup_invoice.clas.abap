CLASS zmm_001_cl_call_sup_invoice DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF ty_header.
             INCLUDE TYPE za_supplierinvoice.
    TYPES:
             _SuplrInvcItemPurOrdRef TYPE TABLE OF za_suplrinvcitempurordref WITH NON-UNIQUE DEFAULT KEY,
*             to_purchaseordernote TYPE TABLE OF za_purchaseordernote WITH EMPTY KEY,
           END OF ty_header.

    TYPES: BEGIN OF ty_header2.
             INCLUDE TYPE za_supplierinvoice.
    TYPES:
             _SupplierInvoiceItemGLAcct TYPE TABLE OF za_supplierinvoiceitemglacct WITH NON-UNIQUE DEFAULT KEY,
*             to_purchaseordernote TYPE TABLE OF za_purchaseordernote WITH EMPTY KEY,
           END OF ty_header2.

    TYPES: BEGIN OF ty_input_inv.
             INCLUDE TYPE zmm_001_s_sup_invoice_header.
    TYPES:   items TYPE STANDARD TABLE OF zmm_001_s_sup_invoice_item WITH EMPTY KEY,
           END OF ty_input_inv.

    TYPES: BEGIN OF ty_return,
             message TYPE string,
           END OF ty_return.

    "ERROR RETURN TABLE TYPES
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
    TYPES: BEGIN OF ty_error_res,
             sap_transaction TYPE string,
             sap_note        TYPE string,
           END OF ty_error_res.
    TYPES: BEGIN OF ty_application,
             component_id      TYPE string,
             service_namespace TYPE string,
             service_id        TYPE string,
             service_version   TYPE string,
           END OF ty_application.
    TYPES: BEGIN OF ty_innererror,
             application      TYPE ty_application,
             transactionid    TYPE string,
             timestamp        TYPE string,
             error_resolution TYPE ty_error_res,
             longtext_url     TYPE string,
             errordetails     TYPE STANDARD TABLE OF ty_errordetails WITH EMPTY KEY,
           END OF ty_innererror.
    TYPES: BEGIN OF ty_message,
             lang  TYPE string,
             value TYPE string,
           END OF ty_message.
    TYPES: BEGIN OF ty_error,
             code       TYPE string,
             message    TYPE ty_message,
             innererror TYPE ty_innererror,
           END OF ty_error.
    TYPES: BEGIN OF ty_error2,
             error TYPE ty_error,
           END OF ty_error2.


    DATA: ls_error  TYPE ty_error2.
    DATA lt_return TYPE STANDARD TABLE OF ty_return WITH EMPTY KEY.
    DATA: gt_header_pro TYPE STANDARD TABLE OF string,
          gt_item_pro   TYPE STANDARD TABLE OF string.


    METHODS:
      create_invoice
        EXPORTING
          es_req    TYPE ty_input_inv
          ev_type   TYPE zmm_000_de_char3
        CHANGING
          ct_return LIKE lt_return
          cv_error  TYPE zmm_000_de_char1.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmm_001_cl_call_sup_invoice IMPLEMENTATION.


  METHOD create_invoice.
    DATA:
      ls_business_data         TYPE ty_header,
      ls_business_data_return  TYPE ty_header,
      ls_business_data2        TYPE ty_header2,
      ls_business_data_return2 TYPE ty_header2,
      lo_http_client           TYPE REF TO if_web_http_client,
      lo_client_proxy          TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request               TYPE REF TO /iwbep/if_cp_request_create,
      ls_req                   TYPE ty_input_inv,
      lt_return                TYPE STANDARD TABLE OF ty_return WITH EMPTY KEY,
      lo_response              TYPE REF TO /iwbep/if_cp_response_create,
      lv_errorflag             TYPE zmm_000_de_char1.
    TRY.
        " Create http client
        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
                                                     comm_scenario  = 'ZMM_001_CS_EXPENSE'
                                                     comm_system_id = 'ZMM_001_CS_EXP'
                                                     service_id     = 'ZMM_001_OBS_EXPENSE_REST' ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
          EXPORTING
            iv_service_definition_name = 'ZMM_001_SC_INVOICE'
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/API_SUPPLIERINVOICE_PROCESS_SRV' ).

        ASSERT lo_http_client IS BOUND.

        DATA: lv_total TYPE zmm_001_de_total.

        LOOP AT es_req-items INTO DATA(ls_itemtotal).
          lv_total = ls_itemtotal-netpr + lv_total.
        ENDLOOP.



        IF ev_type = 'INV'.
          "Prepare business data
          DATA(lv_pur_ord_date) = |{ es_req-pordate }110000|.

          ls_business_data = VALUE #(
                    companycode                     = 'RO01'
                    documentdate                    = lv_pur_ord_date
                    postingdate                     = lv_pur_ord_date
                    supplierinvoiceidbyinvcgparty   = es_req-supplier
                    documentcurrency                = es_req-doccur
                    invoicegrossamount              = lv_total
                    paymentterms                    = '0001'
                    accountingdocumenttype          = 'ER'
                    supplierinvoicestatus           = 'D'
                    taxdeterminationdate            = lv_pur_ord_date
                    ).

          LOOP AT es_req-items INTO DATA(ls_item).

            APPEND INITIAL LINE TO ls_business_data-_suplrinvcitempurordref ASSIGNING FIELD-SYMBOL(<lfs_item>).
            <lfs_item>-SupplierInvoiceItem = sy-tabix.
            <lfs_item>-PurchaseOrder = es_req-docno.
            <lfs_item>-PurchaseOrderItem = |{ sy-tabix }0|.
            <lfs_item>-DocumentCurrency = es_req-doccur.
            <lfs_item>-SupplierInvoiceItemAmount = ls_item-netpr.
            <lfs_item>-TaxCode = 'V0'.
            <lfs_item>-PurchaseOrderQuantityUnit = 'ST'.
            <lfs_item>-QuantityInPurchaseOrderUnit = '1'.

          ENDLOOP.

        ELSEIF ev_type = 'INT'.

          lv_pur_ord_date = |{ es_req-pordate }110000|.

          ls_business_data2 = VALUE #(
                    companycode                     = 'RO02'
                    documentdate                    = lv_pur_ord_date
                    postingdate                     = lv_pur_ord_date
                    supplierinvoiceidbyinvcgparty   = es_req-supplier
                    documentcurrency                = es_req-doccur
                    invoicegrossamount              = lv_total
                    paymentterms                    = '0001'
                    accountingdocumenttype          = 'ER'
                    supplierinvoicestatus           = 'D'
                    taxdeterminationdate            = lv_pur_ord_date
                    InvoicingParty                  = es_req-supplier
                    ).

          LOOP AT es_req-items INTO ls_item.

            APPEND INITIAL LINE TO ls_business_data2-_supplierinvoiceitemglacct ASSIGNING FIELD-SYMBOL(<lfs_item2>).
            <lfs_item2>-SupplierInvoiceItem = sy-tabix .
            <lfs_item2>-CostCenter = 'RO015010'.
            <lfs_item2>-CompanyCode =  es_req-comcode.
            <lfs_item2>-GLAccount = '54000002' .
            <lfs_item2>-WBSElement = ls_item-wbsel .
            <lfs_item2>-DocumentCurrency = es_req-doccur .
            <lfs_item2>-SupplierInvoiceItemAmount = ls_item-netpr .
            <lfs_item2>-TaxCode = 'V0' .
            <lfs_item2>-PersonnelNumber = '50000086' .
            <lfs_item2>-DebitCreditCode = 'S' .

          ENDLOOP.



        ENDIF.
        IF ev_type = 'INV'.

          APPEND 'COMPANYCODE' TO gt_header_pro.
          APPEND 'DOCUMENTDATE' TO gt_header_pro.
          APPEND 'POSTINGDATE' TO gt_header_pro.
          APPEND 'SUPPLIERINVOICEIDBYINVCGPARTY' TO gt_header_pro.
          APPEND 'DOCUMENTCURRENCY' TO gt_header_pro.
          APPEND 'INVOICEGROSSAMOUNT' TO gt_header_pro.
          APPEND 'PAYMENTTERMS' TO gt_header_pro.
          APPEND 'ACCOUNTINGDOCUMENTTYPE' TO gt_header_pro.
          APPEND 'SUPPLIERINVOICESTATUS' TO gt_header_pro.
          APPEND 'TAXDETERMINATIONDATE' TO gt_header_pro.

          APPEND 'SUPPLIERINVOICEITEM' TO gt_item_pro.
          APPEND 'PURCHASEORDER' TO gt_item_pro.
          APPEND 'PURCHASEORDERITEM' TO gt_item_pro.
          APPEND 'DOCUMENTCURRENCY' TO gt_item_pro.
          APPEND 'SUPPLIERINVOICEITEMAMOUNT' TO gt_item_pro.
          APPEND 'TAXCODE' TO gt_item_pro.
          APPEND 'PURCHASEORDERQUANTITYUNIT' TO gt_item_pro.
          APPEND 'QUANTITYINPURCHASEORDERUNIT' TO gt_item_pro.

        ELSEIF ev_type = 'INT'.

          APPEND 'COMPANYCODE' TO gt_header_pro.
          APPEND 'DOCUMENTDATE' TO gt_header_pro.
          APPEND 'POSTINGDATE' TO gt_header_pro.
          APPEND 'SUPPLIERINVOICEIDBYINVCGPARTY' TO gt_header_pro.
          APPEND 'DOCUMENTCURRENCY' TO gt_header_pro.
          APPEND 'INVOICEGROSSAMOUNT' TO gt_header_pro.
          APPEND 'PAYMENTTERMS' TO gt_header_pro.
          APPEND 'ACCOUNTINGDOCUMENTTYPE' TO gt_header_pro.
          APPEND 'SUPPLIERINVOICESTATUS' TO gt_header_pro.
          APPEND 'TAXDETERMINATIONDATE' TO gt_header_pro.
          APPEND 'INVOICINGPARTY' TO gt_header_pro.

          APPEND 'SUPPLIERINVOICEITEM' TO gt_item_pro.
          APPEND 'COSTCENTER' TO gt_item_pro.
          APPEND 'COMPANYCODE' TO gt_item_pro.
          APPEND 'GLACCOUNT' TO gt_item_pro.
          APPEND 'WBSELEMENT' TO gt_item_pro.
          APPEND 'DOCUMENTCURRENCY' TO gt_item_pro.
          APPEND 'SUPPLIERINVOICEITEMAMOUNT' TO gt_item_pro.
          APPEND 'TAXCODE' TO gt_item_pro.
          APPEND 'PERSONNELNUMBER' TO gt_item_pro.
          APPEND 'DEBITCREDITCODE' TO gt_item_pro.

        ENDIF.

        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'A_SUPPLIERINVOICE' )->create_request_for_create( ).

        DATA(lo_data_description_node) = lo_request->create_data_descripton_node( ).
        lo_data_description_node->set_properties( gt_header_pro  ).
        IF ev_type = 'INV'.
          DATA(lo_item_child) = lo_data_description_node->add_child( '_SUPLRINVCITEMPURORDREF' ).
        ELSEIF ev_type = 'INT'.
          lo_item_child = lo_data_description_node->add_child( '_SUPPLIERINVOICEITEMGLACCT' ).
        ENDIF.
        lo_item_child->set_properties( gt_item_pro ).

        " Set the business data for the created entity
*        lo_request->set_business_data( ls_business_data ).
        IF ev_type = 'INV'.
          lo_request->set_deep_business_data( is_business_data = ls_business_data
                                              io_data_description = lo_data_description_node ).
        ELSEIF ev_type = 'INT'.

          lo_request->set_deep_business_data( is_business_data = ls_business_data2
                                              io_data_description = lo_data_description_node ).
        ENDIF.

        " Execute the request
*        lo_response = lo_request->execute( ).
        IF ev_type = 'INV'.
          lo_request->execute( )->get_business_data( IMPORTING es_business_data = ls_business_data_return ).
        ELSEIF ev_type = 'INT'.
          lo_request->execute( )->get_business_data( IMPORTING es_business_data = ls_business_data_return2 ).
        ENDIF.
        lo_request->check_execution( ).

        " Get the after image
*        lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection
        xco_cp_json=>data->from_string( lx_remote->http_error_body )->apply( VALUE #(
                  ( xco_cp_json=>transformation->pascal_case_to_underscore )
                ) )->write_to( REF #( ls_error ) ).

        LOOP AT ls_error-error-innererror-errordetails INTO DATA(ls_errordetails).
          APPEND INITIAL LINE TO ct_return ASSIGNING FIELD-SYMBOL(<lfs_return>).
          <lfs_return>-message = ls_errordetails-message.
        ENDLOOP.

        lv_errorflag = 'X'.

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception
        DATA(lv_message2) = lx_gateway->get_longtext( ).

        APPEND INITIAL LINE TO ct_return ASSIGNING <lfs_return>.
        <lfs_return>-message = lv_message2.
        lv_errorflag = 'X'.

      CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
        " Handle Exception
*        RAISE SHORTDUMP lx_web_http_client_error.
        DATA(lv_message3) = lx_web_http_client_error->get_longtext( ).

        APPEND INITIAL LINE TO ct_return ASSIGNING <lfs_return>.
        <lfs_return>-message = lv_message3.
        lv_errorflag = 'X'.

      CATCH cx_http_dest_provider_error INTO DATA(lx_http_dest_provider_error).
        " Handle Exception
*        RAISE SHORTDUMP lx_web_http_client_error.
        DATA(lv_message4) = lx_http_dest_provider_error->get_longtext( ).

        APPEND INITIAL LINE TO ct_return ASSIGNING <lfs_return>.
        <lfs_return>-message = lv_message4.
        lv_errorflag = 'X'.
    ENDTRY.

    DATA: lv_message TYPE bapiret2-message,
          ls_return  TYPE bapiret2.

    CALL FUNCTION 'BAPI_MESSAGE_GETDETAIL'
      EXPORTING
        textformat = 'ASC'
        id         = 'ZMM_001_MSG_EXP'
        number     = '002'
        language   = sy-langu
        message_v1 = CONV bapiret2-message_v1( ls_business_data_return-SupplierInvoice )
      IMPORTING
        message    = lv_message
        return     = ls_return.

    IF lv_errorflag IS INITIAL.
      APPEND INITIAL LINE TO ct_return ASSIGNING <lfs_return>.
      IF ev_type = 'INV'.
*        <lfs_return>-message = |Invoice succesfully created with number: { ls_business_data_return-SupplierInvoice }|.
        <lfs_return>-message = lv_message.
      ELSEIF ev_type = 'INT'.
*        <lfs_return>-message = |Invoice succesfully created with number: { ls_business_data_return2-SupplierInvoice }|.
        <lfs_return>-message = lv_message.
      ENDIF.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
