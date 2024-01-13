/********** GENERATED on 11/20/2023 at 11:59:00 by CB9980000012**************/
 @OData.entitySet.name: 'A_SupplierInvoice' 
 @OData.entityType.name: 'A_SupplierInvoiceType' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZA_SUPPLIERINVOICE { 
 key SupplierInvoice : abap.char( 10 ) ; 
 key FiscalYear : abap.numc( 4 ) ; 
 @Odata.property.valueControl: 'CompanyCode_vc' 
 CompanyCode : abap.char( 4 ) ; 
 CompanyCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DocumentDate_vc' 
 DocumentDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 DocumentDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PostingDate_vc' 
 PostingDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 PostingDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreationDate_vc' 
 CreationDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 CreationDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplierInvoiceIDByInvcgPar_vc' 
 SupplierInvoiceIDByInvcgParty : abap.char( 16 ) ; 
 SupplierInvoiceIDByInvcgPar_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InvoicingParty_vc' 
 InvoicingParty : abap.char( 10 ) ; 
 InvoicingParty_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DocumentCurrency_vc' 
 @Semantics.currencyCode: true 
 DocumentCurrency : abap.cuky ; 
 DocumentCurrency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InvoiceGrossAmount_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 InvoiceGrossAmount : abap.curr( 14, 3 ) ; 
 InvoiceGrossAmount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'UnplannedDeliveryCost_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 UnplannedDeliveryCost : abap.curr( 14, 3 ) ; 
 UnplannedDeliveryCost_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DocumentHeaderText_vc' 
 DocumentHeaderText : abap.char( 25 ) ; 
 DocumentHeaderText_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ManualCashDiscount_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 ManualCashDiscount : abap.curr( 14, 3 ) ; 
 ManualCashDiscount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaymentTerms_vc' 
 PaymentTerms : abap.char( 4 ) ; 
 PaymentTerms_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DueCalculationBaseDate_vc' 
 DueCalculationBaseDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 DueCalculationBaseDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CashDiscount1Percent_vc' 
 CashDiscount1Percent : abap.dec( 5, 3 ) ; 
 CashDiscount1Percent_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CashDiscount1Days_vc' 
 CashDiscount1Days : abap.dec( 3, 0 ) ; 
 CashDiscount1Days_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CashDiscount2Percent_vc' 
 CashDiscount2Percent : abap.dec( 5, 3 ) ; 
 CashDiscount2Percent_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CashDiscount2Days_vc' 
 CashDiscount2Days : abap.dec( 3, 0 ) ; 
 CashDiscount2Days_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'NetPaymentDays_vc' 
 NetPaymentDays : abap.dec( 3, 0 ) ; 
 NetPaymentDays_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaymentBlockingReason_vc' 
 PaymentBlockingReason : abap.char( 1 ) ; 
 PaymentBlockingReason_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AccountingDocumentType_vc' 
 AccountingDocumentType : abap.char( 2 ) ; 
 AccountingDocumentType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BPBankAccountInternalID_vc' 
 BPBankAccountInternalID : abap.char( 4 ) ; 
 BPBankAccountInternalID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplierInvoiceStatus_vc' 
 SupplierInvoiceStatus : abap.char( 1 ) ; 
 SupplierInvoiceStatus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IndirectQuotedExchangeRate_vc' 
 IndirectQuotedExchangeRate : abap.dec( 9, 5 ) ; 
 IndirectQuotedExchangeRate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DirectQuotedExchangeRate_vc' 
 DirectQuotedExchangeRate : abap.dec( 9, 5 ) ; 
 DirectQuotedExchangeRate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'StateCentralBankPaymentReas_vc' 
 StateCentralBankPaymentReason : abap.char( 3 ) ; 
 StateCentralBankPaymentReas_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplyingCountry_vc' 
 SupplyingCountry : abap.char( 3 ) ; 
 SupplyingCountry_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaymentMethod_vc' 
 PaymentMethod : abap.char( 1 ) ; 
 PaymentMethod_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaymentMethodSupplement_vc' 
 PaymentMethodSupplement : abap.char( 2 ) ; 
 PaymentMethodSupplement_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaymentReference_vc' 
 PaymentReference : abap.char( 30 ) ; 
 PaymentReference_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InvoiceReference_vc' 
 InvoiceReference : abap.char( 10 ) ; 
 InvoiceReference_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InvoiceReferenceFiscalYear_vc' 
 InvoiceReferenceFiscalYear : abap.numc( 4 ) ; 
 InvoiceReferenceFiscalYear_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FixedCashDiscount_vc' 
 FixedCashDiscount : abap.char( 1 ) ; 
 FixedCashDiscount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'UnplannedDeliveryCostTaxCod_vc' 
 UnplannedDeliveryCostTaxCode : abap.char( 2 ) ; 
 UnplannedDeliveryCostTaxCod_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'UnplndDelivCostTaxJurisdict_vc' 
 UnplndDelivCostTaxJurisdiction : abap.char( 15 ) ; 
 UnplndDelivCostTaxJurisdict_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'UnplndDeliveryCostTaxCountr_vc' 
 UnplndDeliveryCostTaxCountry : abap.char( 3 ) ; 
 UnplndDeliveryCostTaxCountr_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AssignmentReference_vc' 
 AssignmentReference : abap.char( 18 ) ; 
 AssignmentReference_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplierPostingLineItemText_vc' 
 SupplierPostingLineItemText : abap.char( 50 ) ; 
 SupplierPostingLineItemText_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxIsCalculatedAutomaticall_vc' 
 TaxIsCalculatedAutomatically : abap_boolean ; 
 TaxIsCalculatedAutomaticall_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BusinessPlace_vc' 
 BusinessPlace : abap.char( 4 ) ; 
 BusinessPlace_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BusinessSectionCode_vc' 
 BusinessSectionCode : abap.char( 4 ) ; 
 BusinessSectionCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BusinessArea_vc' 
 BusinessArea : abap.char( 4 ) ; 
 BusinessArea_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SuplrInvcIsCapitalGoodsRela_vc' 
 SuplrInvcIsCapitalGoodsRelated : abap_boolean ; 
 SuplrInvcIsCapitalGoodsRela_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplierInvoiceIsCreditMemo_vc' 
 SupplierInvoiceIsCreditMemo : abap.char( 1 ) ; 
 SupplierInvoiceIsCreditMemo_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaytSlipWthRefSubscriber_vc' 
 PaytSlipWthRefSubscriber : abap.char( 11 ) ; 
 PaytSlipWthRefSubscriber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaytSlipWthRefCheckDigit_vc' 
 PaytSlipWthRefCheckDigit : abap.char( 2 ) ; 
 PaytSlipWthRefCheckDigit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaytSlipWthRefReference_vc' 
 PaytSlipWthRefReference : abap.char( 27 ) ; 
 PaytSlipWthRefReference_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxDeterminationDate_vc' 
 TaxDeterminationDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 TaxDeterminationDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxReportingDate_vc' 
 TaxReportingDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 TaxReportingDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxFulfillmentDate_vc' 
 TaxFulfillmentDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 TaxFulfillmentDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InvoiceReceiptDate_vc' 
 InvoiceReceiptDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 InvoiceReceiptDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DeliveryOfGoodsReportingCnt_vc' 
 DeliveryOfGoodsReportingCntry : abap.char( 3 ) ; 
 DeliveryOfGoodsReportingCnt_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplierVATRegistration_vc' 
 SupplierVATRegistration : abap.char( 20 ) ; 
 SupplierVATRegistration_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsEUTriangularDeal_vc' 
 IsEUTriangularDeal : abap_boolean ; 
 IsEUTriangularDeal_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SuplrInvcDebitCrdtCodeDeliv_vc' 
 SuplrInvcDebitCrdtCodeDelivery : abap.char( 1 ) ; 
 SuplrInvcDebitCrdtCodeDeliv_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SuplrInvcDebitCrdtCodeRetur_vc' 
 SuplrInvcDebitCrdtCodeReturns : abap.char( 1 ) ; 
 SuplrInvcDebitCrdtCodeRetur_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RetentionDueDate_vc' 
 RetentionDueDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 RetentionDueDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaymentReason_vc' 
 PaymentReason : abap.char( 4 ) ; 
 PaymentReason_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'HouseBank_vc' 
 HouseBank : abap.char( 5 ) ; 
 HouseBank_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'HouseBankAccount_vc' 
 HouseBankAccount : abap.char( 5 ) ; 
 HouseBankAccount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplierInvoiceOrigin_vc' 
 SupplierInvoiceOrigin : abap.char( 1 ) ; 
 SupplierInvoiceOrigin_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ReverseDocument_vc' 
 ReverseDocument : abap.char( 10 ) ; 
 ReverseDocument_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ReverseDocumentFiscalYear_vc' 
 ReverseDocumentFiscalYear : abap.numc( 4 ) ; 
 ReverseDocumentFiscalYear_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsReversal_vc' 
 IsReversal : abap_boolean ; 
 IsReversal_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsReversed_vc' 
 IsReversed : abap_boolean ; 
 IsReversed_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IN_GSTPartner_vc' 
 IN_GSTPartner : abap.char( 10 ) ; 
 IN_GSTPartner_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IN_GSTPlaceOfSupply_vc' 
 IN_GSTPlaceOfSupply : abap.char( 3 ) ; 
 IN_GSTPlaceOfSupply_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IN_InvoiceReferenceNumber_vc' 
 IN_InvoiceReferenceNumber : abap.char( 64 ) ; 
 IN_InvoiceReferenceNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'JrnlEntryCntrySpecificRef1_vc' 
 JrnlEntryCntrySpecificRef1 : abap.char( 80 ) ; 
 JrnlEntryCntrySpecificRef1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'JrnlEntryCntrySpecificDate1_vc' 
 JrnlEntryCntrySpecificDate1 : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 JrnlEntryCntrySpecificDate1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'JrnlEntryCntrySpecificRef2_vc' 
 JrnlEntryCntrySpecificRef2 : abap.char( 25 ) ; 
 JrnlEntryCntrySpecificRef2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'JrnlEntryCntrySpecificDate2_vc' 
 JrnlEntryCntrySpecificDate2 : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 JrnlEntryCntrySpecificDate2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'JrnlEntryCntrySpecificRef3_vc' 
 JrnlEntryCntrySpecificRef3 : abap.char( 25 ) ; 
 JrnlEntryCntrySpecificRef3_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'JrnlEntryCntrySpecificDate3_vc' 
 JrnlEntryCntrySpecificDate3 : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 JrnlEntryCntrySpecificDate3_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'JrnlEntryCntrySpecificRef4_vc' 
 JrnlEntryCntrySpecificRef4 : abap.char( 50 ) ; 
 JrnlEntryCntrySpecificRef4_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'JrnlEntryCntrySpecificDate4_vc' 
 JrnlEntryCntrySpecificDate4 : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 JrnlEntryCntrySpecificDate4_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'JrnlEntryCntrySpecificRef5_vc' 
 JrnlEntryCntrySpecificRef5 : abap.char( 50 ) ; 
 JrnlEntryCntrySpecificRef5_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'JrnlEntryCntrySpecificDate5_vc' 
 JrnlEntryCntrySpecificDate5 : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 JrnlEntryCntrySpecificDate5_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'JrnlEntryCntrySpecificBP1_vc' 
 JrnlEntryCntrySpecificBP1 : abap.char( 10 ) ; 
 JrnlEntryCntrySpecificBP1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'JrnlEntryCntrySpecificBP2_vc' 
 JrnlEntryCntrySpecificBP2 : abap.char( 10 ) ; 
 JrnlEntryCntrySpecificBP2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_SelectedDeliveryNotes' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SelectedDeliveryNotes : association [0..*] to ZA_SUPLRINVCSELDINBDELIVERYNOT on 1 = 1; 
 @OData.property.name: 'to_SelectedPurchaseOrders' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SelectedPurchaseOrders : association [0..*] to ZA_SUPLRINVCSELDPURGDOCUMENT on 1 = 1; 
 @OData.property.name: 'to_SelectedServiceEntrySheets' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SelectedServiceEntrySheets : association [0..*] to ZA_SUPLRINVCSELDSRVCENTRSHTLEA on 1 = 1; 
 @OData.property.name: 'to_SuplrInvcItemAsset' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SuplrInvcItemAsset : association [0..*] to ZA_SUPPLIERINVOICEITEMASSET on 1 = 1; 
 @OData.property.name: 'to_SuplrInvcItemMaterial' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SuplrInvcItemMaterial : association [0..*] to ZA_SUPPLIERINVOICEITEMMATERIAL on 1 = 1; 
 @OData.property.name: 'to_SuplrInvcItemPurOrdRef' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SuplrInvcItemPurOrdRef : association [0..*] to ZA_SUPLRINVCITEMPURORDREF on 1 = 1; 
 @OData.property.name: 'to_SuplrInvoiceAdditionalData' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SuplrInvoiceAdditionalData : association [1] to ZA_SUPLRINVOICEADDITIONALDATA on 1 = 1; 
 @OData.property.name: 'to_SupplierInvoiceItemGLAcct' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SupplierInvoiceItemGLAcct : association [0..*] to ZA_SUPPLIERINVOICEITEMGLACCT on 1 = 1; 
 @OData.property.name: 'to_SupplierInvoiceTax' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SupplierInvoiceTax : association [0..*] to ZA_SUPPLIERINVOICETAX on 1 = 1; 
 @OData.property.name: 'to_SupplierInvoiceWhldgTax' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SupplierInvoiceWhldgTax : association [0..*] to ZA_SUPLRINVCHEADERWHLDGTAX on 1 = 1; 
 } 
