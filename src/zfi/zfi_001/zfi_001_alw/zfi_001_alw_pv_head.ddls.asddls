@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header'
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
define root view entity ZFI_001_ALW_PV_HEAD
  provider contract transactional_query
  as projection on ZFI_001_ALW_DD_HEAD
{
  key HeaderUuid,
      Refdoc,
      Bustratype,
      Accdoctype,
      Docno,
      Comcode,
      Docdate,
      Pastdate,
      Taxdetdate,
      Traexpclaim,
      Traorder,
      Persname,
      Positionn,
      Onbustripfor,
      Purtravel1,
      Purtravel2,
      Purtravel3,
      Purtravel4,
      Country1,
      Country2,
      Country3,
      Country4,
      Tradeparture,
      Traarrival,
      Identifiedby,
      Signaturedate,
      Attachment,
      Mimetype,
      Filename,
      Dob,
      Lastchangedat,
      Locallastchangedat,
      /* Associations */
      _Item : redirected to composition child ZFI_001_ALW_PV_ITEM

}
