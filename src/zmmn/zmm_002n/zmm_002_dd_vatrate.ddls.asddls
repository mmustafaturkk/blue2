@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VAT Rate Value Help'
define root view entity ZMM_002_DD_VATRATE
  as select from zfi_004_t_vat
{
  key companycode           as Companycode,
  key taxcode               as Taxcode,
      vatrate               as Vatrate,
      last_changed_at       as LastChangedAt,
      local_last_changed_at as LocalLastChangedAt

}
