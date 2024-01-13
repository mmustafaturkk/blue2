@EndUserText.label: 'Maintain Cash Flow Table Singleton'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_CashF_Table_S
  provider contract transactional_query
  as projection on ZI_CashF_Table_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _CashFlowTable : redirected to composition child ZC_CashF_Table
  
}
