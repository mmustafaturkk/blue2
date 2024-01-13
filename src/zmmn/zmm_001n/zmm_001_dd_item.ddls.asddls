@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data def. for Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZMM_001_DD_ITEM
  as select from zmm_001_t_item
  association to parent ZMM_001_DD_HEADER as _Header on $projection.HeaderUuid = _Header.HeaderUuid
{
  key item_uuid   as ItemUuid,
      header_uuid as HeaderUuid,
      @EndUserText.label: 'Material Group'
      matgr       as Matgr,
      @EndUserText.label: 'ITEM TEXT'
      poritex     as Poritex,
      @EndUserText.label: 'PLANT'
      plant       as Plant,
      @Semantics.amount.currencyCode: 'Currcode'
      @EndUserText.label: 'PRICE'
      netpr       as Netpr,
      @EndUserText.label: 'CURRENCY'
      currcode    as Currcode,
      @EndUserText.label: 'PROJECT ID'
      wbsel       as Wbsel,

      _Header
}
