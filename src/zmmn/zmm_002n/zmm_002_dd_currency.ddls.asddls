@EndUserText.label: 'Currency Value Help'
@AccessControl.authorizationCheck: #CHECK
define root view entity zmm_002_dd_currency
  as select from I_Currency as Currency
{
  key Currency.Currency
}
