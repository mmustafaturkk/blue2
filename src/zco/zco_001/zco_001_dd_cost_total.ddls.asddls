@AbapCatalog.sqlViewName: 'ZCO_DD_002'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Journal entry cost total'
define view ZCO_001_DD_COST_TOTAL
  as select from    ZCO_001_DD_BASE_RECORDS      as journal
    left outer join I_JournalEntryItem           as total       on  journal.CompanyCode          = total.CompanyCode
                                                                and journal.FiscalYear           = total.FiscalYear
                                                                and journal.AccountingDocument   = total.AccountingDocument
                                                                and journal.Ledger               = total.Ledger
                                                                and journal.WBSElementInternalID = total.WBSElementInternalID
                                                                and journal.ProjectInternalID    = total.ProjectInternalID
                                                                and (
                                                                   total.GLAccount               = '0099999900'
                                                                   or total.GLAccount            = '0094308000'
                                                                   or total.GLAccount            = '0097777700'
                                                                   or total.GLAccount            = '0098888800'
                                                                 )
    left outer join I_CustProjSlsOrdItemWorkPckg as workpackage on  journal.Project    = workpackage.CustomerProject
                                                                and journal.WBSElement = workpackage.WorkPackage
    left outer join I_SalesOrderItem             as salesitem   on  workpackage.SalesOrder     = salesitem.SalesOrder
                                                                and workpackage.SalesOrderItem = salesitem.SalesOrderItem
{
  salesitem.WBSElementInternalID,
  total.ProjectInternalID,
  sum(total.AmountInCompanyCodeCurrency) as AmountInCompanyCodeCurrency,
  sum(total.AmountInGlobalCurrency)      as AmountInGlobalCurrency
}
group by
  salesitem.WBSElementInternalID,
  total.ProjectInternalID
