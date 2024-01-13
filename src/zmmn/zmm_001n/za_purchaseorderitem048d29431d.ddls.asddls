/********** GENERATED on 11/18/2023 at 12:05:15 by CB9980000012**************/
 @OData.entitySet.name: 'A_PurchaseOrderItem' 
 @OData.entityType.name: 'A_PurchaseOrderItemType' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZA_PURCHASEORDERITEM048D29431D { 
 key PurchaseOrder : abap.char( 10 ) ; 
 key PurchaseOrderItem : abap.numc( 5 ) ; 
 @OData.property.valueControl: 'PurchasingDocumentDeletionC_vc' 
 PurchasingDocumentDeletionCode : abap.char( 1 ) ; 
 PurchasingDocumentDeletionC_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchaseOrderItemText_vc' 
 PurchaseOrderItemText : abap.char( 40 ) ; 
 PurchaseOrderItemText_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Plant_vc' 
 Plant : abap.char( 4 ) ; 
 Plant_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'StorageLocation_vc' 
 StorageLocation : abap.char( 4 ) ; 
 StorageLocation_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'MaterialGroup_vc' 
 MaterialGroup : abap.char( 9 ) ; 
 MaterialGroup_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchasingInfoRecord_vc' 
 PurchasingInfoRecord : abap.char( 10 ) ; 
 PurchasingInfoRecord_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SupplierMaterialNumber_vc' 
 SupplierMaterialNumber : abap.char( 35 ) ; 
 SupplierMaterialNumber_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'OrderQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit' 
 OrderQuantity : abap.dec( 13, 3 ) ; 
 OrderQuantity_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchaseOrderQuantityUnit_vc' 
 @Semantics.unitOfMeasure: true 
// PurchaseOrderQuantityUnit : abap.unit( 3 ) ; 
 PurchaseOrderQuantityUnit : msehi ; 
 PurchaseOrderQuantityUnit_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'OrderPriceUnit_vc' 
 @Semantics.unitOfMeasure: true 
// OrderPriceUnit : abap.unit( 3 ) ; 
 OrderPriceUnit : msehi ; 
 OrderPriceUnit_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'OrderPriceUnitToOrderUnitNm_vc' 
 OrderPriceUnitToOrderUnitNmrtr : abap.dec( 5, 0 ) ; 
 OrderPriceUnitToOrderUnitNm_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'OrdPriceUnitToOrderUnitDnmn_vc' 
 OrdPriceUnitToOrderUnitDnmntr : abap.dec( 5, 0 ) ; 
 OrdPriceUnitToOrderUnitDnmn_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DocumentCurrency_vc' 
 @Semantics.currencyCode: true 
 DocumentCurrency : abap.cuky ; 
 DocumentCurrency_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'NetPriceAmount_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 NetPriceAmount : abap.curr( 12, 3 ) ; 
 NetPriceAmount_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'NetPriceQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'OrderPriceUnit' 
 NetPriceQuantity : abap.dec( 5, 0 ) ; 
 NetPriceQuantity_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'TaxCode_vc' 
 TaxCode : abap.char( 2 ) ; 
 TaxCode_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ShippingInstruction_vc' 
 ShippingInstruction : abap.char( 2 ) ; 
 ShippingInstruction_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'TaxDeterminationDate_vc' 
 TaxDeterminationDate : rap_cp_odata_v2_edm_datetime ; 
 TaxDeterminationDate_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'TaxCountry_vc' 
 TaxCountry : abap.char( 3 ) ; 
 TaxCountry_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PriceIsToBePrinted_vc' 
 PriceIsToBePrinted : abap_boolean ; 
 PriceIsToBePrinted_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'OverdelivTolrtdLmtRatioInPc_vc' 
 OverdelivTolrtdLmtRatioInPct : abap.dec( 3, 1 ) ; 
 OverdelivTolrtdLmtRatioInPc_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'UnlimitedOverdeliveryIsAllo_vc' 
 UnlimitedOverdeliveryIsAllowed : abap_boolean ; 
 UnlimitedOverdeliveryIsAllo_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'UnderdelivTolrtdLmtRatioInP_vc' 
 UnderdelivTolrtdLmtRatioInPct : abap.dec( 3, 1 ) ; 
 UnderdelivTolrtdLmtRatioInP_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ValuationType_vc' 
 ValuationType : abap.char( 10 ) ; 
 ValuationType_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'IsCompletelyDelivered_vc' 
 IsCompletelyDelivered : abap_boolean ; 
 IsCompletelyDelivered_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'IsFinallyInvoiced_vc' 
 IsFinallyInvoiced : abap_boolean ; 
 IsFinallyInvoiced_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchaseOrderItemCategory_vc' 
 PurchaseOrderItemCategory : abap.char( 1 ) ; 
 PurchaseOrderItemCategory_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'AccountAssignmentCategory_vc' 
 AccountAssignmentCategory : abap.char( 1 ) ; 
 AccountAssignmentCategory_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'MultipleAcctAssgmtDistribut_vc' 
 MultipleAcctAssgmtDistribution : abap.char( 1 ) ; 
 MultipleAcctAssgmtDistribut_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PartialInvoiceDistribution_vc' 
 PartialInvoiceDistribution : abap.char( 1 ) ; 
 PartialInvoiceDistribution_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'GoodsReceiptIsExpected_vc' 
 GoodsReceiptIsExpected : abap_boolean ; 
 GoodsReceiptIsExpected_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'GoodsReceiptIsNonValuated_vc' 
 GoodsReceiptIsNonValuated : abap_boolean ; 
 GoodsReceiptIsNonValuated_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'InvoiceIsExpected_vc' 
 InvoiceIsExpected : abap_boolean ; 
 InvoiceIsExpected_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'InvoiceIsGoodsReceiptBased_vc' 
 InvoiceIsGoodsReceiptBased : abap_boolean ; 
 InvoiceIsGoodsReceiptBased_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchaseContract_vc' 
 PurchaseContract : abap.char( 10 ) ; 
 PurchaseContract_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchaseContractItem_vc' 
 PurchaseContractItem : abap.numc( 5 ) ; 
 PurchaseContractItem_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Customer_vc' 
 Customer : abap.char( 10 ) ; 
 Customer_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Subcontractor_vc' 
 Subcontractor : abap.char( 10 ) ; 
 Subcontractor_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SupplierIsSubcontractor_vc' 
 SupplierIsSubcontractor : abap_boolean ; 
 SupplierIsSubcontractor_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ItemNetWeight_vc' 
 @Semantics.quantity.unitOfMeasure: 'ItemWeightUnit' 
 ItemNetWeight : abap.dec( 13, 3 ) ; 
 ItemNetWeight_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ItemWeightUnit_vc' 
 @Semantics.unitOfMeasure: true 
 ItemWeightUnit : abap.unit( 3 ) ; 
 ItemWeightUnit_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'TaxJurisdiction_vc' 
 TaxJurisdiction : abap.char( 15 ) ; 
 TaxJurisdiction_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PricingDateControl_vc' 
 PricingDateControl : abap.char( 1 ) ; 
 PricingDateControl_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ItemVolume_vc' 
 @Semantics.quantity.unitOfMeasure: 'ItemVolumeUnit' 
 ItemVolume : abap.dec( 13, 3 ) ; 
 ItemVolume_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ItemVolumeUnit_vc' 
 @Semantics.unitOfMeasure: true 
 ItemVolumeUnit : abap.unit( 3 ) ; 
 ItemVolumeUnit_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SupplierConfirmationControl_vc' 
 SupplierConfirmationControlKey : abap.char( 4 ) ; 
 SupplierConfirmationControl_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'IncotermsClassification_vc' 
 IncotermsClassification : abap.char( 3 ) ; 
 IncotermsClassification_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'IncotermsTransferLocation_vc' 
 IncotermsTransferLocation : abap.char( 28 ) ; 
 IncotermsTransferLocation_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'EvaldRcptSettlmtIsAllowed_vc' 
 EvaldRcptSettlmtIsAllowed : abap_boolean ; 
 EvaldRcptSettlmtIsAllowed_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchaseRequisition_vc' 
 PurchaseRequisition : abap.char( 10 ) ; 
 PurchaseRequisition_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchaseRequisitionItem_vc' 
 PurchaseRequisitionItem : abap.numc( 5 ) ; 
 PurchaseRequisitionItem_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'IsReturnsItem_vc' 
 IsReturnsItem : abap_boolean ; 
 IsReturnsItem_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'RequisitionerName_vc' 
 RequisitionerName : abap.char( 12 ) ; 
 RequisitionerName_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ServicePackage_vc' 
 ServicePackage : abap.numc( 10 ) ; 
 ServicePackage_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'EarmarkedFunds_vc' 
 EarmarkedFunds : abap.char( 10 ) ; 
 EarmarkedFunds_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'EarmarkedFundsDocument_vc' 
 EarmarkedFundsDocument : abap.char( 10 ) ; 
 EarmarkedFundsDocument_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'EarmarkedFundsItem_vc' 
 EarmarkedFundsItem : abap.numc( 3 ) ; 
 EarmarkedFundsItem_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'EarmarkedFundsDocumentItem_vc' 
 EarmarkedFundsDocumentItem : abap.numc( 3 ) ; 
 EarmarkedFundsDocumentItem_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'IncotermsLocation1_vc' 
 IncotermsLocation1 : abap.char( 70 ) ; 
 IncotermsLocation1_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'IncotermsLocation2_vc' 
 IncotermsLocation2 : abap.char( 70 ) ; 
 IncotermsLocation2_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Material_vc' 
 Material : abap.char( 40 ) ; 
 Material_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'InternationalArticleNumber_vc' 
 InternationalArticleNumber : abap.char( 18 ) ; 
 InternationalArticleNumber_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ManufacturerMaterial_vc' 
 ManufacturerMaterial : abap.char( 40 ) ; 
 ManufacturerMaterial_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ServicePerformer_vc' 
 ServicePerformer : abap.char( 10 ) ; 
 ServicePerformer_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ProductType_vc' 
 ProductType : abap.char( 2 ) ; 
 ProductType_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ExpectedOverallLimitAmount_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 ExpectedOverallLimitAmount : abap.curr( 14, 3 ) ; 
 ExpectedOverallLimitAmount_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'OverallLimitAmount_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 OverallLimitAmount : abap.curr( 14, 3 ) ; 
 OverallLimitAmount_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurContractForOverallLimit_vc' 
 PurContractForOverallLimit : abap.char( 10 ) ; 
 PurContractForOverallLimit_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchasingParentItem_vc' 
 PurchasingParentItem : abap.numc( 5 ) ; 
 PurchasingParentItem_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Batch_vc' 
 Batch : abap.char( 10 ) ; 
 Batch_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchasingItemIsFreeOfCharg_vc' 
 PurchasingItemIsFreeOfCharge : abap_boolean ; 
 PurchasingItemIsFreeOfCharg_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ReferenceDeliveryAddressID_vc' 
 ReferenceDeliveryAddressID : abap.char( 10 ) ; 
 ReferenceDeliveryAddressID_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DeliveryAddressID_vc' 
 DeliveryAddressID : abap.char( 10 ) ; 
 DeliveryAddressID_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DeliveryAddressName_vc' 
 DeliveryAddressName : abap.char( 40 ) ; 
 DeliveryAddressName_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DeliveryAddressName2_vc' 
 DeliveryAddressName2 : abap.char( 40 ) ; 
 DeliveryAddressName2_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DeliveryAddressFullName_vc' 
 DeliveryAddressFullName : abap.char( 80 ) ; 
 DeliveryAddressFullName_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DeliveryAddressStreetName_vc' 
 DeliveryAddressStreetName : abap.char( 60 ) ; 
 DeliveryAddressStreetName_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DeliveryAddressHouseNumber_vc' 
 DeliveryAddressHouseNumber : abap.char( 10 ) ; 
 DeliveryAddressHouseNumber_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DeliveryAddressCityName_vc' 
 DeliveryAddressCityName : abap.char( 40 ) ; 
 DeliveryAddressCityName_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DeliveryAddressPostalCode_vc' 
 DeliveryAddressPostalCode : abap.char( 10 ) ; 
 DeliveryAddressPostalCode_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DeliveryAddressRegion_vc' 
 DeliveryAddressRegion : abap.char( 3 ) ; 
 DeliveryAddressRegion_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DeliveryAddressCountry_vc' 
 DeliveryAddressCountry : abap.char( 3 ) ; 
 DeliveryAddressCountry_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DeliveryAddressDistrictName_vc' 
 DeliveryAddressDistrictName : abap.char( 40 ) ; 
 DeliveryAddressDistrictName_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DownPaymentType_vc' 
 DownPaymentType : abap.char( 4 ) ; 
 DownPaymentType_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DownPaymentPercentageOfTotA_vc' 
 DownPaymentPercentageOfTotAmt : abap.dec( 5, 2 ) ; 
 DownPaymentPercentageOfTotA_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DownPaymentAmount_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 DownPaymentAmount : abap.curr( 12, 3 ) ; 
 DownPaymentAmount_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DownPaymentDueDate_vc' 
 DownPaymentDueDate : rap_cp_odata_v2_edm_datetime ; 
 DownPaymentDueDate_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'BR_MaterialUsage_vc' 
 BR_MaterialUsage : abap.char( 1 ) ; 
 BR_MaterialUsage_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'BR_MaterialOrigin_vc' 
 BR_MaterialOrigin : abap.char( 1 ) ; 
 BR_MaterialOrigin_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'BR_CFOPCategory_vc' 
 BR_CFOPCategory : abap.char( 2 ) ; 
 BR_CFOPCategory_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'BR_IsProducedInHouse_vc' 
 BR_IsProducedInHouse : abap_boolean ; 
 BR_IsProducedInHouse_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ConsumptionTaxCtrlCode_vc' 
 ConsumptionTaxCtrlCode : abap.char( 16 ) ; 
 ConsumptionTaxCtrlCode_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurgProdCmplncSupplierStatu_vc' 
 PurgProdCmplncSupplierStatus : abap.char( 1 ) ; 
 PurgProdCmplncSupplierStatu_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurgProductMarketabilitySta_vc' 
 PurgProductMarketabilityStatus : abap.char( 1 ) ; 
 PurgProductMarketabilitySta_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurgSafetyDataSheetStatus_vc' 
 PurgSafetyDataSheetStatus : abap.char( 1 ) ; 
 PurgSafetyDataSheetStatus_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurgProdCmplncDngrsGoodsSta_vc' 
 PurgProdCmplncDngrsGoodsStatus : abap.char( 1 ) ; 
 PurgProdCmplncDngrsGoodsSta_vc : rap_cp_odata_value_control ; 
 
 @OData.property.name: 'to_AccountAssignment' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _AccountAssignment : association [0..*] to ZA_PURORDACCOUNTASSI4E03172050 on 1 = 1; 
 @OData.property.name: 'to_PurchaseOrder' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _PurchaseOrder : association [1] to ZA_PURCHASEORDEREB04C73093 on 1 = 1; 
 @OData.property.name: 'to_PurchaseOrderItemNote' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _PurchaseOrderItemNote : association [0..*] to ZA_PURCHASEORDERITEMDE3D6FAA78 on 1 = 1; 
 @OData.property.name: 'to_PurchaseOrderPricingElement' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _PurchaseOrderPricingElement : association [0..*] to ZA_PURORDPRICINGELEM581BE44894 on 1 = 1; 
 @OData.property.name: 'to_ScheduleLine' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ScheduleLine : association [0..*] to ZA_PURCHASEORDERSCHEB308D03B57 on 1 = 1; 
 } 
