//@AbapCatalog.sqlViewName: ''
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'Allowance App Item Data Definition'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View for Item'
define view entity ZFI_001_ALW_ITEM2
  as select from zfi_001_alw_i2
  association to parent ZFI_001_ALW_HEADER2 as _Header on $projection.Id = _Header.Id
{
  key attach_id                  as AttachId,
      id                         as Id,
      @EndUserText.label: 'REFERENCE DOCUMENT ITEM'
      refdocitem                 as Refdocitem,
      @EndUserText.label: 'GL ACCOUNT'
      glacc                      as Glacc,
      @EndUserText.label: 'AMOUNT IN TRANSACTION CURRENCY'
      @Semantics.amount.currencyCode: 'Currcode'
      amnintracur                as Amnintracur,
      @EndUserText.label: 'CURRENCY CODE'
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Currency', element: 'Currency' }}]
      currcode                   as Currcode,
      @EndUserText.label: 'DEBIT CREDIT CODE'
      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZFI_000_DD_DBTCRD_VH', element: 'Text' }}]
      debcrecode                 as Debcrecode,
      @EndUserText.label: 'DOCUMENT ITEM TEXT'
      docitemtext                as Docitemtext,
      @EndUserText.label: 'TAX CODE'
      taxcode                    as Taxcode,
      @EndUserText.label: 'COST CENTER'
      costcenter                 as Costcenter,
      @EndUserText.label: 'PROFIT CENTER'
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_ProfitCenter', element: 'ProfitCenter' }}]
      profitcenter               as Profitcenter,
      @EndUserText.label: 'SEGMENT'
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_ProfitCenter', element: 'Segment' }}]
      segment                    as Segment,
      @EndUserText.label: 'FUNCTIONAL AREA'
      funcarea                   as Funcarea,
      @EndUserText.label: 'VALUE DATE'
      valdate                    as Valdate,
      @EndUserText.label: 'HOUSE BANK'
      housebank                  as Housebank,
      @EndUserText.label: 'HOUSE BANK ACCOUNT'
      housebankacc               as Housebankacc,
      @EndUserText.label: 'TAX CLASSIFICATION'
      taxclas                    as Taxclas,
      @EndUserText.label: 'CONDITION TYPE'
      contype                    as Contype,
      @EndUserText.label: 'TAX BASE AMOUNT'
      @Semantics.amount.currencyCode: 'Currcode'
      taxbaseamnt                as Taxbaseamnt,
      _Header.Locallastchangedat as LastChangedat,
      _Header
}
