/********** GENERATED on 11/20/2023 at 11:58:41 by CB9980000012**************/
 @OData.entitySet.name: 'A_SupplierInvoiceItemGLAcct' 
 @OData.entityType.name: 'A_SupplierInvoiceItemGLAcctType' 
 define root abstract entity ZA_SUPPLIERINVOICEITEMGLACCT { 
 key SupplierInvoice : abap.char( 10 ) ; 
 key FiscalYear : abap.numc( 4 ) ; 
 key SupplierInvoiceItem : abap.numc( 4 ) ; 
 @OData.property.valueControl: 'CompanyCode_vc' 
 CompanyCode : abap.char( 4 ) ; 
 CompanyCode_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'CostCenter_vc' 
 CostCenter : abap.char( 10 ) ; 
 CostCenter_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ControllingArea_vc' 
 ControllingArea : abap.char( 4 ) ; 
 ControllingArea_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'BusinessArea_vc' 
 BusinessArea : abap.char( 4 ) ; 
 BusinessArea_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ProfitCenter_vc' 
 ProfitCenter : abap.char( 10 ) ; 
 ProfitCenter_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'FunctionalArea_vc' 
 FunctionalArea : abap.char( 16 ) ; 
 FunctionalArea_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'GLAccount_vc' 
 GLAccount : abap.char( 10 ) ; 
 GLAccount_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SalesOrder_vc' 
 SalesOrder : abap.char( 10 ) ; 
 SalesOrder_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SalesOrderItem_vc' 
 SalesOrderItem : abap.numc( 6 ) ; 
 SalesOrderItem_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'CostObject_vc' 
 CostObject : abap.char( 12 ) ; 
 CostObject_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'CostCtrActivityType_vc' 
 CostCtrActivityType : abap.char( 6 ) ; 
 CostCtrActivityType_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'BusinessProcess_vc' 
 BusinessProcess : abap.char( 12 ) ; 
 BusinessProcess_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'WBSElement_vc' 
 WBSElement : abap.char( 24 ) ; 
 WBSElement_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DocumentCurrency_vc' 
 @Semantics.currencyCode: true 
 DocumentCurrency : abap.cuky ; 
 DocumentCurrency_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SupplierInvoiceItemAmount_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 SupplierInvoiceItemAmount : abap.curr( 14, 3 ) ; 
 SupplierInvoiceItemAmount_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'TaxCode_vc' 
 TaxCode : abap.char( 2 ) ; 
 TaxCode_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PersonnelNumber_vc' 
 PersonnelNumber : abap.numc( 8 ) ; 
 PersonnelNumber_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'WorkItem_vc' 
 WorkItem : abap.char( 10 ) ; 
 WorkItem_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DebitCreditCode_vc' 
 DebitCreditCode : abap.char( 1 ) ; 
 DebitCreditCode_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'TaxJurisdiction_vc' 
 TaxJurisdiction : abap.char( 15 ) ; 
 TaxJurisdiction_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SupplierInvoiceItemText_vc' 
 SupplierInvoiceItemText : abap.char( 50 ) ; 
 SupplierInvoiceItemText_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'AssignmentReference_vc' 
 AssignmentReference : abap.char( 18 ) ; 
 AssignmentReference_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'IsNotCashDiscountLiable_vc' 
 IsNotCashDiscountLiable : abap_boolean ; 
 IsNotCashDiscountLiable_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'InternalOrder_vc' 
 InternalOrder : abap.char( 12 ) ; 
 InternalOrder_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ProjectNetwork_vc' 
 ProjectNetwork : abap.char( 12 ) ; 
 ProjectNetwork_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'NetworkActivity_vc' 
 NetworkActivity : abap.char( 4 ) ; 
 NetworkActivity_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'CommitmentItem_vc' 
 CommitmentItem : abap.char( 24 ) ; 
 CommitmentItem_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'FundsCenter_vc' 
 FundsCenter : abap.char( 16 ) ; 
 FundsCenter_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'TaxBaseAmountInTransCrcy_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 TaxBaseAmountInTransCrcy : abap.curr( 14, 3 ) ; 
 TaxBaseAmountInTransCrcy_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Fund_vc' 
 Fund : abap.char( 10 ) ; 
 Fund_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'GrantID_vc' 
 GrantID : abap.char( 20 ) ; 
 GrantID_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'QuantityUnit_vc' 
 QuantityUnit : abap.char( 3 ) ; 
 QuantityUnit_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SuplrInvcItmQtyUnitSAPCode_vc' 
 @Semantics.unitOfMeasure: true 
 SuplrInvcItmQtyUnitSAPCode : abap.unit( 3 ) ; 
 SuplrInvcItmQtyUnitSAPCode_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SuplrInvcItmQtyUnitISOCode_vc' 
 SuplrInvcItmQtyUnitISOCode : abap.char( 3 ) ; 
 SuplrInvcItmQtyUnitISOCode_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Quantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'SuplrInvcItmQtyUnitSAPCode' 
 Quantity : abap.dec( 13, 3 ) ; 
 Quantity_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PartnerBusinessArea_vc' 
 PartnerBusinessArea : abap.char( 4 ) ; 
 PartnerBusinessArea_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'FinancialTransactionType_vc' 
 FinancialTransactionType : abap.char( 3 ) ; 
 FinancialTransactionType_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'TaxCountry_vc' 
 TaxCountry : abap.char( 3 ) ; 
 TaxCountry_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'EarmarkedFundsDocument_vc' 
 EarmarkedFundsDocument : abap.char( 10 ) ; 
 EarmarkedFundsDocument_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'EarmarkedFundsDocumentItem_vc' 
 EarmarkedFundsDocumentItem : abap.numc( 3 ) ; 
 EarmarkedFundsDocumentItem_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'BudgetPeriod_vc' 
 BudgetPeriod : abap.char( 10 ) ; 
 BudgetPeriod_vc : rap_cp_odata_value_control ; 
 
 } 
