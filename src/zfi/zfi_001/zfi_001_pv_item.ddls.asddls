@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for Item'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZFI_001_PV_ITEM
  as projection on ZFI_001_DD_ITEM
{
      @Search.defaultSearchElement: true
  key ItemUuid,
      HeaderUuid,
      Refdocitem,
      Glacc,
      @Semantics.amount.currencyCode: 'Currcode'
      Amnintracur,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Currency', element: 'Currency' }}]
      Currcode,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZFI_000_DD_DBTCRD_VH', element: 'Text' }}]
      Debcrecode,
      Docitemtext,
      Taxcode,
      Costcenter,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_ProfitCenter', element: 'ProfitCenter' }}]
      Profitcenter,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_ProfitCenter', element: 'Segment' }}]
      Segment,
      Funcarea,
      Valdate,
      Housebank,
      Housebankacc,
      Taxclas,
      Contype,
      @Semantics.amount.currencyCode: 'Currcode'
      Taxbaseamnt,
      /* Associations */
      _Header : redirected to parent ZFI_001_PV_HEAD
}
