@EndUserText.label: 'Company Code Value Help'
@AccessControl.authorizationCheck: #CHECK
define root view entity zmm_002_dd_companycode
  as select from I_CompanyCode as comcode
{
  key comcode.CompanyCode,
      comcode.CompanyCodeName
}
