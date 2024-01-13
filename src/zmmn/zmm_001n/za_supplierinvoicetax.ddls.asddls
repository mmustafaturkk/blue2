/********** GENERATED on 11/20/2023 at 11:58:41 by CB9980000012**************/
 @OData.entitySet.name: 'A_SupplierInvoiceTax' 
 @OData.entityType.name: 'A_SupplierInvoiceTaxType' 
 define root abstract entity ZA_SUPPLIERINVOICETAX { 
 key SupplierInvoice : abap.char( 10 ) ; 
 key FiscalYear : abap.numc( 4 ) ; 
 key TaxCode : abap.char( 2 ) ; 
 key SupplierInvoiceTaxCounter : abap.numc( 6 ) ; 
 @Odata.property.valueControl: 'DocumentCurrency_vc' 
 @Semantics.currencyCode: true 
 DocumentCurrency : abap.cuky ; 
 DocumentCurrency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxAmount_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 TaxAmount : abap.curr( 14, 3 ) ; 
 TaxAmount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxBaseAmountInTransCrcy_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 TaxBaseAmountInTransCrcy : abap.curr( 16, 3 ) ; 
 TaxBaseAmountInTransCrcy_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxJurisdiction_vc' 
 TaxJurisdiction : abap.char( 15 ) ; 
 TaxJurisdiction_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxCountry_vc' 
 TaxCountry : abap.char( 3 ) ; 
 TaxCountry_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxDeterminationDate_vc' 
 TaxDeterminationDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 TaxDeterminationDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxRateValidityStartDate_vc' 
 TaxRateValidityStartDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 TaxRateValidityStartDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
