CLASS zmm_001_cl_expense DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_scheduleline.
             INCLUDE TYPE za_purchaseorderscheb308d03b57.
    TYPES:
             _subcontractingcomponent TYPE TABLE OF za_posubcontractingc226d8f53d3 WITH NON-UNIQUE DEFAULT KEY,
           END OF ty_scheduleline.

    TYPES: BEGIN OF ty_item.
             INCLUDE TYPE za_purchaseorderitem048d29431d.
    TYPES:
*             to_purchaseorder               TYPE TABLE OF za_purchaseorder WITH EMPTY KEY,
             _accountassignment           TYPE TABLE OF za_purordaccountassi4e03172050 WITH NON-UNIQUE DEFAULT KEY,
*             _purchaseorderitemnote       TYPE TABLE OF za_purchaseorderitemnote WITH NON-UNIQUE DEFAULT KEY,
             _purchaseorderpricingelement TYPE TABLE OF za_purordpricingelem581be44894 WITH NON-UNIQUE DEFAULT KEY,
             _scheduleline                TYPE TABLE OF ty_scheduleline WITH NON-UNIQUE DEFAULT KEY,
           END OF ty_item.

    TYPES: BEGIN OF ty_header.
             INCLUDE TYPE za_purchaseordereb04c73093.
    TYPES:
             _purchaseorderitem TYPE TABLE OF ty_item WITH NON-UNIQUE DEFAULT KEY,
*             to_purchaseordernote TYPE TABLE OF za_purchaseordernote WITH EMPTY KEY,
           END OF ty_header.

    TYPES: BEGIN OF ty_input.
             INCLUDE TYPE zmm_001_s_expense_header.
    TYPES:   items TYPE STANDARD TABLE OF zmm_001_s_expense_item WITH EMPTY KEY,
           END OF ty_input.

    TYPES: BEGIN OF ty_header_inv.
             INCLUDE TYPE za_supplierinvoice.
    TYPES:
             _suplrinvcitempurordref TYPE TABLE OF za_suplrinvcitempurordref WITH NON-UNIQUE DEFAULT KEY,
*             to_purchaseordernote TYPE TABLE OF za_purchaseordernote WITH EMPTY KEY,
           END OF ty_header_inv.

    TYPES: BEGIN OF ty_header_int.
             INCLUDE TYPE za_supplierinvoice.
    TYPES:
             _supplierinvoiceitemglacct TYPE TABLE OF za_supplierinvoiceitemglacct WITH NON-UNIQUE DEFAULT KEY,
*             to_purchaseordernote TYPE TABLE OF za_purchaseordernote WITH EMPTY KEY,
           END OF ty_header_int.

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

    TYPES: BEGIN OF ty_return,
             message TYPE string,
           END OF ty_return.

    DATA: ls_error  TYPE ty_error2,
          lt_return TYPE STANDARD TABLE OF ty_return WITH EMPTY KEY.

    METHODS : constructor
      IMPORTING
        !input TYPE ty_input,

      create_property_inv,
      create_property_int,

      create_po
        EXPORTING
          ev_po_number TYPE ty_header-purchaseorder
        CHANGING
          ct_return    LIKE lt_return,

      create_property_po,

      create_invoice
        IMPORTING
          iv_po_number      TYPE ty_header-purchaseorder
        EXPORTING
          ev_invoice_number TYPE ty_header-purchaseorder
        CHANGING
          ct_return         LIKE lt_return.

    DATA: gs_input            TYPE ty_input,
          gt_header_pro       TYPE STANDARD TABLE OF string,
          gt_item_pro         TYPE STANDARD TABLE OF string,
          gt_header_item      TYPE STANDARD TABLE OF string,
          gt_order_note       TYPE STANDARD TABLE OF string,
          gt_schedule_line    TYPE STANDARD TABLE OF string,
          gt_account_assign   TYPE STANDARD TABLE OF string,
          gt_item_note        TYPE STANDARD TABLE OF string,
          gt_pricing_element  TYPE STANDARD TABLE OF string,
          gt_subcontract_comp TYPE STANDARD TABLE OF string,
          gv_po_docno         TYPE char10.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmm_001_cl_expense IMPLEMENTATION.
  METHOD constructor.

    gs_input = !input.

  ENDMETHOD.

  METHOD create_invoice.

    DATA:
      ls_business_data         TYPE ty_header_inv,
      ls_business_data_return  TYPE ty_header_inv,
      ls_business_data2        TYPE ty_header_int,
      ls_business_data_return2 TYPE ty_header_int,
      lo_http_client           TYPE REF TO if_web_http_client,
      lo_client_proxy          TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request               TYPE REF TO /iwbep/if_cp_request_create,
      ls_req                   TYPE ty_input,
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

*        DATA: lv_total TYPE zmm_001_de_total.
        DATA: lv_total TYPE za_supplierinvoice-invoicegrossamount.

*        LOOP AT gs_input-items INTO DATA(ls_itemtotal).
*          lv_total = ls_itemtotal-netpr + lv_total.
*        ENDLOOP.




*        IF gs_input-type = 'INV'.
*          "Prepare business data
*          DATA(lv_pur_ord_date) = |{ gs_input-pordate }110000|.
*
*          ls_business_data = VALUE #(
*                    companycode                     = 'RO01'
*                    documentdate                    = lv_pur_ord_date
*                    postingdate                     = lv_pur_ord_date
*                    supplierinvoiceidbyinvcgparty   = gs_input-supplier
*                    documentcurrency                = gs_input-doccur
*                    invoicegrossamount              = lv_total
*                    paymentterms                    = '0001'
*                    accountingdocumenttype          = 'ER'
*                    supplierinvoicestatus           = '5'
*                    taxdeterminationdate            = lv_pur_ord_date
*                    paymentblockingreason           = 'A'
*                    ).
*
*          LOOP AT gs_input-items INTO DATA(ls_item).
*
*            APPEND INITIAL LINE TO ls_business_data-_suplrinvcitempurordref ASSIGNING FIELD-SYMBOL(<lfs_item>).
*            <lfs_item>-supplierinvoiceitem = sy-tabix.
*            <lfs_item>-purchaseorder = gv_po_docno.
*            <lfs_item>-purchaseorderitem = |{ sy-tabix }0|.
*            <lfs_item>-documentcurrency = gs_input-doccur.
*            <lfs_item>-supplierinvoiceitemamount = ls_item-netpr.
*            <lfs_item>-taxcode = 'V0'.
*            <lfs_item>-purchaseorderquantityunit = 'ST'.
*            <lfs_item>-quantityinpurchaseorderunit = '1'.
**            <lfs_item>-sup = '50000086' .
*
*
*          ENDLOOP.

*        ELSEIF gs_input-type = 'INT'.



        DATA(lv_pur_ord_date) = |{ gs_input-zdate }110000|.

        ls_business_data2 = VALUE #(
                  companycode                     = gs_input-comcode
                  documentdate                    = lv_pur_ord_date
                  postingdate                     = lv_pur_ord_date
                  supplierinvoiceidbyinvcgparty   = gs_input-empid
*                  documentcurrency                = gs_input-doccur
*                  invoicegrossamount              = lv_total
                  paymentterms                    = '0001'
                  accountingdocumenttype          = 'ER'
                  supplierinvoicestatus           = 'A'
                  taxdeterminationdate            = lv_pur_ord_date
                  invoicingparty                  = gs_input-empid
                  paymentblockingreason           = 'A'
                  ).




        LOOP AT gs_input-items INTO DATA(ls_items) GROUP BY ls_items-itemcur.

          CLEAR: ls_business_data2-_supplierinvoiceitemglacct.

          LOOP AT GROUP ls_items INTO DATA(ls_item).
            ls_business_data2-documentcurrency = ls_item-itemcur.

            APPEND INITIAL LINE TO ls_business_data2-_supplierinvoiceitemglacct ASSIGNING FIELD-SYMBOL(<lfs_item2>).
            <lfs_item2>-supplierinvoiceitem = sy-tabix .
*            <lfs_item2>-costcenter = 'RO015010'.
            <lfs_item2>-companycode =  gs_input-comcode.

            IF ls_item-exptype = 'EXP001'.
              <lfs_item2>-glaccount = '54000001' .
            ELSEIF ls_item-exptype = 'EXP002'.
              <lfs_item2>-glaccount = '54000002' .
            ELSEIF ls_item-exptype = 'EXP003'.
              <lfs_item2>-glaccount = '54000003' .
            ELSEIF ls_item-exptype = 'EXP004'.
              <lfs_item2>-glaccount = '54000004' .
            ELSEIF ls_item-exptype = 'EXP005'.
              <lfs_item2>-glaccount = '54000005' .
            ELSEIF ls_item-exptype = 'EXP006'.
              <lfs_item2>-glaccount = '54000006' .
            ELSEIF ls_item-exptype = 'EXP007'.
              <lfs_item2>-glaccount = '54000007' .
            ELSEIF ls_item-exptype = 'EXP008'.
              <lfs_item2>-glaccount = '54000008' .
            ELSEIF ls_item-exptype = 'EXP009'.
              <lfs_item2>-glaccount = '54000009' .
            ELSEIF ls_item-exptype = 'EXP010'.
              <lfs_item2>-glaccount = '54000010' .
            ELSEIF ls_item-exptype = 'EXP011'.
              <lfs_item2>-glaccount = '54000011' .
            ELSEIF ls_item-exptype = 'EXP012'.
              <lfs_item2>-glaccount = '54000012' .
            ELSEIF ls_item-exptype = 'EXP013'.
              <lfs_item2>-glaccount = '54000013' .
            ELSEIF ls_item-exptype = 'EXP014'.
              <lfs_item2>-glaccount = '54000014' .
            ELSEIF ls_item-exptype = 'EXP015'.
              <lfs_item2>-glaccount = '59200000' .
            ENDIF.
            SELECT SINGLE supplier, addresssearchterm1
            FROM zmm_001_dd_supplier
            WHERE supplier = @gs_input-empid
            INTO @DATA(ls_personel).
            <lfs_item2>-wbselement = ls_item-wbsel .
*            <lfs_item2>-documentcurrency = gs_input-doccur .
            <lfs_item2>-documentcurrency = ls_item-itemcur .
            IF ls_item-itemcur EQ 'HUF'.
              ls_item-netpr = ls_item-netpr * 10 .
            ENDIF.
            <lfs_item2>-supplierinvoiceitemamount = ls_item-netpr .
            <lfs_item2>-taxcode = 'V0' .
            <lfs_item2>-personnelnumber = ls_personel-addresssearchterm1 .
            <lfs_item2>-debitcreditcode = 'S' .
            <lfs_item2>-supplierinvoiceitemtext = ls_item-itex.
            <lfs_item2>-costcenter = ''.
            <lfs_item2>-assignmentreference = ls_item-recipentno.

            lv_total = lv_total + ls_item-netpr.
          ENDLOOP.


          IF ls_item-itemcur = 'HUF'.
            lv_total = lv_total * 10 .
          ENDIF.
          ls_business_data2-invoicegrossamount = lv_total.
          CLEAR: lv_total.

*                  endif.
*        IF gs_input-type = 'INV'.
*          me->create_property_inv( ).
*        ELSEIF gs_input-type = 'INT'.
          me->create_property_int( ).
*        ENDIF.

          " Navigate to the resource and create a request for the create operation
          lo_request = lo_client_proxy->create_resource_for_entity_set( 'A_SUPPLIERINVOICE' )->create_request_for_create( ).

          DATA(lo_data_description_node) = lo_request->create_data_descripton_node( ).
          lo_data_description_node->set_properties( gt_header_pro  ).
*        IF gs_input-type = 'INV'.
*          DATA(lo_item_child) = lo_data_description_node->add_child( '_SUPLRINVCITEMPURORDREF' ).
*        ELSEIF gs_input-type = 'INT'.
          DATA(lo_item_child) = lo_data_description_node->add_child( '_SUPPLIERINVOICEITEMGLACCT' ).
*        ENDIF.
          lo_item_child->set_properties( gt_item_pro ).


          " Set the business data for the created entity
*        lo_request->set_business_data( ls_business_data ).
*        IF gs_input-type = 'INV'.
*          lo_request->set_deep_business_data( is_business_data = ls_business_data
*                                              io_data_description = lo_data_description_node ).
*        ELSEIF gs_input-type = 'INT'.

          lo_request->set_deep_business_data( is_business_data = ls_business_data2
                                              io_data_description = lo_data_description_node ).
*        ENDIF.

          " Execute the request
*        lo_response = lo_request->execute( ).
*        IF gs_input-type = 'INV'.
*          lo_request->execute( )->get_business_data( IMPORTING es_business_data = ls_business_data_return ).
*        ELSEIF gs_input-type = 'INT'.
          lo_request->execute( )->get_business_data( IMPORTING es_business_data = ls_business_data_return2 ).
*        ENDIF.
          lo_request->check_execution( ).
          FREE lo_request.
        ENDLOOP.

*        LOOP AT gs_input-items INTO DATA(ls_item).
*
*          APPEND INITIAL LINE TO ls_business_data2-_supplierinvoiceitemglacct ASSIGNING FIELD-SYMBOL(<lfs_item2>).
*          <lfs_item2>-supplierinvoiceitem = sy-tabix .
**            <lfs_item2>-costcenter = 'RO015010'.
*          <lfs_item2>-companycode =  gs_input-comcode.
*
*          IF ls_item-exptype = 'EXP001'.
*            <lfs_item2>-glaccount = '54000001' .
*          ELSEIF ls_item-exptype = 'EXP002'.
*            <lfs_item2>-glaccount = '54000002' .
*          ELSEIF ls_item-exptype = 'EXP003'.
*            <lfs_item2>-glaccount = '54000003' .
*          ELSEIF ls_item-exptype = 'EXP004'.
*            <lfs_item2>-glaccount = '54000004' .
*          ELSEIF ls_item-exptype = 'EXP005'.
*            <lfs_item2>-glaccount = '54000005' .
*          ELSEIF ls_item-exptype = 'EXP006'.
*            <lfs_item2>-glaccount = '54000006' .
*          ELSEIF ls_item-exptype = 'EXP007'.
*            <lfs_item2>-glaccount = '54000007' .
*          ELSEIF ls_item-exptype = 'EXP008'.
*            <lfs_item2>-glaccount = '54000008' .
*          ELSEIF ls_item-exptype = 'EXP009'.
*            <lfs_item2>-glaccount = '54000009' .
*          ELSEIF ls_item-exptype = 'EXP010'.
*            <lfs_item2>-glaccount = '54000010' .
*          ELSEIF ls_item-exptype = 'EXP011'.
*            <lfs_item2>-glaccount = '54000011' .
*          ELSEIF ls_item-exptype = 'EXP012'.
*            <lfs_item2>-glaccount = '54000012' .
*          ELSEIF ls_item-exptype = 'EXP013'.
*            <lfs_item2>-glaccount = '54000013' .
*          ELSEIF ls_item-exptype = 'EXP014'.
*            <lfs_item2>-glaccount = '54000014' .
*          ELSEIF ls_item-exptype = 'EXP015'.
*            <lfs_item2>-glaccount = '59200000' .
*          ENDIF.
*          SELECT SINGLE supplier, addresssearchterm1
*          FROM zmm_001_dd_supplier
*          WHERE supplier = @gs_input-empid
*          INTO @DATA(ls_personel).
*          <lfs_item2>-wbselement = ls_item-wbsel .
*          <lfs_item2>-documentcurrency = gs_input-doccur .
*          IF gs_input-doccur EQ 'HUF'.
*            ls_item-netpr = ls_item-netpr * 10 .
*          ENDIF.
*          <lfs_item2>-supplierinvoiceitemamount = ls_item-netpr .
*          <lfs_item2>-taxcode = 'V0' .
*          <lfs_item2>-personnelnumber = ls_personel-addresssearchterm1 .
*          <lfs_item2>-debitcreditcode = 'S' .
*          <lfs_item2>-supplierinvoiceitemtext = ls_item-itex.
*          <lfs_item2>-costcenter = ''.
*
*        ENDLOOP.





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
      CATCH cx_http_dest_provider_error  INTO DATA(lx_http_dest_provider_error).
        " Handle Exception
*        RAISE SHORTDUMP lx_web_http_client_error.
        DATA(lv_message4) = lx_http_dest_provider_error->get_longtext( ).

        APPEND INITIAL LINE TO ct_return ASSIGNING <lfs_return>.
        <lfs_return>-message = lv_message4.
        lv_errorflag = 'X'.
    ENDTRY.

    IF lv_errorflag IS INITIAL.
      APPEND INITIAL LINE TO ct_return ASSIGNING <lfs_return>.
*      IF gs_input-type = 'INV'.
*        <lfs_return>-message = |Invoice succesfully created with number: { ls_business_data_return-supplierinvoice }|.
*        ev_invoice_number    = ls_business_data_return-supplierinvoice.
*      ELSEIF gs_input-type = 'INT'.
      <lfs_return>-message = |Invoice succesfully created with number: { ls_business_data_return2-supplierinvoice }|.
      ev_invoice_number    = ls_business_data_return2-supplierinvoice.
    ENDIF.

  ENDMETHOD.

  METHOD create_property_int.

    CLEAR: gt_header_pro,gt_item_pro.

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
    APPEND 'PAYMENTBLOCKINGREASON' TO gt_header_pro.

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
    APPEND 'SUPPLIERINVOICEITEMTEXT' TO gt_item_pro.
    APPEND 'COSTCENTER' TO gt_item_pro.
    APPEND 'ASSIGNMENTREFERENCE' TO gt_item_pro.


  ENDMETHOD.

  METHOD create_property_inv.

    CLEAR: gt_header_pro,gt_item_pro.

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
    APPEND 'PAYMENTBLOCKINGREASON' TO gt_header_pro.

    APPEND 'SUPPLIERINVOICEITEM' TO gt_item_pro.
    APPEND 'PURCHASEORDER' TO gt_item_pro.
    APPEND 'PURCHASEORDERITEM' TO gt_item_pro.
    APPEND 'DOCUMENTCURRENCY' TO gt_item_pro.
    APPEND 'SUPPLIERINVOICEITEMAMOUNT' TO gt_item_pro.
    APPEND 'TAXCODE' TO gt_item_pro.
    APPEND 'PURCHASEORDERQUANTITYUNIT' TO gt_item_pro.
    APPEND 'QUANTITYINPURCHASEORDERUNIT' TO gt_item_pro.

  ENDMETHOD.

  METHOD create_po.

    DATA:
      ls_business_data        TYPE ty_header,
      ls_business_data_return TYPE ty_header,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create.

    TRY.
        " Create http client
        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
                                              comm_scenario  = 'ZMM_001_CS_EXPENSE'
                                              comm_system_id = 'ZMM_001_CS_EXP'
                                              service_id     = 'ZMM_001_OBS_EXPENSE_REST'
        ).


        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
          EXPORTING
            iv_service_definition_name = 'ZMM_001_SC_PURCH_EXPENSE'
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/API_PURCHASEORDER_PROCESS_SRV' ).

        ASSERT lo_http_client IS BOUND.

        create_property_po( ).
        DATA(lv_pur_ord_date) = |{ gs_input-zdate }110000|.
* Prepare business data
        ls_business_data = VALUE #(
                  companycode                     = gs_input-comcode
                  purchaseordertype               = 'ZEXP'
                  supplier                        = gs_input-empid
                  language                        = 'EN'
                  purchasingorganization          = gs_input-comcode "'BLUE'
                  purchasinggroup                 = 'CGS'
                  purchaseorderdate               = lv_pur_ord_date
*                  documentcurrency                = gs_input-doccur


*                  creationdate                    = lv_pur_ord_date "gs_input-createdat
*                  lastchangedatetime              = lv_pur_ord_date "gs_input-createdat
*                  cashdiscount1days               = '0'
*                  cashdiscount2days               = '0'
*                  netpaymentdays                  = '0'
*                  cashdiscount1percent            = '0'
*                  cashdiscount2percent            = '0'
*                  exchangerateisfixed             = abap_true
*                  validitystartdate               = lv_pur_ord_date
*                  validityenddate                 = 20301231235959
*                  purchasingcompletenessstatus    = abap_true
                   ).

        SELECT SINGLE plant
        FROM i_plant AS plant
        WHERE defaultpurchasingorganization = @gs_input-comcode
        INTO @DATA(lv_plant).

        LOOP AT gs_input-items INTO DATA(ls_item).
          ls_business_data-documentcurrency = ls_item-itemcur.

          APPEND INITIAL LINE TO ls_business_data-_purchaseorderitem ASSIGNING FIELD-SYMBOL(<fs_purchase_item>).

          <fs_purchase_item>-purchaseorderitemtext = ls_item-itex.
          <fs_purchase_item>-plant = lv_plant.
          <fs_purchase_item>-materialgroup = ls_item-exptype.
          <fs_purchase_item>-orderquantity = 1.
          <fs_purchase_item>-purchaseorderquantityunit = 'ST'. "PC ve PCE seklinde calismiyor
          <fs_purchase_item>-netpriceamount = ls_item-netpr.
          <fs_purchase_item>-netpricequantity = '1'.
          <fs_purchase_item>-taxcode = ls_item-vat.
          <fs_purchase_item>-accountassignmentcategory = 'P'.
          <fs_purchase_item>-goodsreceiptisexpected = abap_false.
          <fs_purchase_item>-goodsreceiptisnonvaluated = abap_false.
          <fs_purchase_item>-invoiceisexpected = abap_true.
          <fs_purchase_item>-invoiceisgoodsreceiptbased = abap_false.
          <fs_purchase_item>-documentcurrency = ls_item-itemcur.

          <fs_purchase_item>-orderpriceunittoorderunitnmrtr = '1'.
          <fs_purchase_item>-ordpriceunittoorderunitdnmntr = '1'.
          <fs_purchase_item>-taxdeterminationdate = lv_pur_ord_date.
          <fs_purchase_item>-priceistobeprinted = abap_true.
          <fs_purchase_item>-overdelivtolrtdlmtratioinpct = '0'.
          <fs_purchase_item>-unlimitedoverdeliveryisallowed = abap_true.
          <fs_purchase_item>-iscompletelydelivered = abap_true.
          <fs_purchase_item>-isfinallyinvoiced = abap_true.
          <fs_purchase_item>-supplierissubcontractor = abap_false.
          <fs_purchase_item>-itemnetweight = '0'.
          <fs_purchase_item>-itemvolume = '0'.
          <fs_purchase_item>-evaldrcptsettlmtisallowed = abap_false.
          <fs_purchase_item>-isreturnsitem = abap_false.
          <fs_purchase_item>-expectedoveralllimitamount = '0'.
          <fs_purchase_item>-overalllimitamount = '0'.
          <fs_purchase_item>-purchasingitemisfreeofcharge = abap_false.
          <fs_purchase_item>-downpaymentpercentageoftotamt = '0'.
          <fs_purchase_item>-downpaymentamount = '0'.
          <fs_purchase_item>-downpaymentduedate = lv_pur_ord_date.
          <fs_purchase_item>-br_isproducedinhouse = abap_false.

          APPEND INITIAL LINE TO <fs_purchase_item>-_accountassignment ASSIGNING FIELD-SYMBOL(<fs_acc_asign>).

          <fs_acc_asign>-wbselement = ls_item-wbsel.

          APPEND INITIAL LINE TO <fs_purchase_item>-_purchaseorderpricingelement ASSIGNING FIELD-SYMBOL(<fs_pricing>).

          <fs_pricing>-conditiontype = 'PMP0'.
          <fs_pricing>-conditionratevalue = ls_item-netpr .
          <fs_pricing>-conditioncurrency = ls_item-itemcur.
          <fs_pricing>-conditionquantity = '1'.
          <fs_pricing>-conditiontobaseqtynmrtr = '0'.
          <fs_pricing>-conditiontobaseqtydnmntr = '0'.


        ENDLOOP.


        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'A_PURCHASEORDER' )->create_request_for_create( ).

        DATA(lo_data_description_node) = lo_request->create_data_descripton_node( ).
        lo_data_description_node->set_properties( gt_header_pro  ).
        DATA(lo_item_child) = lo_data_description_node->add_child( '_PURCHASEORDERITEM' ).
        lo_item_child->set_properties( gt_header_item ).
        DATA(lo_acc_assign) = lo_item_child->add_child( '_ACCOUNTASSIGNMENT' ).
        lo_acc_assign->set_properties( gt_account_assign ).
*        DATA(lo_schedule_line) = lo_item_child->add_child( '_SCHEDULELINE' ).
*        lo_schedule_line->set_properties( gt_schedule_line ).
*        DATA(lo_sub_contract) = lo_schedule_line->add_child( '_SUBCONTRACTINGCOMPONENT' ).
*        lo_sub_contract->set_properties( gt_subcontract_comp ).
        DATA(lo_pricing_element) = lo_item_child->add_child( '_PURCHASEORDERPRICINGELEMENT' ).
        lo_pricing_element->set_properties( gt_pricing_element ).

        " Set the business data for the created entity
*        lo_request->set_business_data( is_business_data = ls_business_data ).
        lo_request->set_deep_business_data( is_business_data = ls_business_data
                                            io_data_description = lo_data_description_node ).

        " Execute the request
        lo_request->execute( )->get_business_data( IMPORTING es_business_data = ls_business_data_return ).
        lo_request->check_execution( ).
* lo_response = lo_request->execute( ).

        " Get the after image
*lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        xco_cp_json=>data->from_string( lx_remote->http_error_body )->apply( VALUE #(
          ( xco_cp_json=>transformation->pascal_case_to_underscore )
        ) )->write_to( REF #( ls_error ) ).

        LOOP AT ls_error-error-innererror-errordetails INTO DATA(ls_errordetails).
          APPEND INITIAL LINE TO ct_return ASSIGNING FIELD-SYMBOL(<lfs_return>).
          <lfs_return>-message = ls_errordetails-message.
        ENDLOOP.
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection


      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        DATA(lv_message2) = lx_gateway->get_longtext( ).

        APPEND INITIAL LINE TO ct_return ASSIGNING <lfs_return>.
        <lfs_return>-message = lv_message2.
*        lx_gateway->
        " Handle Exception

      CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
        DATA(lv_message3) = lx_web_http_client_error->get_longtext( ).

        APPEND INITIAL LINE TO ct_return ASSIGNING <lfs_return>.
        <lfs_return>-message = lv_message3.

        " Handle Exception
        RAISE SHORTDUMP lx_web_http_client_error.

    ENDTRY.

    IF ls_business_data_return-purchaseorder IS NOT INITIAL.
      ev_po_number = ls_business_data_return-purchaseorder.
    ENDIF.

  ENDMETHOD.

  METHOD create_property_po.
*        APPEND 'PURCHASEORDER' TO  gt_header_pro.
    APPEND 'COMPANYCODE' TO gt_header_pro.
    APPEND 'PURCHASEORDERTYPE' TO gt_header_pro.
    APPEND 'CREATIONDATE' TO gt_header_pro.
    APPEND 'LASTCHANGEDATETIME' TO gt_header_pro.
    APPEND 'SUPPLIER' TO gt_header_pro.
    APPEND 'LANGUAGE' TO gt_header_pro.
    APPEND 'CASHDISCOUNT1DAYS' TO gt_header_pro.
    APPEND 'CASHDISCOUNT2DAYS' TO gt_header_pro.
    APPEND 'NETPAYMENTDAYS' TO gt_header_pro.
    APPEND 'CASHDISCOUNT1PERCENT' TO gt_header_pro.
    APPEND 'CASHDISCOUNT2PERCENT' TO gt_header_pro.
    APPEND 'PURCHASINGORGANIZATION' TO gt_header_pro.
    APPEND 'PURCHASINGGROUP' TO gt_header_pro.
    APPEND 'PURCHASEORDERDATE' TO gt_header_pro.
    APPEND 'EXCHANGERATEISFIXED' TO gt_header_pro.
    APPEND 'VALIDITYSTARTDATE' TO gt_header_pro.
    APPEND 'VALIDITYENDDATE' TO gt_header_pro.
    APPEND 'PURCHASINGCOMPLETENESSSTATUS' TO gt_header_pro.

*        APPEND 'PURCHASEORDER' TO gt_header_item.
*        APPEND 'PURCHASEORDERITEM' TO gt_header_item.
    APPEND 'PURCHASEORDERITEMTEXT' TO gt_header_item.
    APPEND 'PLANT' TO gt_header_item.
    APPEND 'MATERIALGROUP' TO gt_header_item.
    APPEND 'ORDERQUANTITY' TO gt_header_item.
    APPEND 'PURCHASEORDERQUANTITYUNIT' TO gt_header_item.
    APPEND 'ORDERPRICEUNITTOORDERUNITNMRTR' TO gt_header_item.
    APPEND 'ORDPRICEUNITTOORDERUNITDNMNTR' TO gt_header_item.
    APPEND 'NETPRICEAMOUNT' TO gt_header_item.
    APPEND 'NETPRICEQUANTITY' TO gt_header_item.
    APPEND 'TAXCODE' TO gt_header_item.
    APPEND 'TAXDETERMINATIONDATE' TO gt_header_item.
    APPEND 'PRICEISTOBEPRINTED' TO gt_header_item.
    APPEND 'OVERDELIVTOLRTDLMTRATIOINPCT' TO gt_header_item.
    APPEND 'UNLIMITEDOVERDELIVERYISALLOWED' TO gt_header_item.
    APPEND 'ISCOMPLETELYDELIVERED' TO gt_header_item.
    APPEND 'ISFINALLYINVOICED' TO gt_header_item.
    APPEND 'ACCOUNTASSIGNMENTCATEGORY' TO gt_header_item.
    APPEND 'GOODSRECEIPTISEXPECTED' TO gt_header_item.
    APPEND 'GOODSRECEIPTISNONVALUATED' TO gt_header_item.
    APPEND 'INVOICEISEXPECTED' TO gt_header_item.
    APPEND 'INVOICEISGOODSRECEIPTBASED' TO gt_header_item.
    APPEND 'SUPPLIERISSUBCONTRACTOR' TO gt_header_item.
    APPEND 'ITEMNETWEIGHT' TO gt_header_item.
    APPEND 'ITEMVOLUME' TO gt_header_item.
    APPEND 'EVALDRCPTSETTLMTISALLOWED' TO gt_header_item.
    APPEND 'ISRETURNSITEM' TO gt_header_item.
    APPEND 'EXPECTEDOVERALLLIMITAMOUNT' TO gt_header_item.
    APPEND 'OVERALLLIMITAMOUNT' TO gt_header_item.
    APPEND 'PURCHASINGITEMISFREEOFCHARGE' TO gt_header_item.
    APPEND 'DOWNPAYMENTPERCENTAGEOFTOTAMT' TO gt_header_item.
    APPEND 'DOWNPAYMENTAMOUNT' TO gt_header_item.
    APPEND 'DOWNPAYMENTDUEDATE' TO gt_header_item.
    APPEND 'BR_ISPRODUCEDINHOUSE' TO gt_header_item.
    APPEND 'DOCUMENTCURRENCY' TO gt_header_item.

    APPEND 'QUANTITY' TO gt_account_assign.
    APPEND 'MULTIPLEACCTASSGMTDISTRPERCENT' TO gt_account_assign.
    APPEND 'PURGDOCNETAMOUNT' TO gt_account_assign.
    APPEND 'WBSELEMENT' TO gt_account_assign.
    APPEND 'SETTLEMENTREFERENCEDATE' TO gt_account_assign.

    APPEND 'CONDITIONTYPE' TO gt_pricing_element.
    APPEND 'CONDITIONRATEVALUE' TO gt_pricing_element.
    APPEND 'CONDITIONCURRENCY' TO gt_pricing_element.
    APPEND 'CONDITIONQUANTITY' TO gt_pricing_element.
    APPEND 'CONDITIONTOBASEQTYNMRTR' TO gt_pricing_element.
    APPEND 'CONDITIONTOBASEQTYDNMNTR' TO gt_pricing_element.


    APPEND 'SCHEDULELINEDELIVERYDATE' TO gt_schedule_line.
    APPEND 'SCHEDULELINEORDERQUANTITY' TO gt_schedule_line.
    APPEND 'SCHEDULELINEDELIVERYTIME' TO gt_schedule_line.
    APPEND 'SCHEDLINESTSCDELIVERYDATE' TO gt_schedule_line.
    APPEND 'SCHEDULELINECOMMITTEDQUANTITY' TO gt_schedule_line.
    APPEND 'PERFORMANCEPERIODSTARTDATE' TO gt_schedule_line.
    APPEND 'PERFORMANCEPERIODENDDATE' TO gt_schedule_line.

    APPEND 'REQUIREMENTDATE' TO gt_subcontract_comp.
    APPEND 'QUANTITYINENTRYUNIT' TO gt_subcontract_comp.
  ENDMETHOD.
ENDCLASS.
