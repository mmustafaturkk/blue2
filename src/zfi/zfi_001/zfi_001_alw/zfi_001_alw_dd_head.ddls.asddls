@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Allowance App Header Data Definition'
define root view entity ZFI_001_ALW_DD_HEAD
  as select from zfi_001_t_alw_h
  composition [1..*] of ZFI_001_ALW_DD_ITEM as _Item
{
  key zfi_001_t_alw_h.header_uuid        as HeaderUuid,
      zfi_001_t_alw_h.refdoc             as Refdoc,
      zfi_001_t_alw_h.bustratype         as Bustratype,
      zfi_001_t_alw_h.accdoctype         as Accdoctype,
      zfi_001_t_alw_h.docno              as Docno,
      zfi_001_t_alw_h.comcode            as Comcode,
      zfi_001_t_alw_h.docdate            as Docdate,
      zfi_001_t_alw_h.pastdate           as Pastdate,
      zfi_001_t_alw_h.taxdetdate         as Taxdetdate,
      zfi_001_t_alw_h.traexpclaim        as Traexpclaim,
      zfi_001_t_alw_h.traorder           as Traorder,
      zfi_001_t_alw_h.persname           as Persname,
      zfi_001_t_alw_h.positionn          as Positionn,
      zfi_001_t_alw_h.onbustripfor       as Onbustripfor,
      zfi_001_t_alw_h.purtravel1         as Purtravel1,
      zfi_001_t_alw_h.purtravel2         as Purtravel2,
      zfi_001_t_alw_h.purtravel3         as Purtravel3,
      zfi_001_t_alw_h.purtravel4         as Purtravel4,
      zfi_001_t_alw_h.country1           as Country1,
      zfi_001_t_alw_h.country2           as Country2,
      zfi_001_t_alw_h.country3           as Country3,
      zfi_001_t_alw_h.country4           as Country4,
      zfi_001_t_alw_h.tradeparture       as Tradeparture,
      zfi_001_t_alw_h.traarrival         as Traarrival,
      zfi_001_t_alw_h.identifiedby       as Identifiedby,
      zfi_001_t_alw_h.signaturedate      as Signaturedate,
       @Semantics.largeObject:{
        mimeType: 'Mimetype',
        fileName: 'Filename',
        contentDispositionPreference: #INLINE
    }
      zfi_001_t_alw_h.attachment         as Attachment,
      zfi_001_t_alw_h.mimetype           as Mimetype,
      zfi_001_t_alw_h.filename           as Filename,
      zfi_001_t_alw_h.dob                as Dob,
      zfi_001_t_alw_h.lastchangedat      as Lastchangedat,
      zfi_001_t_alw_h.locallastchangedat as Locallastchangedat,
      _Item // Make association public

}
