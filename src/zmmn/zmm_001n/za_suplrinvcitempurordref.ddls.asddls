/********** GENERATED on 11/20/2023 at 11:58:39 by CB9980000012**************/
 @OData.entitySet.name: 'A_SuplrInvcItemPurOrdRef' 
 @OData.entityType.name: 'A_SuplrInvcItemPurOrdRefType' 
 define root abstract entity ZA_SUPLRINVCITEMPURORDREF { 
 key SupplierInvoice : abap.char( 10 ) ; 
 key FiscalYear : abap.numc( 4 ) ; 
 key SupplierInvoiceItem : abap.numc( 6 ) ; 
 @OData.property.valueControl: 'PurchaseOrder_vc' 
 PurchaseOrder : abap.char( 10 ) ; 
 PurchaseOrder_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchaseOrderItem_vc' 
 PurchaseOrderItem : abap.numc( 5 ) ; 
 PurchaseOrderItem_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Plant_vc' 
 Plant : abap.char( 4 ) ; 
 Plant_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ReferenceDocument_vc' 
 ReferenceDocument : abap.char( 10 ) ; 
 ReferenceDocument_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ReferenceDocumentFiscalYear_vc' 
 ReferenceDocumentFiscalYear : abap.numc( 4 ) ; 
 ReferenceDocumentFiscalYear_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ReferenceDocumentItem_vc' 
 ReferenceDocumentItem : abap.numc( 4 ) ; 
 ReferenceDocumentItem_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'IsSubsequentDebitCredit_vc' 
 IsSubsequentDebitCredit : abap.char( 1 ) ; 
 IsSubsequentDebitCredit_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'TaxCode_vc' 
 TaxCode : abap.char( 2 ) ; 
 TaxCode_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'TaxJurisdiction_vc' 
 TaxJurisdiction : abap.char( 15 ) ; 
 TaxJurisdiction_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DocumentCurrency_vc' 
 @Semantics.currencyCode: true 
 DocumentCurrency : abap.cuky ; 
 DocumentCurrency_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SupplierInvoiceItemAmount_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 SupplierInvoiceItemAmount : abap.curr( 14, 3 ) ; 
 SupplierInvoiceItemAmount_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchaseOrderQuantityUnit_vc' 
// PurchaseOrderQuantityUnit : abap.char( 3 ) ; 
 PurchaseOrderQuantityUnit : msehi ; 
 PurchaseOrderQuantityUnit_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchaseOrderQtyUnitSAPCode_vc' 
 @Semantics.unitOfMeasure: true 
// PurchaseOrderQtyUnitSAPCode : abap.unit( 3 ) ; 
 PurchaseOrderQtyUnitSAPCode : msehi ; 
 PurchaseOrderQtyUnitSAPCode_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchaseOrderQtyUnitISOCode_vc' 
 PurchaseOrderQtyUnitISOCode : abap.char( 3 ) ; 
 PurchaseOrderQtyUnitISOCode_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'QuantityInPurchaseOrderUnit_vc' 
 @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQtyUnitSAPCode' 
 QuantityInPurchaseOrderUnit : abap.dec( 13, 3 ) ; 
 QuantityInPurchaseOrderUnit_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchaseOrderPriceUnit_vc' 
 PurchaseOrderPriceUnit : abap.char( 3 ) ; 
 PurchaseOrderPriceUnit_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchaseOrderPriceUnitSAPCo_vc' 
 @Semantics.unitOfMeasure: true 
 PurchaseOrderPriceUnitSAPCode : abap.unit( 3 ) ; 
 PurchaseOrderPriceUnitSAPCo_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchaseOrderPriceUnitISOCo_vc' 
 PurchaseOrderPriceUnitISOCode : abap.char( 3 ) ; 
 PurchaseOrderPriceUnitISOCo_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'QtyInPurchaseOrderPriceUnit_vc' 
 @Semantics.quantity.unitOfMeasure: 'PurchaseOrderPriceUnitSAPCode' 
 QtyInPurchaseOrderPriceUnit : abap.dec( 13, 3 ) ; 
 QtyInPurchaseOrderPriceUnit_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SuplrInvcDeliveryCostCndnTy_vc' 
 SuplrInvcDeliveryCostCndnType : abap.char( 4 ) ; 
 SuplrInvcDeliveryCostCndnTy_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SuplrInvcDeliveryCostCndnSt_vc' 
 SuplrInvcDeliveryCostCndnStep : abap.numc( 3 ) ; 
 SuplrInvcDeliveryCostCndnSt_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SuplrInvcDeliveryCostCndnCo_vc' 
 SuplrInvcDeliveryCostCndnCount : abap.numc( 3 ) ; 
 SuplrInvcDeliveryCostCndnCo_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SupplierInvoiceItemText_vc' 
 SupplierInvoiceItemText : abap.char( 50 ) ; 
 SupplierInvoiceItemText_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'FreightSupplier_vc' 
 FreightSupplier : abap.char( 10 ) ; 
 FreightSupplier_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'IsNotCashDiscountLiable_vc' 
 IsNotCashDiscountLiable : abap_boolean ; 
 IsNotCashDiscountLiable_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchasingDocumentItemCateg_vc' 
 PurchasingDocumentItemCategory : abap.char( 1 ) ; 
 PurchasingDocumentItemCateg_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ProductType_vc' 
 ProductType : abap.char( 2 ) ; 
 ProductType_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'RetentionAmountInDocCurrenc_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 RetentionAmountInDocCurrency : abap.curr( 14, 3 ) ; 
 RetentionAmountInDocCurrenc_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'RetentionPercentage_vc' 
 RetentionPercentage : abap.dec( 5, 2 ) ; 
 RetentionPercentage_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'RetentionDueDate_vc' 
 RetentionDueDate : rap_cp_odata_v2_edm_datetime ; 
 RetentionDueDate_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SuplrInvcItmIsNotRlvtForRtn_vc' 
 SuplrInvcItmIsNotRlvtForRtntn : abap_boolean ; 
 SuplrInvcItmIsNotRlvtForRtn_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ServiceEntrySheet_vc' 
 ServiceEntrySheet : abap.char( 10 ) ; 
 ServiceEntrySheet_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ServiceEntrySheetItem_vc' 
 ServiceEntrySheetItem : abap.numc( 10 ) ; 
 ServiceEntrySheetItem_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'TaxCountry_vc' 
 TaxCountry : abap.char( 3 ) ; 
 TaxCountry_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'IsFinallyInvoiced_vc' 
 IsFinallyInvoiced : abap_boolean ; 
 IsFinallyInvoiced_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'TaxDeterminationDate_vc' 
 TaxDeterminationDate : rap_cp_odata_v2_edm_datetime ; 
 TaxDeterminationDate_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'IN_HSNOrSACCode_vc' 
 IN_HSNOrSACCode : abap.char( 16 ) ; 
 IN_HSNOrSACCode_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'IN_CustomDutyAssessableValu_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 IN_CustomDutyAssessableValue : abap.curr( 14, 3 ) ; 
 IN_CustomDutyAssessableValu_vc : rap_cp_odata_value_control ; 
 
 @OData.property.name: 'to_SupplierInvoiceItmAcctAssgmt' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SupplierInvoiceItmAcctAssgmt : association [0..*] to ZA_SUPLRINVCITEMACCTASSGMT on 1 = 1; 
 } 
