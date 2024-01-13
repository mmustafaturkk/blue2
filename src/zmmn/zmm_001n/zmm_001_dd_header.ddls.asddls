@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data def. for Header'
define root view entity ZMM_001_DD_HEADER
  as select from zmm_001_t_head
  composition [0..*] of ZMM_001_DD_ITEM as _Item
{
  key header_uuid as HeaderUuid,
      @EndUserText.label: 'COMPANY CODE'
      comcode     as Comcode,
      @EndUserText.label: 'SUPPLIER'
      supplier    as Supplier,
      @EndUserText.label: 'EXPENSE DATE'
      pordate     as Pordate,
      @EndUserText.label: 'CURRENCY'
      doccur      as Doccur,
      @EndUserText.label: 'DOCUMENT NUMBER'
      docno       as Docno,
      @EndUserText.label: 'CREATED BY'
      createdby   as Createdby,
      @EndUserText.label: 'CREATION DATE'
      createdat   as Createdat,

      _Item // Make association public
}
