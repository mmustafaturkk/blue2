/********** GENERATED on 11/18/2023 at 12:04:57 by CB9980000012**************/
 @OData.entitySet.name: 'A_PurchaseOrder' 
 @OData.entityType.name: 'A_PurchaseOrderType' 
 define root abstract entity ZA_PURCHASEORDEREB04C73093 { 
 key PurchaseOrder : abap.char( 10 ) ; 
 @Odata.property.valueControl: 'CompanyCode_vc' 
 CompanyCode : abap.char( 4 ) ; 
 CompanyCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseOrderType_vc' 
 PurchaseOrderType : abap.char( 4 ) ; 
 PurchaseOrderType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchasingDocumentDeletionC_vc' 
 PurchasingDocumentDeletionCode : abap.char( 1 ) ; 
 PurchasingDocumentDeletionC_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchasingProcessingStatus_vc' 
 PurchasingProcessingStatus : abap.char( 2 ) ; 
 PurchasingProcessingStatus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreatedByUser_vc' 
 CreatedByUser : abap.char( 12 ) ; 
 CreatedByUser_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreationDate_vc' 
 CreationDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 CreationDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LastChangeDateTime_vc' 
 LastChangeDateTime : tzntstmpl ; 
 LastChangeDateTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Supplier_vc' 
 Supplier : abap.char( 10 ) ; 
 Supplier_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseOrderSubtype_vc' 
 PurchaseOrderSubtype : abap.char( 1 ) ; 
 PurchaseOrderSubtype_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Language_vc' 
 Language : abap.char( 2 ) ; 
 Language_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaymentTerms_vc' 
 PaymentTerms : abap.char( 4 ) ; 
 PaymentTerms_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CashDiscount1Days_vc' 
 CashDiscount1Days : abap.dec( 3, 0 ) ; 
 CashDiscount1Days_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CashDiscount2Days_vc' 
 CashDiscount2Days : abap.dec( 3, 0 ) ; 
 CashDiscount2Days_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'NetPaymentDays_vc' 
 NetPaymentDays : abap.dec( 3, 0 ) ; 
 NetPaymentDays_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CashDiscount1Percent_vc' 
 CashDiscount1Percent : abap.dec( 5, 3 ) ; 
 CashDiscount1Percent_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CashDiscount2Percent_vc' 
 CashDiscount2Percent : abap.dec( 5, 3 ) ; 
 CashDiscount2Percent_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchasingOrganization_vc' 
 PurchasingOrganization : abap.char( 4 ) ; 
 PurchasingOrganization_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchasingDocumentOrigin_vc' 
 PurchasingDocumentOrigin : abap.char( 1 ) ; 
 PurchasingDocumentOrigin_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchasingGroup_vc' 
 PurchasingGroup : abap.char( 3 ) ; 
 PurchasingGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseOrderDate_vc' 
 PurchaseOrderDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 PurchaseOrderDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DocumentCurrency_vc' 
 DocumentCurrency : abap.char( 5 ) ; 
 DocumentCurrency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ExchangeRate_vc' 
 ExchangeRate : abap.char( 12 ) ; 
 ExchangeRate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ExchangeRateIsFixed_vc' 
 ExchangeRateIsFixed : abap_boolean ; 
 ExchangeRateIsFixed_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValidityStartDate_vc' 
 ValidityStartDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 ValidityStartDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValidityEndDate_vc' 
 ValidityEndDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 ValidityEndDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplierQuotationExternalID_vc' 
 SupplierQuotationExternalID : abap.char( 10 ) ; 
 SupplierQuotationExternalID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchasingCollectiveNumber_vc' 
 PurchasingCollectiveNumber : abap.char( 10 ) ; 
 PurchasingCollectiveNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplierRespSalesPersonName_vc' 
 SupplierRespSalesPersonName : abap.char( 30 ) ; 
 SupplierRespSalesPersonName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplierPhoneNumber_vc' 
 SupplierPhoneNumber : abap.char( 16 ) ; 
 SupplierPhoneNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplyingSupplier_vc' 
 SupplyingSupplier : abap.char( 10 ) ; 
 SupplyingSupplier_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplyingPlant_vc' 
 SupplyingPlant : abap.char( 4 ) ; 
 SupplyingPlant_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IncotermsClassification_vc' 
 IncotermsClassification : abap.char( 3 ) ; 
 IncotermsClassification_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CorrespncExternalReference_vc' 
 CorrespncExternalReference : abap.char( 12 ) ; 
 CorrespncExternalReference_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CorrespncInternalReference_vc' 
 CorrespncInternalReference : abap.char( 12 ) ; 
 CorrespncInternalReference_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InvoicingParty_vc' 
 InvoicingParty : abap.char( 10 ) ; 
 InvoicingParty_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ReleaseIsNotCompleted_vc' 
 ReleaseIsNotCompleted : abap_boolean ; 
 ReleaseIsNotCompleted_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchasingCompletenessStatu_vc' 
 PurchasingCompletenessStatus : abap_boolean ; 
 PurchasingCompletenessStatu_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IncotermsVersion_vc' 
 IncotermsVersion : abap.char( 4 ) ; 
 IncotermsVersion_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IncotermsLocation1_vc' 
 IncotermsLocation1 : abap.char( 70 ) ; 
 IncotermsLocation1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IncotermsLocation2_vc' 
 IncotermsLocation2 : abap.char( 70 ) ; 
 IncotermsLocation2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ManualSupplierAddressID_vc' 
 ManualSupplierAddressID : abap.char( 10 ) ; 
 ManualSupplierAddressID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsEndOfPurposeBlocked_vc' 
 IsEndOfPurposeBlocked : abap.char( 1 ) ; 
 IsEndOfPurposeBlocked_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AddressCityName_vc' 
 AddressCityName : abap.char( 40 ) ; 
 AddressCityName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AddressFaxNumber_vc' 
 AddressFaxNumber : abap.char( 30 ) ; 
 AddressFaxNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AddressHouseNumber_vc' 
 AddressHouseNumber : abap.char( 10 ) ; 
 AddressHouseNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AddressName_vc' 
 AddressName : abap.char( 40 ) ; 
 AddressName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AddressPostalCode_vc' 
 AddressPostalCode : abap.char( 10 ) ; 
 AddressPostalCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AddressStreetName_vc' 
 AddressStreetName : abap.char( 60 ) ; 
 AddressStreetName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AddressPhoneNumber_vc' 
 AddressPhoneNumber : abap.char( 30 ) ; 
 AddressPhoneNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AddressRegion_vc' 
 AddressRegion : abap.char( 3 ) ; 
 AddressRegion_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AddressCountry_vc' 
 AddressCountry : abap.char( 3 ) ; 
 AddressCountry_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AddressCorrespondenceLangua_vc' 
 AddressCorrespondenceLanguage : abap.char( 2 ) ; 
 AddressCorrespondenceLangua_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurgAggrgdProdCmplncSuplrSt_vc' 
 PurgAggrgdProdCmplncSuplrSts : abap.char( 1 ) ; 
 PurgAggrgdProdCmplncSuplrSt_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurgAggrgdProdMarketability_vc' 
 PurgAggrgdProdMarketabilitySts : abap.char( 1 ) ; 
 PurgAggrgdProdMarketability_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurgAggrgdSftyDataSheetStat_vc' 
 PurgAggrgdSftyDataSheetStatus : abap.char( 1 ) ; 
 PurgAggrgdSftyDataSheetStat_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurgProdCmplncTotDngrsGoods_vc' 
 PurgProdCmplncTotDngrsGoodsSts : abap.char( 1 ) ; 
 PurgProdCmplncTotDngrsGoods_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_PurchaseOrderItem' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _PurchaseOrderItem : association [0..*] to ZA_PURCHASEORDERITEM048D29431D on 1 = 1; 
 @OData.property.name: 'to_PurchaseOrderNote' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _PurchaseOrderNote : association [0..*] to ZA_PURCHASEORDERNOTEAF01A75441 on 1 = 1; 
 } 
