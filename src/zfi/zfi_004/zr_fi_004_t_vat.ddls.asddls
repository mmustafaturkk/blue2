@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED ZFI_004_T_VAT'
define root view entity ZR_FI_004_T_VAT
  as select from zfi_004_t_vat
{
  key companycode as Companycode,
  key taxcode as Taxcode,
  vatrate as Vatrate,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
  
}
