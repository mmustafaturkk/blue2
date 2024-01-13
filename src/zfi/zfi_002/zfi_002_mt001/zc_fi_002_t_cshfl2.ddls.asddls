@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_FI_002_T_CSHFL2'
@ObjectModel.semanticKey: [ 'Fyear', 'Fperiod' ]
define root view entity ZC_FI_002_T_CSHFL2
  provider contract transactional_query
  as projection on ZR_FI_002_T_CSHFL2
{
  key Fyear,
  key Fperiod, 
  Compcode,
  Currency,
  LocalLastChangedAt
//Consultancy,
//EPC,
//Intercompany,
//Indirect_Income,
//Unbilled_Revenue,
//Others_income, 
//Payroll,
//Freelancers,
//Manpower_supply,
//Subcontracted_Services,
//Travel_Accomodation,
//Daily_Allowance,
//Project_Other_Expenses,
//Intercompany_Cross,
//IT_COGS,
//Billable_Insurance,
//Others_COGS,
//Administration,
//Finance,
//HR_Recruitment,
//IT_OVERHEAD,
//Charity,
//Cash_Payment,
//Cash_Receipts,
//Cash_Balance
  
}
