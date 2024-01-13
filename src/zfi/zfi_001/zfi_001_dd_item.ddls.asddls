@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data def. for Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZFI_001_DD_ITEM
  as select from zfi_001_t_item
  association to parent ZFI_001_DD_HEAD as _Header on $projection.HeaderUuid = _Header.HeaderUuid
{
  key item_uuid    as ItemUuid,
      header_uuid  as HeaderUuid,
      refdocitem   as Refdocitem,
      glacc        as Glacc,
      @Semantics.amount.currencyCode: 'Currcode'
      amnintracur  as Amnintracur,
      currcode     as Currcode,
      debcrecode   as Debcrecode,
      docitemtext  as Docitemtext,
      taxcode      as Taxcode,
      costcenter   as Costcenter,
      profitcenter as Profitcenter,
      segment      as Segment,
      funcarea     as Funcarea,
      valdate      as Valdate,
      housebank    as Housebank,
      housebankacc as Housebankacc,
      taxclas      as Taxclas,
      contype      as Contype,
      @Semantics.amount.currencyCode: 'Currcode'
      taxbaseamnt  as Taxbaseamnt,
      _Header
}
