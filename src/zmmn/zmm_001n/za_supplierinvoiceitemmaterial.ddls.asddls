/********** GENERATED on 11/20/2023 at 11:58:41 by CB9980000012**************/
 @OData.entitySet.name: 'A_SupplierInvoiceItemMaterial' 
 @OData.entityType.name: 'A_SupplierInvoiceItemMaterialType' 
 define root abstract entity ZA_SUPPLIERINVOICEITEMMATERIAL { 
 key SupplierInvoice : abap.char( 10 ) ; 
 key FiscalYear : abap.numc( 4 ) ; 
 key SupplierInvoiceItem : abap.numc( 6 ) ; 
 @Odata.property.valueControl: 'Material_vc' 
 Material : abap.char( 40 ) ; 
 Material_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValuationArea_vc' 
 ValuationArea : abap.char( 4 ) ; 
 ValuationArea_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CompanyCode_vc' 
 CompanyCode : abap.char( 4 ) ; 
 CompanyCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Plant_vc' 
 Plant : abap.char( 4 ) ; 
 Plant_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InventoryValuationType_vc' 
 InventoryValuationType : abap.char( 10 ) ; 
 InventoryValuationType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
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
 @Odata.property.valueControl: 'DocumentCurrency_vc' 
 @Semantics.currencyCode: true 
 DocumentCurrency : abap.cuky ; 
 DocumentCurrency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplierInvoiceItemAmount_vc' 
 @Semantics.amount.currencyCode: 'DocumentCurrency' 
 SupplierInvoiceItemAmount : abap.curr( 14, 3 ) ; 
 SupplierInvoiceItemAmount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'QuantityUnit_vc' 
 QuantityUnit : abap.char( 3 ) ; 
 QuantityUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SuplrInvcItmQtyUnitSAPCode_vc' 
 @Semantics.unitOfMeasure: true 
 SuplrInvcItmQtyUnitSAPCode : abap.unit( 3 ) ; 
 SuplrInvcItmQtyUnitSAPCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SuplrInvcItmQtyUnitISOCode_vc' 
 SuplrInvcItmQtyUnitISOCode : abap.char( 3 ) ; 
 SuplrInvcItmQtyUnitISOCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Quantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'SuplrInvcItmQtyUnitSAPCode' 
 Quantity : abap.dec( 13, 3 ) ; 
 Quantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DebitCreditCode_vc' 
 DebitCreditCode : abap.char( 1 ) ; 
 DebitCreditCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsNotCashDiscountLiable_vc' 
 IsNotCashDiscountLiable : abap_boolean ; 
 IsNotCashDiscountLiable_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
