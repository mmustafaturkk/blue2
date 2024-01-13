/********** GENERATED on 11/18/2023 at 12:02:53 by CB9980000012**************/
 @OData.entitySet.name: 'A_PurOrdAccountAssignment' 
 @OData.entityType.name: 'A_PurOrdAccountAssignmentType' 
 define root abstract entity ZA_PURORDACCOUNTASSIB5F24E7592 { 
 key PurchaseOrder : abap.char( 10 ) ; 
 key PurchaseOrderItem : abap.numc( 5 ) ; 
 key AccountAssignmentNumber : abap.numc( 2 ) ; 
 @Odata.property.valueControl: 'IsDeleted_vc' 
 IsDeleted : abap_boolean ; 
 IsDeleted_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseOrderQuantityUnit_vc' 
 @Semantics.unitOfMeasure: true 
 PurchaseOrderQuantityUnit : abap.unit( 3 ) ; 
 PurchaseOrderQuantityUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Quantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit' 
 Quantity : abap.dec( 13, 3 ) ; 
 Quantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MultipleAcctAssgmtDistrPerc_vc' 
 MultipleAcctAssgmtDistrPercent : abap.dec( 3, 1 ) ; 
 MultipleAcctAssgmtDistrPerc_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DocumentCurrency_vc' 
 @Semantics.currencyCode: true 
 DocumentCurrency : abap.cuky ; 
 DocumentCurrency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurgDocNetAmount_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 PurgDocNetAmount : abap.curr( 14, 3 ) ; 
 PurgDocNetAmount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'GLAccount_vc' 
 GLAccount : abap.char( 10 ) ; 
 GLAccount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BusinessArea_vc' 
 BusinessArea : abap.char( 4 ) ; 
 BusinessArea_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CostCenter_vc' 
 CostCenter : abap.char( 10 ) ; 
 CostCenter_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SalesOrder_vc' 
 SalesOrder : abap.char( 10 ) ; 
 SalesOrder_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SalesOrderItem_vc' 
 SalesOrderItem : abap.numc( 6 ) ; 
 SalesOrderItem_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SalesOrderScheduleLine_vc' 
 SalesOrderScheduleLine : abap.numc( 4 ) ; 
 SalesOrderScheduleLine_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MasterFixedAsset_vc' 
 MasterFixedAsset : abap.char( 12 ) ; 
 MasterFixedAsset_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FixedAsset_vc' 
 FixedAsset : abap.char( 4 ) ; 
 FixedAsset_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'GoodsRecipientName_vc' 
 GoodsRecipientName : abap.char( 12 ) ; 
 GoodsRecipientName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'UnloadingPointName_vc' 
 UnloadingPointName : abap.char( 25 ) ; 
 UnloadingPointName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ControllingArea_vc' 
 ControllingArea : abap.char( 4 ) ; 
 ControllingArea_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CostObject_vc' 
 CostObject : abap.char( 12 ) ; 
 CostObject_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OrderID_vc' 
 OrderID : abap.char( 12 ) ; 
 OrderID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProfitCenter_vc' 
 ProfitCenter : abap.char( 10 ) ; 
 ProfitCenter_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WBSElementInternalID_vc' 
 WBSElementInternalID : abap.numc( 24 ) ; 
 WBSElementInternalID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WBSElement_vc' 
 WBSElement : abap.char( 24 ) ; 
 WBSElement_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WBSElementExternalID_vc' 
 WBSElementExternalID : abap.char( 24 ) ; 
 WBSElementExternalID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProjectNetwork_vc' 
 ProjectNetwork : abap.char( 12 ) ; 
 ProjectNetwork_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'NetworkActivity_vc' 
 NetworkActivity : abap.char( 4 ) ; 
 NetworkActivity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RealEstateObject_vc' 
 RealEstateObject : abap.char( 40 ) ; 
 RealEstateObject_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PartnerAccountNumber_vc' 
 PartnerAccountNumber : abap.char( 10 ) ; 
 PartnerAccountNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CommitmentItem_vc' 
 CommitmentItem : abap.char( 24 ) ; 
 CommitmentItem_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'JointVentureRecoveryCode_vc' 
 JointVentureRecoveryCode : abap.char( 2 ) ; 
 JointVentureRecoveryCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FundsCenter_vc' 
 FundsCenter : abap.char( 16 ) ; 
 FundsCenter_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Fund_vc' 
 Fund : abap.char( 10 ) ; 
 Fund_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FunctionalArea_vc' 
 FunctionalArea : abap.char( 16 ) ; 
 FunctionalArea_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SettlementReferenceDate_vc' 
 SettlementReferenceDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 SettlementReferenceDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxCode_vc' 
 TaxCode : abap.char( 2 ) ; 
 TaxCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxJurisdiction_vc' 
 TaxJurisdiction : abap.char( 15 ) ; 
 TaxJurisdiction_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CostCtrActivityType_vc' 
 CostCtrActivityType : abap.char( 6 ) ; 
 CostCtrActivityType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BusinessProcess_vc' 
 BusinessProcess : abap.char( 12 ) ; 
 BusinessProcess_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'EarmarkedFundsDocument_vc' 
 EarmarkedFundsDocument : abap.char( 10 ) ; 
 EarmarkedFundsDocument_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'GrantID_vc' 
 GrantID : abap.char( 20 ) ; 
 GrantID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BudgetPeriod_vc' 
 BudgetPeriod : abap.char( 10 ) ; 
 BudgetPeriod_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
