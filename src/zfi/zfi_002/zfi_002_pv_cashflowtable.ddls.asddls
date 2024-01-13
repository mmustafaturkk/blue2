@EndUserText.label: 'Maintain Cash Flow Table'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZFI_002_PV_CashFlowTable
  as projection on ZFI_002_IV_CashFlowTable
{
  key Fyear,
  key Fperiod,
  Compcode,

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
//Cash_Balance,

  Currency,
  @Consumption.hidden: true
  SingletonID,
  _CashFlowTableAll : redirected to parent ZFI_002_PV_CashFlowTable_S
  
}
