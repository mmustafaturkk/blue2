@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'P&L report entity view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
@AbapCatalog.dataMaintenance: #DISPLAY_ONLY
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE, #CDS_MODELING_DATA_SOURCE,#EXTRACTION_DATA_SOURCE ]
define view entity ZCO_001_DD_PL_REPORT_VI_ENT
  as select distinct from ZCO_001_DD_PL_REPORT
{
  key AccountingDocument,
  key Ledger,
  key FiscalYear,
      FiscalPeriod,
      PersonnelNumber,
      Project,
      WBSElement,
      PersonFullName,
      CompanyCode,
      BaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      quantity,
      OriginCostCtrActivityType,
      CompanyCodeCurrency,
      GlobalCurrency,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      Amount_C_99999900,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      Amount_G_99999900,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      Amount_C_94308000,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      Amount_G_94308000,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      Amount_C_98888800,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      Amount_G_98888800,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      Amount_C_410,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      Amount_G_410,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      Fixed_price_global,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      fixed_price_company,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      cost_amount_global,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cost_amount_company,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      (case when ico_cost_com is not null then cast(ico_cost_com as abap.fltp)else 0 end) + (case when Amount_C_99999900 is not null then cast(Amount_C_99999900 as abap.fltp) else 0 end) as total_cost_company,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      (case when ico_cost_glo is not null then cast(ico_cost_glo as abap.fltp)else 0 end) + (case when Amount_G_99999900 is not null then cast(Amount_G_99999900 as abap.fltp) else 0 end) as total_cost_global,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      fixed_price_company2,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      fixed_price_global2,
      ico_cost_com,
      ico_cost_glo,
      //    (case when fixed_price_global2 is not null then cast(fixed_price_global2 as abap.fltp)else 0 end) + (case when Amount_G_410 is not null then cast(Amount_G_410 as abap.fltp) else 0 end) + (case when Amount_G_98888800 is not null then cast(Amount_G_98888800 as abap.fltp) else 0 end) as ico_cost_glo,
//      (case when fixed_price_company2 is not null then cast(fixed_price_company2 as abap.fltp)else 0 end) + (case when Amount_C_410 is not null then cast(Amount_C_410 as abap.fltp) else 0 end) + (case when Amount_C_98888800 is not null then cast(Amount_C_98888800 as abap.fltp) else 0 end) as total_com_income,
       (case when fixed_price_company2 is not null then cast(fixed_price_company2 as abap.fltp)else 0 end) + (case when Amount_C_410 is not null then cast(Amount_C_410 as abap.fltp) else 0 end) as total_com_income,
       (case when fixed_price_global2 is not null then cast(fixed_price_global2 as abap.fltp)else 0 end) + (case when Amount_G_410 is not null then cast(Amount_G_410 as abap.fltp) else 0 end)   as total_glo_income
//      (case when fixed_price_global2 is not null then cast(fixed_price_global2 as abap.fltp)else 0 end) + (case when Amount_G_410 is not null then cast(Amount_G_410 as abap.fltp) else 0 end) + (case when Amount_G_98888800 is not null then cast(Amount_G_98888800 as abap.fltp) else 0 end)   as total_glo_income
}
