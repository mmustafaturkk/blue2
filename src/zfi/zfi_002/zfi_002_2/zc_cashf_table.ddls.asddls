@EndUserText.label: 'Maintain Cash Flow Table'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_CashF_Table
  as projection on ZI_CashF_Table
{
  key Fyear,
  key Fperiod,
  Compcode,
  Currency,
  Consultancy,
  Epc,
  Intercompany,
  IndirectIncome,
  UnbilledRevenue,
  OthersIncome,
  Payroll,
  Freelancers,
  ManpowerSupply,
  SubcontractedServices,
  TravelAccomodation,
  DailyAllowance,
  ProjectOtherExpenses,
  IntercompanyCross,
  ItCogs,
  BillableInsurance,
  OthersCogs,
  Administration,
  Finance,
  HrRecruitment,
  ItOverhead,
  Charity,
  CashPayment,
  CashReceipts,
  CashBalance,
  Localcreatedby,
  Localcreatedat,
  @Consumption.hidden: true
  Locallastchangedby,
  @Consumption.hidden: true
  Locallastchangedat,
  Lastchangedat,
  @Consumption.hidden: true
  SingletonID,
  _CashFlowTableAll : redirected to parent ZC_CashF_Table_S
  
}
