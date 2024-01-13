@EndUserText.label: 'Cash Flow Table'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: false

@Metadata.allowExtensions: true
@AbapCatalog.dataMaintenance: #DISPLAY_ONLY
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE, #CDS_MODELING_DATA_SOURCE ]


define view entity ZFI_002_IV_CashFlowTable
  as select from zfi_002_t_cshfl2
  association to parent ZFI_002_IV_CashFlowTable_S as _CashFlowTableAll on $projection.SingletonID = _CashFlowTableAll.SingletonID
{
  key fyear as Fyear, 
  key fperiod as Fperiod,
  compcode as Compcode,
//@Semantics.amount.currencyCode : 'Currency'
//  consultancy           as  consultancy,
//  @Semantics.amount.currencyCode : 'Currency'
//  epc                   as epc ,
//  @Semantics.amount.currencyCode : 'Currency'
//  intercompany         as intercompany,
//  @Semantics.amount.currencyCode : 'Currency'
//  indirect_income        as indirect_income,
//  @Semantics.amount.currencyCode : 'Currency'
//  unbilled_revenue       as unbilled_revenue,
//  @Semantics.amount.currencyCode : 'Currency'
//  others_income          as others_income,
//  @Semantics.amount.currencyCode : 'Currency'
//  payroll             as   payroll,
//  @Semantics.amount.currencyCode : 'Currency' 
//  freelancers            as freelancers,
//  @Semantics.amount.currencyCode : 'Currency'
//  manpower_supply       as manpower_supply,
//  @Semantics.amount.currencyCode : 'Currency'
//  subcontracted_services as subcontracted_services,
//  @Semantics.amount.currencyCode : 'Currency'
//  travel_accomodation    as travel_accomodation,
//  @Semantics.amount.currencyCode : 'Currency'
//  daily_allowance       as daily_allowance,
//  @Semantics.amount.currencyCode : 'Currency'
//  project_other_expenses as   project_other_expenses,
//  @Semantics.amount.currencyCode : 'Currency'
//  intercompany_cross     as intercompany_cross,
//  @Semantics.amount.currencyCode : 'Currency'
//  it_cogs                as it_cogs,
//  @Semantics.amount.currencyCode : 'Currency'
//  billable_insurance     as   billable_insurance,
//  @Semantics.amount.currencyCode : 'Currency'
//  others_cogs           as others_cogs,
//  @Semantics.amount.currencyCode : 'Currency'
//  administration        as administration,
//  @Semantics.amount.currencyCode : 'Currency'
//  finance              as finance,
//  @Semantics.amount.currencyCode : 'Currency'
//  hr_recruitment         as hr_recruitment,
//  @Semantics.amount.currencyCode : 'Currency'
//  it_overhead            as it_overhead,
//  @Semantics.amount.currencyCode : 'Currency'
//  charity              as charity,
//  @Semantics.amount.currencyCode : 'Currency'
//  cash_payment           as   cash_payment,
//  @Semantics.amount.currencyCode : 'Currency'
//  cash_receipts         as   cash_receipts,
//  @Semantics.amount.currencyCode : 'Currency'
//  cash_balance          as  cash_balance,

  currency as Currency,
  1 as SingletonID,
  _CashFlowTableAll
  
}
