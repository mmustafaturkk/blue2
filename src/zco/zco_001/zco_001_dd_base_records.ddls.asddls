@AbapCatalog.sqlViewName: 'ZCO_DD_001'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Journal entry ana kayıtlar'
define view ZCO_001_DD_BASE_RECORDS
  as select distinct from I_JournalEntryItem as journal
{
  key journal.Ledger,
  key journal.AccountingDocument,
  key journal.FiscalYear,
      journal.FiscalPeriod,
      journal.PersonnelNumber,
      journal._PersonWorkAgreement_1.PersonFullName,
      journal.CompanyCode,
      journal.WBSElement,
      journal.WBSElementInternalID,
      //      journal.TransactionCurrency,
      //      journal.GlobalCurrency,
      journal.Project,
      journal.ProjectInternalID,
      journal.BaseUnit,
      //      journal.Quantity,
            journal.OriginCostCtrActivityType
}
where
      journal.Ledger               = '0L'
  //  and journal.LedgerGLLineItem = '000001'
  //  and journal.WBSElement      is not initial
  //  and journal.Project         is not initial
  and journal.WBSElementInternalID is not initial
  and journal.ProjectInternalID    is not initial
  and journal.PersonnelNumber      is not initial
  and journal.BaseUnit             is not initial
