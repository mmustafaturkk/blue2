/********** GENERATED on 11/20/2023 at 11:58:37 by CB9980000012**************/
 @OData.entitySet.name: 'A_SuplrInvcHeaderWhldgTax' 
 @OData.entityType.name: 'A_SuplrInvcHeaderWhldgTaxType' 
 define root abstract entity ZA_SUPLRINVCHEADERWHLDGTAX { 
 key SupplierInvoice : abap.char( 10 ) ; 
 key FiscalYear : abap.numc( 4 ) ; 
 key WithholdingTaxType : abap.char( 2 ) ; 
 @Odata.property.valueControl: 'DocumentCurrency_vc' 
 @Semantics.currencyCode: true 
 DocumentCurrency : abap.cuky ; 
 DocumentCurrency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WithholdingTaxCode_vc' 
 WithholdingTaxCode : abap.char( 2 ) ; 
 WithholdingTaxCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WithholdingTaxBaseAmount_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 WithholdingTaxBaseAmount : abap.curr( 16, 3 ) ; 
 WithholdingTaxBaseAmount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ManuallyEnteredWhldgTaxAmou_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 ManuallyEnteredWhldgTaxAmount : abap.curr( 16, 3 ) ; 
 ManuallyEnteredWhldgTaxAmou_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
