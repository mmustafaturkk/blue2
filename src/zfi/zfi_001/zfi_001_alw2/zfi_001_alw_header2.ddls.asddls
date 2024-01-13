//@AbapCatalog.sqlViewName: ''
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'Allowance App Header Data Definition'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View Entity for Student'
define root view entity ZFI_001_ALW_HEADER2
  as select from zfi_001_alw_h2
  composition [1..*] of ZFI_001_ALW_ITEM2 as _Item
{
      @EndUserText.label: 'Header ID'
  key id                 as Id,
      @EndUserText.label: 'REFERENCE DOCUMENT TYPE'
      refdoc             as Refdoc,
      @EndUserText.label: 'BUSINESS TRANSACTION TYPE'
      bustratype         as Bustratype,
      @EndUserText.label: 'ACCOUNTING DOCUMENT TYPE'
      accdoctype         as Accdoctype,
      @EndUserText.label: 'DOCUMENT NO'
      docno              as Docno,
      @EndUserText.label: 'COMPANY CODE'
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_CompanyCode', element: 'CompanyCode' }}]
      comcode            as Comcode,
      @EndUserText.label: 'DOCUMENT DATE'
      docdate            as Docdate,
      @EndUserText.label: 'POSTING DATE'
      pastdate           as Pastdate,
      @EndUserText.label: 'TAX DETERMINATION DATE'
      taxdetdate         as Taxdetdate,
      @EndUserText.label: 'ATTACHMENT'
      @Semantics.largeObject:{
         mimeType: 'Mimetype',
         fileName: 'Filename',
         contentDispositionPreference: #INLINE
      }
      attachment         as Attachment,
      @EndUserText.label: 'MIMETYPE'
      mimetype           as Mimetype,
      @EndUserText.label: 'FILENAME'
      filename           as Filename,
      lastchangedat      as Lastchangedat,
      locallastchangedat as Locallastchangedat,

      _Item // Make association public
}
