@AbapCatalog.sqlViewName: 'ZFI_000_DBTCRD'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.resultSet.sizeCategory: #XS
@EndUserText.label: 'Debit Credit Code Value Help Cds'
//@OData.publish: true
@Search.searchable: true
define view ZFI_000_DD_DBTCRD_VH
  as select from zfi_000_t_dbtcrd as dbtcrd
{

      @Search.defaultSearchElement: true
      @EndUserText.label: 'Text No EU'
  key text        as Text,
      description as Description
}
