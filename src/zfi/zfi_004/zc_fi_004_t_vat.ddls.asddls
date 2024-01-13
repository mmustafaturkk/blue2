@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_FI_004_T_VAT'
@ObjectModel.semanticKey: [ 'Companycode', 'Taxcode' ]
define root view entity ZC_FI_004_T_VAT
  provider contract transactional_query
  as projection on ZR_FI_004_T_VAT
{
  key Companycode,
  key Taxcode,
  Vatrate,
  LocalLastChangedAt
  
}
