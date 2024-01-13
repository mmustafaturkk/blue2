@AbapCatalog.sqlViewName: 'ZCO_DD_003'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Journal entry product total'
define view ZCO_001_DD_PRODUCT_TOTAL
  as select from I_JournalEntryItem as journal
{
  ProjectInternalID,
  WBSElementInternalID,
  Ledger,
  FiscalYear,
  sum(AmountInCompanyCodeCurrency) as Amount_C_WBS,
  sum(AmountInGlobalCurrency)      as Amount_G_WBS
}
where
       Ledger          = '0L'
  and(
       GLAccount       = '0041000000'
    or GLAccount       = '0042000000'
  )
  and  PersonnelNumber = '00000000'
  and  Product         = 'P001'
group by
  ProjectInternalID,
  WBSElementInternalID,
  Ledger,
  FiscalYear
