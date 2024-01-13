@AbapCatalog.sqlViewName: 'ZCO_DD_005'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Personnel cost view'
define view ZCO_001_dd_pers_cost
  as select from    ZCO_001_DD_BASE_RECORDS as journal
    left outer join I_JournalEntryItem      as total on  journal.CompanyCode          = total.CompanyCode
                                                     and journal.FiscalYear           = total.FiscalYear
                                                     and journal.AccountingDocument   = total.AccountingDocument
                                                     and journal.Ledger               = total.Ledger
                                                     and journal.WBSElementInternalID = total.WBSElementInternalID
                                                     and journal.ProjectInternalID    = total.ProjectInternalID
                                                     and (
                                                        total.GLAccount               = '0099999900'
                                                        or total.GLAccount            = '0094308000'
                                                        or total.GLAccount            = '0098888800'
                                                        or total.GLAccount            = '0097777700'
                                                      )
{
  total.PersonnelNumber,
  total.WBSElementInternalID,
  total.ProjectInternalID,
  total.CompanyCode,
  total.CompanyCodeCurrency,
  total.GlobalCurrency,
  total.OriginCostCtrActivityType,
  @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
  sum(total.AmountInCompanyCodeCurrency) as AmountInCompanyCodeCurrency,
  @Semantics.amount.currencyCode: 'GlobalCurrency'
  sum(total.AmountInGlobalCurrency)      as AmountInGlobalCurrency,
  sum(total.Quantity)                    as quantity
}
group by
  total.PersonnelNumber,
  total.WBSElementInternalID,
  total.ProjectInternalID,
  total.CompanyCode,
  total.CompanyCodeCurrency,
  total.GlobalCurrency,
  total.OriginCostCtrActivityType
