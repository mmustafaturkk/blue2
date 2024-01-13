@EndUserText.label: 'Cash Flow Table'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: false

@Metadata.allowExtensions: true
@AbapCatalog.dataMaintenance: #DISPLAY_ONLY
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE, #CDS_MODELING_DATA_SOURCE,#EXTRACTION_DATA_SOURCE ]

define view entity ZI_CashF_Table
  as select from zfi_002_t_cf2
  association to parent ZI_CashF_Table_S as _CashFlowTableAll on $projection.SingletonID = _CashFlowTableAll.SingletonID
{
  key fyear as Fyear,
  key fperiod as Fperiod,
  compcode as Compcode,
  currency as Currency,
  @Semantics.amount.currencyCode: 'Currency'
  consultancy as Consultancy,
  @Semantics.amount.currencyCode: 'Currency'
  epc as Epc,
  @Semantics.amount.currencyCode: 'Currency'
  intercompany as Intercompany,
  @Semantics.amount.currencyCode: 'Currency'
  indirect_income as IndirectIncome,
  @Semantics.amount.currencyCode: 'Currency'
  unbilled_revenue as UnbilledRevenue,
  @Semantics.amount.currencyCode: 'Currency'
  others_income as OthersIncome,
  @Semantics.amount.currencyCode: 'Currency'
  payroll as Payroll,
  @Semantics.amount.currencyCode: 'Currency'
  freelancers as Freelancers,
  @Semantics.amount.currencyCode: 'Currency'
  manpower_supply as ManpowerSupply,
  @Semantics.amount.currencyCode: 'Currency'
  subcontracted_services as SubcontractedServices,
  @Semantics.amount.currencyCode: 'Currency'
  travel_accomodation as TravelAccomodation,
  @Semantics.amount.currencyCode: 'Currency'
  daily_allowance as DailyAllowance,
  @Semantics.amount.currencyCode: 'Currency'
  project_other_expenses as ProjectOtherExpenses,
  @Semantics.amount.currencyCode: 'Currency'
  intercompany_cross as IntercompanyCross,
  @Semantics.amount.currencyCode: 'Currency'
  it_cogs as ItCogs,
  @Semantics.amount.currencyCode: 'Currency'
  billable_insurance as BillableInsurance,
  @Semantics.amount.currencyCode: 'Currency'
  others_cogs as OthersCogs,
  @Semantics.amount.currencyCode: 'Currency'
  administration as Administration,
  @Semantics.amount.currencyCode: 'Currency'
  finance as Finance,
  @Semantics.amount.currencyCode: 'Currency'
  hr_recruitment as HrRecruitment,
  @Semantics.amount.currencyCode: 'Currency'
  it_overhead as ItOverhead,
  @Semantics.amount.currencyCode: 'Currency'
  charity as Charity,
  @Semantics.amount.currencyCode: 'Currency'
  cash_payment as CashPayment,
  @Semantics.amount.currencyCode: 'Currency'
  cash_receipts as CashReceipts,
  @Semantics.amount.currencyCode: 'Currency'
  cash_balance as CashBalance,
  @Semantics.user.createdBy: true
  localcreatedby as Localcreatedby,
  @Semantics.systemDateTime.createdAt: true
  localcreatedat as Localcreatedat,
  @Semantics.user.localInstanceLastChangedBy: true
  locallastchangedby as Locallastchangedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  locallastchangedat as Locallastchangedat,
  @Semantics.systemDateTime.lastChangedAt: true
  lastchangedat as Lastchangedat,
  1 as SingletonID,
  _CashFlowTableAll
  
}
