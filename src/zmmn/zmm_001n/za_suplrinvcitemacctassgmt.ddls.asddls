/********** GENERATED on 11/20/2023 at 11:58:39 by CB9980000012**************/
 @OData.entitySet.name: 'A_SuplrInvcItemAcctAssgmt' 
 @OData.entityType.name: 'A_SuplrInvcItemAcctAssgmtType' 
 define root abstract entity ZA_SUPLRINVCITEMACCTASSGMT { 
 key SupplierInvoice : abap.char( 10 ) ; 
 key FiscalYear : abap.numc( 4 ) ; 
 key SupplierInvoiceItem : abap.numc( 6 ) ; 
 key OrdinalNumber : abap.numc( 4 ) ; 
 @Odata.property.valueControl: 'CostCenter_vc' 
 CostCenter : abap.char( 10 ) ; 
 CostCenter_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ControllingArea_vc' 
 ControllingArea : abap.char( 4 ) ; 
 ControllingArea_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BusinessArea_vc' 
 BusinessArea : abap.char( 4 ) ; 
 BusinessArea_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProfitCenter_vc' 
 ProfitCenter : abap.char( 10 ) ; 
 ProfitCenter_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FunctionalArea_vc' 
 FunctionalArea : abap.char( 16 ) ; 
 FunctionalArea_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'GLAccount_vc' 
 GLAccount : abap.char( 10 ) ; 
 GLAccount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SalesOrder_vc' 
 SalesOrder : abap.char( 10 ) ; 
 SalesOrder_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SalesOrderItem_vc' 
 SalesOrderItem : abap.numc( 6 ) ; 
 SalesOrderItem_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CostObject_vc' 
 CostObject : abap.char( 12 ) ; 
 CostObject_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CostCtrActivityType_vc' 
 CostCtrActivityType : abap.char( 6 ) ; 
 CostCtrActivityType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BusinessProcess_vc' 
 BusinessProcess : abap.char( 12 ) ; 
 BusinessProcess_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WBSElement_vc' 
 WBSElement : abap.numc( 24 ) ; 
 WBSElement_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DocumentCurrency_vc' 
 @Semantics.currencyCode: true 
 DocumentCurrency : abap.cuky ; 
 DocumentCurrency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SuplrInvcAcctAssignmentAmou_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 SuplrInvcAcctAssignmentAmount : abap.curr( 14, 3 ) ; 
 SuplrInvcAcctAssignmentAmou_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseOrderQuantityUnit_vc' 
 PurchaseOrderQuantityUnit : abap.char( 3 ) ; 
 PurchaseOrderQuantityUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseOrderQtyUnitSAPCode_vc' 
 @Semantics.unitOfMeasure: true 
 PurchaseOrderQtyUnitSAPCode : abap.unit( 3 ) ; 
 PurchaseOrderQtyUnitSAPCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseOrderQtyUnitISOCode_vc' 
 PurchaseOrderQtyUnitISOCode : abap.char( 3 ) ; 
 PurchaseOrderQtyUnitISOCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Quantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQtyUnitSAPCode' 
 Quantity : abap.dec( 13, 3 ) ; 
 Quantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxCode_vc' 
 TaxCode : abap.char( 2 ) ; 
 TaxCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AccountAssignmentNumber_vc' 
 AccountAssignmentNumber : abap.numc( 2 ) ; 
 AccountAssignmentNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AccountAssignmentIsUnplanne_vc' 
 AccountAssignmentIsUnplanned : abap_boolean ; 
 AccountAssignmentIsUnplanne_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PersonnelNumber_vc' 
 PersonnelNumber : abap.numc( 8 ) ; 
 PersonnelNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WorkItem_vc' 
 WorkItem : abap.char( 10 ) ; 
 WorkItem_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MasterFixedAsset_vc' 
 MasterFixedAsset : abap.char( 12 ) ; 
 MasterFixedAsset_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FixedAsset_vc' 
 FixedAsset : abap.char( 4 ) ; 
 FixedAsset_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DebitCreditCode_vc' 
 DebitCreditCode : abap.char( 1 ) ; 
 DebitCreditCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxJurisdiction_vc' 
 TaxJurisdiction : abap.char( 15 ) ; 
 TaxJurisdiction_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InternalOrder_vc' 
 InternalOrder : abap.char( 12 ) ; 
 InternalOrder_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProjectNetworkInternalID_vc' 
 ProjectNetworkInternalID : abap.numc( 10 ) ; 
 ProjectNetworkInternalID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'NetworkActivityInternalID_vc' 
 NetworkActivityInternalID : abap.numc( 10 ) ; 
 NetworkActivityInternalID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProjectNetwork_vc' 
 ProjectNetwork : abap.char( 12 ) ; 
 ProjectNetwork_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'NetworkActivity_vc' 
 NetworkActivity : abap.char( 4 ) ; 
 NetworkActivity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CommitmentItem_vc' 
 CommitmentItem : abap.char( 24 ) ; 
 CommitmentItem_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FundsCenter_vc' 
 FundsCenter : abap.char( 16 ) ; 
 FundsCenter_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Fund_vc' 
 Fund : abap.char( 10 ) ; 
 Fund_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'GrantID_vc' 
 GrantID : abap.char( 20 ) ; 
 GrantID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PartnerBusinessArea_vc' 
 PartnerBusinessArea : abap.char( 4 ) ; 
 PartnerBusinessArea_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CompanyCode_vc' 
 CompanyCode : abap.char( 4 ) ; 
 CompanyCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SuplrInvcAccountAssignmentT_vc' 
 SuplrInvcAccountAssignmentText : abap.char( 50 ) ; 
 SuplrInvcAccountAssignmentT_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseOrderPriceUnit_vc' 
 PurchaseOrderPriceUnit : abap.char( 3 ) ; 
 PurchaseOrderPriceUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseOrderPriceUnitSAPCo_vc' 
 @Semantics.unitOfMeasure: true 
 PurchaseOrderPriceUnitSAPCode : abap.unit( 3 ) ; 
 PurchaseOrderPriceUnitSAPCo_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseOrderPriceUnitISOCo_vc' 
 PurchaseOrderPriceUnitISOCode : abap.char( 3 ) ; 
 PurchaseOrderPriceUnitISOCo_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'QuantityInPurchaseOrderUnit_vc' 
 @Semantics.quantity.unitOfMeasure: 'PurchaseOrderPriceUnitSAPCode' 
 QuantityInPurchaseOrderUnit : abap.dec( 13, 3 ) ; 
 QuantityInPurchaseOrderUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProfitabilitySegment_vc' 
 ProfitabilitySegment : abap.char( 10 ) ; 
 ProfitabilitySegment_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BudgetPeriod_vc' 
 BudgetPeriod : abap.char( 10 ) ; 
 BudgetPeriod_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxCountry_vc' 
 TaxCountry : abap.char( 3 ) ; 
 TaxCountry_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxDeterminationDate_vc' 
 TaxDeterminationDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 TaxDeterminationDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
