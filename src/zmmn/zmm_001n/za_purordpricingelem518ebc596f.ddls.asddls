/********** GENERATED on 11/18/2023 at 12:02:53 by CB9980000012**************/
 @OData.entitySet.name: 'A_PurOrdPricingElement' 
 @OData.entityType.name: 'A_PurOrdPricingElementType' 
 define root abstract entity ZA_PURORDPRICINGELEM518EBC596F { 
 key PurchaseOrder : abap.char( 10 ) ; 
 key PurchaseOrderItem : abap.numc( 5 ) ; 
 key PricingDocument : abap.char( 10 ) ; 
 key PricingDocumentItem : abap.numc( 6 ) ; 
 key PricingProcedureStep : abap.numc( 3 ) ; 
 key PricingProcedureCounter : abap.numc( 3 ) ; 
 @Odata.property.valueControl: 'ConditionType_vc' 
 ConditionType : abap.char( 4 ) ; 
 ConditionType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionRateValue_vc' 
 ConditionRateValue : abap.fltp ; 
 ConditionRateValue_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionCurrency_vc' 
 ConditionCurrency : abap.char( 5 ) ; 
 ConditionCurrency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PriceDetnExchangeRate_vc' 
 PriceDetnExchangeRate : abap.char( 12 ) ; 
 PriceDetnExchangeRate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TransactionCurrency_vc' 
 @Semantics.currencyCode: true 
 TransactionCurrency : abap.cuky ; 
 TransactionCurrency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionAmount_vc' 
 @Semantics.amount.currencyCode: 'TransactionCurrency' 
 ConditionAmount : abap.curr( 16, 3 ) ; 
 ConditionAmount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionQuantityUnit_vc' 
 @Semantics.unitOfMeasure: true 
 ConditionQuantityUnit : abap.unit( 3 ) ; 
 ConditionQuantityUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'ConditionQuantityUnit' 
 ConditionQuantity : abap.dec( 5, 0 ) ; 
 ConditionQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionApplication_vc' 
 ConditionApplication : abap.char( 2 ) ; 
 ConditionApplication_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PricingDateTime_vc' 
 PricingDateTime : abap.char( 14 ) ; 
 PricingDateTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionCalculationType_vc' 
 ConditionCalculationType : abap.char( 3 ) ; 
 ConditionCalculationType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionBaseValue_vc' 
 ConditionBaseValue : abap.fltp ; 
 ConditionBaseValue_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionToBaseQtyNmrtr_vc' 
 ConditionToBaseQtyNmrtr : abap.dec( 10, 0 ) ; 
 ConditionToBaseQtyNmrtr_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionToBaseQtyDnmntr_vc' 
 ConditionToBaseQtyDnmntr : abap.dec( 10, 0 ) ; 
 ConditionToBaseQtyDnmntr_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionCategory_vc' 
 ConditionCategory : abap.char( 1 ) ; 
 ConditionCategory_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionIsForStatistics_vc' 
 ConditionIsForStatistics : abap_boolean ; 
 ConditionIsForStatistics_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PricingScaleType_vc' 
 PricingScaleType : abap.char( 1 ) ; 
 PricingScaleType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsRelevantForAccrual_vc' 
 IsRelevantForAccrual : abap_boolean ; 
 IsRelevantForAccrual_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CndnIsRelevantForInvoiceLis_vc' 
 CndnIsRelevantForInvoiceList : abap.char( 1 ) ; 
 CndnIsRelevantForInvoiceLis_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionOrigin_vc' 
 ConditionOrigin : abap.char( 1 ) ; 
 ConditionOrigin_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsGroupCondition_vc' 
 IsGroupCondition : abap.char( 1 ) ; 
 IsGroupCondition_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CndnIsRelevantForLimitValue_vc' 
 CndnIsRelevantForLimitValue : abap_boolean ; 
 CndnIsRelevantForLimitValue_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionSequentialNumber_vc' 
 ConditionSequentialNumber : abap.numc( 3 ) ; 
 ConditionSequentialNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionControl_vc' 
 ConditionControl : abap.char( 1 ) ; 
 ConditionControl_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionInactiveReason_vc' 
 ConditionInactiveReason : abap.char( 1 ) ; 
 ConditionInactiveReason_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionClass_vc' 
 ConditionClass : abap.char( 1 ) ; 
 ConditionClass_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FactorForConditionBasisValu_vc' 
 FactorForConditionBasisValue : abap.fltp ; 
 FactorForConditionBasisValu_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PricingScaleBasis_vc' 
 PricingScaleBasis : abap.char( 3 ) ; 
 PricingScaleBasis_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionScaleBasisValue_vc' 
 ConditionScaleBasisValue : abap.fltp ; 
 ConditionScaleBasisValue_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionScaleBasisCurrency_vc' 
 ConditionScaleBasisCurrency : abap.char( 5 ) ; 
 ConditionScaleBasisCurrency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionScaleBasisUnit_vc' 
 ConditionScaleBasisUnit : abap.char( 3 ) ; 
 ConditionScaleBasisUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CndnIsRelevantForIntcoBilli_vc' 
 CndnIsRelevantForIntcoBilling : abap_boolean ; 
 CndnIsRelevantForIntcoBilli_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionIsForConfiguration_vc' 
 ConditionIsForConfiguration : abap_boolean ; 
 ConditionIsForConfiguration_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionIsManuallyChanged_vc' 
 ConditionIsManuallyChanged : abap_boolean ; 
 ConditionIsManuallyChanged_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionRecord_vc' 
 ConditionRecord : abap.char( 10 ) ; 
 ConditionRecord_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AccessNumberOfAccessSequenc_vc' 
 AccessNumberOfAccessSequence : abap.numc( 3 ) ; 
 AccessNumberOfAccessSequenc_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
