//@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Header'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZMM_001_PV_HEADER
  provider contract transactional_query
  as projection on ZMM_001_DD_HEADER
{
  key HeaderUuid,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_CompanyCode', element: 'CompanyCode' }}]
      Comcode,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Supplier', element: 'Supplier' }}]
      Supplier,
      Pordate,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Currency', element: 'Currency' }}]
      Doccur,
      Docno,
      Createdby,
      Createdat,
      /* Associations */
      _Item : redirected to composition child ZMM_001_PV_ITEM
}
