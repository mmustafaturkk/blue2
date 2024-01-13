@EndUserText.label: 'Cash Flow Table Singleton'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_CashF_Table_S
  as select from I_Language
    left outer join ZFI_002_T_CF2 on 0 = 0
  composition [0..*] of ZI_CashF_Table as _CashFlowTable
{
  key 1 as SingletonID,
  _CashFlowTable,
  max( ZFI_002_T_CF2.LASTCHANGEDAT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
