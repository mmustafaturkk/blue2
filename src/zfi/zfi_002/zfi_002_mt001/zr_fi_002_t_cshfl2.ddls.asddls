@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED ZFI_002_T_CSHFL2'
define root view entity ZR_FI_002_T_CSHFL2
  as select from zfi_002_t_cshfl2
{
  key fyear as Fyear,
  key fperiod as Fperiod,
  compcode as Compcode,
  currency as Currency,
  
//  @Semantics.amount.currencyCode : 'Currency'
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
  
  @Semantics.user.createdBy: true
  local_created_by as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  local_created_at as LocalCreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt 
  
}
