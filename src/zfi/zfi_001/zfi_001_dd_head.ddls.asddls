@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data def. for Header'
define root view entity ZFI_001_DD_HEAD
  as select from zfi_001_t_head
  composition [0..*] of ZFI_001_DD_ITEM as _Item
{
  key header_uuid   as HeaderUuid,
      refdoc        as Refdoc,
      bustratype    as Bustratype,
      accdoctype    as Accdoctype,
      docno         as docno,
      comcode       as Comcode,
      docdate       as Docdate,
      pastdate      as Pastdate,
      taxdetdate    as Taxdetdate,
      createdby     as Createdby,
      createdat     as Createdat,
      traexpclaim   as traexpclaim,
      traorder      as traorder,
      persname      as persname,
      positionn     as positionn,
      onbustripfor  as onbustripfor,
      purtravel1    as purtravel1,
      purtravel2    as purtravel2,
      purtravel3    as purtravel3,
      purtravel4    as purtravel4,
      country1      as country1,
      country2      as country2,
      country3      as country3,
      country4      as country4,
      tradeparture  as tradeparture,
      traarrival    as traarrival,
      identifiedby  as identifiedby,
      signaturedate as signaturedate,
      _Item // Make association public
}
