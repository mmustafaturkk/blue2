@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_FI_001_T_VAT'
@ObjectModel.semanticKey: [ 'Rate' ]
define root view entity ZC_FI_001_T_VAT
  provider contract transactional_query
  as projection on ZR_FI_001_T_VAT
{
  key Rate,
  A0,
  A1,
  A2,
  A3,
  A4,
  LocalLastChangedAt
  
}
