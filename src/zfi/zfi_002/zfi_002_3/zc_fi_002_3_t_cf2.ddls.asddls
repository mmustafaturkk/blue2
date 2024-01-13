@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '##GENERATED ZFI_002_3_T_CF2'
@Metadata.allowExtensions: true

define root view entity ZC_FI_002_3_T_CF2
  provider contract transactional_query
  as projection on ZR_FI_002_3_T_CF2
{
  key Fyear,
  key Fperiod,
  key Compcode,
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
  VAT_refund,
  loans_received_from_banks,
  Other_Cash_Receipt,
  Business_Dev_Marketing,
  VAT_payment,
  loans_repaid_banks,
  profit_tax,
  others_payments,
  Locallastchangedat
  
}
