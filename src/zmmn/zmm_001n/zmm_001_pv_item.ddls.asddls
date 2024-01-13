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
define view entity ZMM_001_PV_ITEM
  as projection on ZMM_001_DD_ITEM
{
      @Search.defaultSearchElement: true
  key ItemUuid,
      HeaderUuid,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_ProductGroup_2', element: 'ProductGroup' } }]
      Matgr,
      //    @Consumption.valueHelpDefinition: [ { entity: { name: 'zmm_001_dd_productgroup', element: 'ProductGroupText' } }]
      Poritex,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Plant', element: 'Plant' } }]
      Plant,
      @Semantics.amount.currencyCode: 'Currcode'
      Netpr,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Currency', element: 'Currency' } }]
      Currcode,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZMM_001_DD_WBSELEMENTVH', element: 'WBSElement' } }]
      Wbsel,
      /* Associations */
      _Header : redirected to parent ZMM_001_PV_HEADER
}
