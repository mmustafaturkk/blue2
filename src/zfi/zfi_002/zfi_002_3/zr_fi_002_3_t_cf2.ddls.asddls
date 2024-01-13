@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_FI_002_3_T_CF2'
@ObjectModel.semanticKey: [ 'Fyear', 'Fperiod' ]

@Search.searchable: false

@AbapCatalog.dataMaintenance: #DISPLAY_ONLY
//@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE, #CDS_MODELING_DATA_SOURCE ,#EXTRACTION_DATA_SOURCE ]

define root view entity ZR_FI_002_3_T_CF2
  as select from zfi_002_3_t_cf2
{
  key fyear as Fyear,
  key fperiod as Fperiod,
  key compcode as Compcode,
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
  @Semantics.amount.currencyCode: 'Currency'
  vat_refund as VAT_refund,
  @Semantics.amount.currencyCode: 'Currency'
  loans_received_from_banks as loans_received_from_banks,
  @Semantics.amount.currencyCode: 'Currency'
  other_cash_receipt as Other_Cash_Receipt,
  @Semantics.amount.currencyCode: 'Currency'
  business_dev_marketing as Business_Dev_Marketing,
  @Semantics.amount.currencyCode: 'Currency'
  vat_payment as VAT_payment,
  @Semantics.amount.currencyCode: 'Currency'
  loans_repaid_banks  as loans_repaid_banks,
  @Semantics.amount.currencyCode: 'Currency'
  profit_tax  as profit_tax,
  @Semantics.amount.currencyCode: 'Currency'
  others_payments as others_payments,
  @Semantics.user.createdBy: true
  localcreatedby as Localcreatedby,
  @Semantics.systemDateTime.createdAt: true
  localcreatedat as Localcreatedat,
  @Semantics.user.localInstanceLastChangedBy: true
  locallastchangedby as Locallastchangedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  locallastchangedat as Locallastchangedat,
  @Semantics.systemDateTime.lastChangedAt: true
  lastchangedat as Lastchangedat
  
}
