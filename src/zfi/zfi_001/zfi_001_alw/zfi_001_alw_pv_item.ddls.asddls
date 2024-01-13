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
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'View for Attachment'
define view entity ZFI_001_ALW_PV_ITEM
  as projection on ZFI_001_ALW_DD_ITEM
{
      @Search.defaultSearchElement: true
  key ItemUuid,
      HeaderUuid,
      Refdocitem,
      Glacc,
      @Semantics.amount.currencyCode: 'Currcode'
      Amnintracur,
      Currcode,
      Debcrecode,
      Docitemtext,
      Taxcode,
      Costcenter,
      Profitcenter,
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
      _Header : redirected to parent ZFI_001_ALW_PV_HEAD
}
