CLASS lhc_zfi_001_alw_header2 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zfi_001_alw_header2 RESULT result.
    METHODS jount FOR MODIFY
      IMPORTING keys FOR ACTION zfi_001_alw_header2~jount.
    METHODS att FOR MODIFY
      IMPORTING keys FOR ACTION zfi_001_alw_header2~att.

ENDCLASS.

CLASS lhc_zfi_001_alw_header2 IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD jount.
    SELECT *
        FROM zfi_001_alw_h2
        FOR ALL ENTRIES IN @keys
        WHERE id = @keys-id
        INTO TABLE @DATA(lt_header).

    SELECT *
    FROM zfi_001_alw_i2
    FOR ALL ENTRIES IN @keys
    WHERE id = @keys-id
    INTO TABLE @DATA(lt_items).

    READ TABLE lt_header INTO DATA(ls_header) INDEX 1.


    TRY.
        DATA(destination) = cl_soap_destination_provider=>create_by_comm_arrangement(
          comm_scenario  = 'ZFI_001_CS_ALLOWANCE'
*     service_id     = '<outbound service>'
*     comm_system_id = '<communication system identifier>'
        ).

        DATA(proxy) = NEW zco_journal_entry_create_reque( destination = destination ).

        DATA: lt_item           TYPE zjournal_entry_create_req_tab3,
              lt_debtor         TYPE zjournal_entry_create_req_tab4,
              lt_producttaxitem TYPE zjournal_entry_create_req_tab2,
              lt_req            TYPE zjournal_entry_create_requ_tab,
              lt_creditor       TYPE zjournal_entry_create_req_tab5.

        SELECT MAX( refdocitem )
        FROM zfi_001_alw_i2
        WHERE id = @ls_header-id
        INTO @DATA(lv_refdocitem).




        LOOP AT lt_items INTO DATA(ls_items).
          IF ls_items-debcrecode = 'H'.
            DATA(ls_item) = VALUE zjournal_entry_create_request9( reference_document_item = |{ lv_refdocitem  }|
                                                                  glaccount = VALUE zchart_of_accounts_item_code( content = ls_items-glacc )
                                                                  amount_in_transaction_currency = VALUE zamount( currency_code = ls_items-currcode
                                                                                                                  content       = -1 * ls_items-amnintracur )
                                                                  debit_credit_code = ls_items-debcrecode
                                                                  document_item_text = ls_items-docitemtext
                                                                  tax = VALUE zjournal_entry_create_request2( tax_code = VALUE zproduct_taxation_characteris1( content = ls_items-taxcode ) )
                                                                  account_assignment = VALUE zjournal_entry_create_request8( profit_center = ls_items-profitcenter
                                                                                                                             cost_center = ls_items-costcenter
                                                                                                                             segment = ls_items-segment
                                                                                                                             functional_area = ls_items-funcarea )
                                                                  value_date = ls_items-valdate
                                                                  house_bank = ls_items-housebank
                                                                  house_bank_account = ls_items-housebankacc
*                                                                profitability_supplement = VALUE zjournal_entry_create_request6( customer = ls_st-profitabilitysupplement-customer )
                                                                   ).

            APPEND ls_item TO lt_item.
            CLEAR ls_item.
          ELSEIF ls_items-debcrecode = 'S'.

            SELECT SINGLE amnintracur
            FROM zfi_001_alw_i2 AS item
            WHERE id = @ls_items-id
            INTO @DATA(lv_tax).
            SELECT SINGLE *
            FROM zfi_001_t_vat
            WHERE rate = @ls_header-comcode
            INTO @DATA(ls_taxes).
            IF ls_items-taxcode = 'A0'.
              DATA(lv_taxrate) = ( ls_taxes-a0 / 100 ) * lv_tax.
            ELSEIF ls_items-taxcode = 'A1'.
              lv_taxrate = ( ls_taxes-a1 / 100 ) * lv_tax.
            ELSEIF ls_items-taxcode = 'A2'.
              lv_taxrate = ( ls_taxes-a2 / 100 ) * lv_tax.
            ELSEIF ls_items-taxcode = 'A3'.
              lv_taxrate = ( ls_taxes-a3 / 100 ) * lv_tax.
            ELSEIF ls_items-taxcode = 'A4'.
              lv_taxrate = ( ls_taxes-a4 / 100 ) * lv_tax.
            ENDIF.

            ""Bu kod geçici, modülcü ile konuşulduktan sonra düzenlenecek.
            ls_item = VALUE zjournal_entry_create_request9( reference_document_item = |{ lv_refdocitem  }|
                                                                  glaccount = VALUE zchart_of_accounts_item_code( content = ls_items-glacc )
                                                                  amount_in_transaction_currency = VALUE zamount( currency_code = ls_items-currcode
                                                                                                                  content       = ls_items-amnintracur )
                                                                  debit_credit_code = ls_items-debcrecode
                                                                  document_item_text = ls_items-docitemtext
                                                                  value_date = ls_items-valdate
                                                                  house_bank = ls_items-housebank
                                                                  house_bank_account = ls_items-housebankacc
*                                                                profitability_supplement = VALUE zjournal_entry_create_request6( customer = ls_st-profitabilitysupplement-customer )
                                                                   ).

            APPEND ls_item TO lt_item.

            DATA(ls_producttaxitem) = VALUE zjournal_entry_create_request3( tax_code = VALUE zproduct_taxation_characteris1( content = ls_items-taxcode )
                                                                            tax_item_classification = 'MWS' "ls_items-taxclas
                                                                            condition_type = 'MWAS' "ls_items-contype
                                                                            amount_in_transaction_currency = VALUE zamount( currency_code = ls_items-currcode
                                                                                                                            content       = 0 )
                                                                            debit_credit_code = ls_items-debcrecode
                                                                            tax_base_amount_in_trans_crcy = VALUE zamount( currency_code = ls_items-currcode
                                                                                                                            content      = lv_taxrate
                                                                                                                            )
                                                                            is_direct_tax_posting = 'X' ).

            APPEND ls_producttaxitem TO lt_producttaxitem.
            CLEAR:ls_producttaxitem, ls_item.
          ENDIF.
        ENDLOOP.


        DATA(ls_req1) = VALUE zjournal_entry_create_reques18( company_code = ls_header-comcode
                                                              original_reference_document_ty = 'BKPFF' "hardcode
                                                              business_transaction_type = 'RFBU' "hardcode
                                                              accounting_document_type = 'SA' "hardcode
                                                              created_by_user = sy-uname
                                                              document_date = ls_header-docdate
                                                              posting_date  = ls_header-pastdate
                                                              tax_determination_date = ls_header-taxdetdate
*                                                              reference1in_document_header = ls_req-reference1indocumentheader
*                                                              reference2in_document_header = ls_req-reference2indocumentheader
*                                                              document_header_text = ls_req-documentheadertext
*                                                              document_reference_id = ls_req-documentreferenceid
                                                              item = lt_item
*                                                              debtor_item = lt_debtor
*                                                              creditor_item = lt_creditor
                                                              product_tax_item = lt_producttaxitem
                                                              ).
        DATA: lv_tstamp TYPE timestamp.

        GET TIME STAMP FIELD lv_tstamp.
        DATA(ls_msg_head) = VALUE zbusiness_document_message_he2( creation_date_time = lv_tstamp ).

        DATA(ls_req2) = VALUE zjournal_entry_create_request( journal_entry = ls_req1
                                                             message_header = ls_msg_head ).

        APPEND ls_req2 TO lt_req.


        DATA(ls_req3) = VALUE zjournal_entry_create_reques19( journal_entry_create_request = lt_req
                                                              message_header = ls_msg_head ).

        " fill request
        DATA(request2) = VALUE zjournal_entry_bulk_create_req( journal_entry_bulk_create_requ = ls_req3 ).
        " fill request
*        DATA(request) = VALUE zjournal_entry_bulk_create_req( ).

        proxy->journal_entry_create_request_c(
          EXPORTING
            input = request2
          IMPORTING
            output = DATA(response2)
        ).

        " handle response
      CATCH cx_soap_destination_error INTO DATA(lo_error).
        " handle error
*        es_response-response_code = 500.
*        APPEND INITIAL LINE TO es_response-response_messages ASSIGNING FIELD-SYMBOL(<lfs_message>).
*        <lfs_message>-message = 'Soap Destination Error'.
      CATCH cx_ai_system_fault INTO DATA(lt_data2).
*        es_response-response_code = 500.
*        APPEND INITIAL LINE TO es_response-response_messages ASSIGNING <lfs_message>.
*        <lfs_message>-message = 'System Fault'.
        " handle error

    ENDTRY.

    LOOP AT response2-journal_entry_bulk_create_conf-journal_entry_create_confirmat INTO DATA(ls_confirmation).
      DATA(lv_docno) = ls_confirmation-journal_entry_create_confirmat-accounting_document.
    ENDLOOP.

    IF lv_docno IS NOT INITIAL.

      ls_header-docno = lv_docno.
      MODIFY zfi_001_alw_h2 FROM @ls_header.
      IF sy-subrc EQ 0.

        DATA(lv_msg) = new_message( id = 'ZFI_001_MC_ALLOWANCE'
                          number = '001'
                          severity = cl_abap_behv=>ms-success
                          ).

        APPEND VALUE #( id = ls_header-id
        %msg = lv_msg ) TO reported-zfi_001_alw_header2.
      ENDIF.

    ELSE.
      lv_msg = new_message( id = 'ZFI_001_MC_ALLOWANCE'
                        number = '002'
                        severity = cl_abap_behv=>ms-error
                        ).

      APPEND VALUE #( id = ls_header-id
      %msg = lv_msg ) TO reported-zfi_001_alw_header2.
    ENDIF.
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
    DATA: ls_response  TYPE  ty_handle_response,
          lv_filename  TYPE zmm_001_s_attachment_req-attachment_name,
          lv_xstring   TYPE zmm_001_s_attachment_req-content,
          lv_docno_c14 TYPE zmm_001_s_attachment_req-document_no.
    DATA(lv_year) = ls_header-pastdate+0(4).
    lv_docno_c14  = ls_header-docno.
    lv_filename   = ls_header-filename.
    lv_xstring    = ls_header-attachment.
    DATA(lo_attachment) = NEW zcl_mm_001_attachment(  ).
*    CONCATENATE ls_header-docno lv_year INTO lv_docno_c14.
data: lv_content type zmm_001_s_attachment_req-content.
      lv_content = ls_header-attachment.
    lo_attachment->attachment(
      EXPORTING
        iv_busobjecttype   = 'BKPF'
        iv_docno           = 'RO0101000000602023'
        iv_attachment_name = lv_filename
*        iv_xstring         = lv_xstring
        iv_xstring         = CONV zmm_001_s_attachment_req-content( lv_content )
      CHANGING
        cs_response        = ls_response
    ).

  ENDMETHOD.

  METHOD att.
    SELECT *
        FROM zfi_001_alw_h2
        FOR ALL ENTRIES IN @keys
        WHERE id = @keys-id
        INTO TABLE @DATA(lt_header).

    READ TABLE lt_header INTO DATA(ls_header) INDEX 1.

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
    DATA: ls_response  TYPE  ty_handle_response,
          lv_filename  TYPE zmm_001_s_attachment_req-attachment_name,
          lv_xstring   TYPE zmm_001_s_attachment_req-content,
          lv_docno_c14 TYPE zmm_001_s_attachment_req-document_no.
    DATA(lv_year) = ls_header-pastdate+0(4).
    lv_docno_c14  = ls_header-docno.
    lv_filename   = ls_header-filename.
    lv_xstring    = ls_header-attachment.
    DATA(lo_attachment) = NEW zcl_mm_001_attachment(  ).
*    CONCATENATE ls_header-docno lv_year INTO lv_docno_c14.

data: lv_content type zmm_001_s_attachment_req-content.
      lv_content = ls_header-attachment.
    lo_attachment->attachment(
      EXPORTING
        iv_busobjecttype   = 'BUS2012'
        iv_docno           = '4700000223'
        iv_attachment_name = lv_filename
*        iv_xstring         = lv_xstring
        iv_xstring         = CONV zmm_001_s_attachment_req-content( lv_content )
      CHANGING
        cs_response        = ls_response
    ).
  ENDMETHOD.

ENDCLASS.
