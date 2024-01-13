/********** GENERATED on 11/20/2023 at 11:58:40 by CB9980000012**************/
 @OData.entitySet.name: 'A_SupplierInvoiceItemAsset' 
 @OData.entityType.name: 'A_SupplierInvoiceItemAssetType' 
 define root abstract entity ZA_SUPPLIERINVOICEITEMASSET { 
 key SupplierInvoice : abap.char( 10 ) ; 
 key FiscalYear : abap.numc( 4 ) ; 
 key SupplierInvoiceItem : abap.numc( 4 ) ; 
 @Odata.property.valueControl: 'CompanyCode_vc' 
 CompanyCode : abap.char( 4 ) ; 
 CompanyCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MasterFixedAsset_vc' 
 MasterFixedAsset : abap.char( 12 ) ; 
 MasterFixedAsset_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FixedAsset_vc' 
 FixedAsset : abap.char( 4 ) ; 
 FixedAsset_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProfitCenter_vc' 
 ProfitCenter : abap.char( 10 ) ; 
 ProfitCenter_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'GLAccount_vc' 
 GLAccount : abap.char( 10 ) ; 
 GLAccount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DocumentCurrency_vc' 
 @Semantics.currencyCode: true 
 DocumentCurrency : abap.cuky ; 
 DocumentCurrency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplierInvoiceItemAmount_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 SupplierInvoiceItemAmount : abap.curr( 14, 3 ) ; 
 SupplierInvoiceItemAmount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxCode_vc' 
 TaxCode : abap.char( 2 ) ; 
 TaxCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxJurisdiction_vc' 
 TaxJurisdiction : abap.char( 15 ) ; 
 TaxJurisdiction_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxCountry_vc' 
 TaxCountry : abap.char( 3 ) ; 
 TaxCountry_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxDeterminationDate_vc' 
 TaxDeterminationDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 TaxDeterminationDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DebitCreditCode_vc' 
 DebitCreditCode : abap.char( 1 ) ; 
 DebitCreditCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplierInvoiceItemText_vc' 
 SupplierInvoiceItemText : abap.char( 50 ) ; 
 SupplierInvoiceItemText_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AssignmentReference_vc' 
 AssignmentReference : abap.char( 18 ) ; 
 AssignmentReference_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsNotCashDiscountLiable_vc' 
 IsNotCashDiscountLiable : abap_boolean ; 
 IsNotCashDiscountLiable_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AssetValueDate_vc' 
 AssetValueDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 AssetValueDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
