@EndUserText.label: 'Cash Flow Table Singleton'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZFI_002_IV_CashFlowTable_S
  as select from I_Language
    left outer join I_CstmBizConfignLastChgd on I_CstmBizConfignLastChgd.ViewEntityName = 'ZFI_002_IV_CASHFLOWTABLE'
  composition [0..*] of ZFI_002_IV_CashFlowTable as _CashFlowTable
{
  key 1 as SingletonID,
  _CashFlowTable,
  I_CstmBizConfignLastChgd.LastChangedDateTime as LastChangedAtMax,  
  cast( '' as sxco_transport) as TransportRequestID,
  cast( 'X' as abap_boolean preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language 
