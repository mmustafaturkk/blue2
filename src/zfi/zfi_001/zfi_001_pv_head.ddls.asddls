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
define root view entity ZFI_001_PV_HEAD
  as projection on ZFI_001_DD_HEAD
{
      //      @Search.defaultSearchElement: true
  key HeaderUuid,
//      Refdoc,
//      Bustratype,
//      Accdoctype,
      docno,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_CompanyCode', element: 'CompanyCode' }}]
      Comcode,
      Docdate,
      Pastdate,
      Taxdetdate,
//      traexpclaim,
//      traorder,
//      persname,
//      positionn,
//      onbustripfor,
//      purtravel1,
//      purtravel2,
//      purtravel3,
//      purtravel4,
//      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Country', element: 'Country' }}]
//      country1,
//      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Country', element: 'Country' }}]
//      country2,
//      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Country', element: 'Country' }}]
//      country3,
//      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Country', element: 'Country' }}]
//      country4,
//      tradeparture,
//      traarrival,
//      identifiedby,
//      signaturedate,
      Createdby,
      Createdat,
      /* Associations */
      _Item : redirected to composition child ZFI_001_PV_ITEM
}
