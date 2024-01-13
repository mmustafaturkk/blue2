@EndUserText.label: 'Maintain Cash Flow Table Singleton'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZFI_002_PV_CashFlowTable_S
  provider contract transactional_query
  as projection on ZFI_002_IV_CashFlowTable_S 
{
  key SingletonID, 
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _CashFlowTable : redirected to composition child ZFI_002_PV_CashFlowTable
  
}
