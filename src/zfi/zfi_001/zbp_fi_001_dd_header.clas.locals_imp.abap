CLASS lhc_header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR header RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE header.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE header.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE header.

    METHODS read FOR READ
      IMPORTING keys FOR READ header RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK header.

    METHODS rba_item FOR READ
      IMPORTING keys_rba FOR READ header\_item FULL result_requested RESULT result LINK association_links.

    METHODS cba_item FOR MODIFY
      IMPORTING entities_cba FOR CREATE header\_item.

    METHODS jount FOR MODIFY
      IMPORTING keys FOR ACTION header~jount.

*    METHODS instance_feature FOR FEATURES
*      IMPORTING keys REQUEST requested_features FOR header RESULT result.

ENDCLASS.

CLASS lhc_header IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
    DATA: ls_create    TYPE zfi_001_t_head,
          lv_timestamp TYPE timestampl.

    GET TIME STAMP FIELD lv_timestamp.
    DATA(generator) = cl_uuid_factory=>create_system_uuid(  ).


    LOOP AT entities INTO DATA(ls_ent).
      TRY.
          ls_create-header_uuid  = generator->create_uuid_x16(  ).
        CATCH cx_uuid_error.
      ENDTRY.
      ls_create-comcode      = ls_ent-comcode .
      ls_create-docdate      = ls_ent-docdate .
      ls_create-pastdate     = ls_ent-pastdate .
      ls_create-taxdetdate   = sy-datum .
      ls_create-createdby    = sy-uname .
      ls_create-createdat    = lv_timestamp .
      ls_create-traexpclaim      = ls_ent-traexpclaim .
      ls_create-traorder      = ls_ent-traorder .
      ls_create-persname      = ls_ent-persname .
      ls_create-positionn      = ls_ent-positionn .
      ls_create-onbustripfor      = ls_ent-onbustripfor .
      ls_create-purtravel1      = ls_ent-purtravel1 .
      ls_create-purtravel2      = ls_ent-purtravel2 .
      ls_create-purtravel3      = ls_ent-purtravel3 .
      ls_create-purtravel4      = ls_ent-purtravel4 .
      ls_create-country1      = ls_ent-country1 .
      ls_create-country2      = ls_ent-country2 .
      ls_create-country3      = ls_ent-country3 .
      ls_create-country4      = ls_ent-country4 .
      ls_create-tradeparture      = ls_ent-tradeparture .
      ls_create-traarrival      = ls_ent-traarrival .
      ls_create-identifiedby      = ls_ent-identifiedby .
      ls_create-signaturedate      = ls_ent-signaturedate .


      INSERT VALUE #( %cid = ls_ent-%cid
                      headeruuid = ls_create-header_uuid
                       ) INTO TABLE mapped-header.

      INSERT zfi_001_t_head FROM @ls_create.

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
    DATA: lt_update TYPE TABLE OF zfi_001_t_head.

    LOOP AT entities INTO DATA(ls_entity).
      SELECT SINGLE * FROM zfi_001_t_head WHERE header_uuid = @ls_entity-headeruuid INTO @DATA(ls_update).
    ENDLOOP.

    lt_update =
        VALUE #( FOR ls_ent IN entities
               (
                 comcode      = COND #( WHEN ls_ent-comcode IS NOT INITIAL
                                                    THEN ls_ent-comcode
                                                    ELSE ls_update-comcode
                                                     )
                 docdate       = COND #( WHEN ls_ent-docdate IS NOT INITIAL
                                                    THEN ls_ent-docdate
                                                    ELSE ls_update-docdate
                                                     )
                 pastdate      = COND #( WHEN ls_ent-pastdate IS NOT INITIAL
                                                    THEN ls_ent-pastdate
                                                    ELSE ls_update-pastdate
                                                     )
                 taxdetdate     = COND #( WHEN ls_ent-taxdetdate IS NOT INITIAL
                                                    THEN ls_ent-taxdetdate
                                                    ELSE ls_update-taxdetdate
                                                     )
                 createdby     = COND #( WHEN ls_ent-createdby IS NOT INITIAL
                                                    THEN ls_ent-createdby
                                                    ELSE ls_update-createdby
                                                     )
                 createdat     = COND #( WHEN ls_ent-createdat IS NOT INITIAL
                                                    THEN ls_ent-createdat
                                                    ELSE ls_update-createdat
                                                     )
                 traexpclaim     = COND #( WHEN ls_ent-traexpclaim IS NOT INITIAL
                                                    THEN ls_ent-traexpclaim
                                                    ELSE ls_update-traexpclaim
                                                     )
                 traorder     = COND #( WHEN ls_ent-traorder IS NOT INITIAL
                                                    THEN ls_ent-traorder
                                                    ELSE ls_update-traorder
                                                     )
                 persname     = COND #( WHEN ls_ent-persname IS NOT INITIAL
                                                    THEN ls_ent-persname
                                                    ELSE ls_update-persname
                                                     )
                 positionn     = COND #( WHEN ls_ent-positionn IS NOT INITIAL
                                                    THEN ls_ent-positionn
                                                    ELSE ls_update-positionn
                                                     )
                 onbustripfor     = COND #( WHEN ls_ent-onbustripfor IS NOT INITIAL
                                                    THEN ls_ent-onbustripfor
                                                    ELSE ls_update-onbustripfor
                                                     )
                 purtravel1     = COND #( WHEN ls_ent-purtravel1 IS NOT INITIAL
                                                    THEN ls_ent-purtravel1
                                                    ELSE ls_update-purtravel1
                                                     )
                 purtravel2     = COND #( WHEN ls_ent-purtravel2 IS NOT INITIAL
                                                    THEN ls_ent-purtravel2
                                                    ELSE ls_update-purtravel2
                                                     )
                 purtravel3     = COND #( WHEN ls_ent-purtravel3 IS NOT INITIAL
                                                    THEN ls_ent-purtravel3
                                                    ELSE ls_update-purtravel3
                                                     )
                 purtravel4     = COND #( WHEN ls_ent-purtravel4 IS NOT INITIAL
                                                    THEN ls_ent-purtravel4
                                                    ELSE ls_update-purtravel4
                                                     )
                 country1     = COND #( WHEN ls_ent-country1 IS NOT INITIAL
                                                    THEN ls_ent-country1
                                                    ELSE ls_update-country1
                                                     )
                 country2     = COND #( WHEN ls_ent-country2 IS NOT INITIAL
                                                    THEN ls_ent-country2
                                                    ELSE ls_update-country2
                                                     )
                 country3     = COND #( WHEN ls_ent-country3 IS NOT INITIAL
                                                    THEN ls_ent-country3
                                                    ELSE ls_update-country3
                                                     )
                 country4     = COND #( WHEN ls_ent-country4 IS NOT INITIAL
                                                    THEN ls_ent-country4
                                                    ELSE ls_update-country4
                                                     )
                 tradeparture     = COND #( WHEN ls_ent-tradeparture IS NOT INITIAL
                                                    THEN ls_ent-tradeparture
                                                    ELSE ls_update-tradeparture
                                                     )
                 traarrival     = COND #( WHEN ls_ent-traarrival IS NOT INITIAL
                                                    THEN ls_ent-traarrival
                                                    ELSE ls_update-traarrival
                                                     )
                 identifiedby     = COND #( WHEN ls_ent-identifiedby IS NOT INITIAL
                                                    THEN ls_ent-identifiedby
                                                    ELSE ls_update-identifiedby
                                                     )
                 signaturedate     = COND #( WHEN ls_ent-signaturedate IS NOT INITIAL
                                                    THEN ls_ent-signaturedate
                                                    ELSE ls_update-signaturedate
                                                     )
                 header_uuid  = ls_ent-headeruuid
                                                           ) ).




    UPDATE zfi_001_t_head FROM TABLE @lt_update.
  ENDMETHOD.

  METHOD delete.
    LOOP AT keys INTO DATA(ls_keys).
      DELETE FROM zfi_001_t_head WHERE header_uuid = @ls_keys-headeruuid.
    ENDLOOP.
  ENDMETHOD.

  METHOD read.
    SELECT * FROM zfi_001_dd_head
    FOR ALL ENTRIES IN @keys
    WHERE headeruuid = @keys-headeruuid
    INTO CORRESPONDING FIELDS OF TABLE @result.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_item.
  ENDMETHOD.

  METHOD cba_item.
    DATA: ls_item TYPE zfi_001_t_item.
    DATA(generator) = cl_uuid_factory=>create_system_uuid(  ).

    LOOP AT entities_cba ASSIGNING FIELD-SYMBOL(<fs_cba>).
      SELECT MAX( refdocitem )
      FROM zfi_001_t_item
      WHERE header_uuid = @<fs_cba>-headeruuid
      INTO @DATA(ls_itemref).
      LOOP AT <fs_cba>-%target INTO DATA(ls_cba).

        ls_item-header_uuid = <fs_cba>-headeruuid .
        TRY.
            ls_item-item_uuid   = generator->create_uuid_x16(  ).
          CATCH cx_uuid_error.
        ENDTRY.
        IF ls_itemref IS INITIAL.
          ls_item-refdocitem = 1.
        ELSE.
          ls_item-refdocitem = ls_itemref + 1.
        ENDIF.
        ls_item-glacc        = ls_cba-glacc .
        ls_item-amnintracur  = ls_cba-amnintracur .
        ls_item-debcrecode   = ls_cba-debcrecode .
        ls_item-docitemtext  = ls_cba-docitemtext .
        ls_item-taxcode      = ls_cba-taxcode.
        ls_item-costcenter   = ls_cba-costcenter .
        ls_item-profitcenter = ls_cba-profitcenter .
        ls_item-segment      = ls_cba-segment .
        ls_item-funcarea     = ls_cba-funcarea .
        ls_item-valdate      = ls_cba-valdate .
        ls_item-housebank    = ls_cba-housebank .
        ls_item-housebankacc = ls_cba-housebankacc .
        ls_item-taxclas      = ls_cba-taxclas .
        ls_item-contype      = ls_cba-contype .
        ls_item-taxbaseamnt  = ls_cba-taxbaseamnt .
        ls_item-currcode     = ls_cba-currcode .

        "Pass data back to UI
        INSERT VALUE #( %cid = ls_cba-%cid
                        itemuuid = ls_item-item_uuid
                      ) INTO  TABLE mapped-item.

        INSERT VALUE #( %cid = ls_cba-%cid
                        headeruuid = <fs_cba>-headeruuid
                      ) INTO  TABLE mapped-header.

        INSERT zfi_001_t_item FROM @ls_item.

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

  METHOD jount.
    SELECT *
      FROM zfi_001_t_head
      FOR ALL ENTRIES IN @keys
      WHERE header_uuid = @keys-headeruuid
      INTO TABLE @DATA(lt_header).

    SELECT *
    FROM zfi_001_t_item
    FOR ALL ENTRIES IN @keys
    WHERE header_uuid = @keys-headeruuid
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
        FROM zfi_001_t_item
        WHERE header_uuid = @ls_header-header_uuid
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
            FROM zfi_001_t_item AS item
            WHERE header_uuid = @ls_items-header_uuid
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
                                                              created_by_user = ls_header-createdby
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

        DATA(ls_msg_head) = VALUE zbusiness_document_message_he2( creation_date_time = ls_header-createdat ).

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
      MODIFY zfi_001_t_head FROM @ls_header.
      IF sy-subrc EQ 0.
        DATA(lv_msg) = new_message( id = 'ZFI_001_MC_ALLOWANCE'
                          number = '001'
                          severity = cl_abap_behv=>ms-success
                          ).

        APPEND VALUE #( headeruuid = ls_header-header_uuid
        %msg = lv_msg ) TO reported-header.

      ENDIF.

    ELSE.
      lv_msg = new_message( id = 'ZFI_001_MC_ALLOWANCE'
                        number = '002'
                        severity = cl_abap_behv=>ms-error
                        ).

      APPEND VALUE #( headeruuid = ls_header-header_uuid
      %msg = lv_msg ) TO reported-header.


    ENDIF.


  ENDMETHOD.

*  METHOD instance_feature.
*
*  ENDMETHOD.

ENDCLASS.

CLASS lhc_item DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE item.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE item.

    METHODS read FOR READ
      IMPORTING keys FOR READ item RESULT result.

    METHODS rba_header FOR READ
      IMPORTING keys_rba FOR READ item\_header FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_item IMPLEMENTATION.

  METHOD update.
    DATA: lt_update TYPE TABLE OF zfi_001_t_item.

    LOOP AT entities INTO DATA(ls_entity).
      SELECT SINGLE * FROM zfi_001_t_item WHERE item_uuid = @ls_entity-itemuuid INTO @DATA(ls_update).
    ENDLOOP.

    lt_update =
        VALUE #( FOR ls_ent IN entities
               (
                 refdocitem     = COND #( WHEN ls_ent-refdocitem  IS NOT INITIAL
                                                    THEN ls_ent-refdocitem
                                                    ELSE ls_update-refdocitem
                                                     )
                 glacc            = COND #( WHEN ls_ent-glacc         IS NOT INITIAL
                                                    THEN ls_ent-glacc
                                                    ELSE ls_update-glacc
                                                     )
                 amnintracur      = COND #( WHEN ls_ent-amnintracur   IS NOT INITIAL
                                                    THEN ls_ent-amnintracur
                                                    ELSE ls_update-amnintracur
                                                     )
                 debcrecode     = COND #( WHEN ls_ent-debcrecode    IS NOT INITIAL
                                                    THEN ls_ent-debcrecode
                                                    ELSE ls_update-debcrecode
                                                     )
                 docitemtext      = COND #( WHEN ls_ent-docitemtext   IS NOT INITIAL
                                                    THEN ls_ent-docitemtext
                                                    ELSE ls_update-docitemtext
                                                     )
                 taxcode       = COND #( WHEN ls_ent-taxcode       IS NOT INITIAL
                                                    THEN ls_ent-taxcode
                                                    ELSE ls_update-taxcode
                                                     )
                 costcenter          = COND #( WHEN ls_ent-costcenter          IS NOT INITIAL
                                                    THEN ls_ent-costcenter
                                                    ELSE ls_update-costcenter
                                                     )
                 profitcenter        = COND #( WHEN ls_ent-profitcenter        IS NOT INITIAL
                                                    THEN ls_ent-profitcenter
                                                    ELSE ls_update-profitcenter
                                                     )
                 segment             = COND #( WHEN ls_ent-segment             IS NOT INITIAL
                                                    THEN ls_ent-segment
                                                    ELSE ls_update-segment
                                                     )
                 funcarea            = COND #( WHEN ls_ent-funcarea            IS NOT INITIAL
                                                    THEN ls_ent-funcarea
                                                    ELSE ls_update-funcarea
                                                     )
                 valdate             = COND #( WHEN ls_ent-valdate             IS NOT INITIAL
                                                    THEN ls_ent-valdate
                                                    ELSE ls_update-valdate
                                                     )
                 housebank           = COND #( WHEN ls_ent-housebank           IS NOT INITIAL
                                                    THEN ls_ent-housebank
                                                    ELSE ls_update-housebank
                                                     )
                 housebankacc        = COND #( WHEN ls_ent-housebankacc        IS NOT INITIAL
                                                    THEN ls_ent-housebankacc
                                                    ELSE ls_update-housebankacc
                                                     )
                 taxclas             = COND #( WHEN ls_ent-taxclas             IS NOT INITIAL
                                                    THEN ls_ent-taxclas
                                                    ELSE ls_update-taxclas
                                                     )
                 contype             = COND #( WHEN ls_ent-contype             IS NOT INITIAL
                                                    THEN ls_ent-contype
                                                    ELSE ls_update-contype
                                                     )
                 taxbaseamnt         = COND #( WHEN ls_ent-taxbaseamnt         IS NOT INITIAL
                                                    THEN ls_ent-taxbaseamnt
                                                    ELSE ls_update-taxbaseamnt
                                                     )
                 currcode            = COND #( WHEN ls_ent-currcode         IS NOT INITIAL
                                                    THEN ls_ent-currcode
                                                    ELSE ls_update-currcode
                                                     )
                 item_uuid   = ls_update-item_uuid
                 header_uuid = ls_update-header_uuid
                                                     ) ).

    UPDATE zfi_001_t_item FROM TABLE @lt_update.
  ENDMETHOD.

  METHOD delete.
    LOOP AT keys INTO DATA(ls_keys).
      DELETE FROM zfi_001_t_item WHERE item_uuid = @ls_keys-itemuuid.
    ENDLOOP.
  ENDMETHOD.

  METHOD read.
    SELECT * FROM zfi_001_dd_item
    FOR ALL ENTRIES IN @keys
    WHERE itemuuid = @keys-itemuuid
    INTO CORRESPONDING FIELDS OF TABLE @result.
  ENDMETHOD.

  METHOD rba_header.

  ENDMETHOD.

ENDCLASS.

CLASS lsc_zfi_001_dd_head DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zfi_001_dd_head IMPLEMENTATION.

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
