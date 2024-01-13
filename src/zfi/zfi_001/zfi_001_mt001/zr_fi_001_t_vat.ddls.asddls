@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED ZFI_001_T_VAT'
define root view entity ZR_FI_001_T_VAT
  as select from zfi_001_t_vat as VAT
{
  key rate as Rate,
  a0 as A0,
  a1 as A1,
  a2 as A2,
  a3 as A3,
  a4 as A4,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
  
}
