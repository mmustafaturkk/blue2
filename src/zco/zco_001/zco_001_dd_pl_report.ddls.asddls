//@AbapCatalog.sqlViewName: 'ZCO_DD_004'
//@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'P&L report view'
@Search.searchable: false
@Metadata.allowExtensions: true
@AbapCatalog.dataMaintenance: #DISPLAY_ONLY
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE, #CDS_MODELING_DATA_SOURCE,#EXTRACTION_DATA_SOURCE ]
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCO_001_DD_PL_REPORT
  as select distinct from ZCO_001_DD_BASE_RECORDS      as journal
    left outer join       I_JournalEntryItem           as item_1        on  journal.CompanyCode          = item_1.CompanyCode
                                                                        and journal.FiscalYear           = item_1.FiscalYear
                                                                        and journal.AccountingDocument   = item_1.AccountingDocument
                                                                        and journal.Ledger               = item_1.Ledger
                                                                        and journal.WBSElementInternalID = item_1.WBSElementInternalID
                                                                        and journal.ProjectInternalID    = item_1.ProjectInternalID
                                                                        and item_1.GLAccount             = '0099999900'

    left outer join       I_JournalEntryItem           as item_2        on  journal.CompanyCode          = item_2.CompanyCode
                                                                        and journal.FiscalYear           = item_2.FiscalYear
                                                                        and journal.AccountingDocument   = item_2.AccountingDocument
                                                                        and journal.Ledger               = item_2.Ledger
                                                                        and journal.WBSElementInternalID = item_2.WBSElementInternalID
                                                                        and journal.ProjectInternalID    = item_2.ProjectInternalID
                                                                        and item_2.GLAccount             = '0094308000'

  //    left outer join       ZCO_001_dd_pers_cost         as item_2        on  journal.CompanyCode               = item_2.CompanyCode
  //                                                                        and journal.WBSElementInternalID      = item_2.WBSElementInternalID
  //                                                                        and journal.ProjectInternalID         = item_2.ProjectInternalID
  //                                                                        and journal.PersonnelNumber           = item_2.PersonnelNumber
  //                                                                        and journal.OriginCostCtrActivityType = item_2.OriginCostCtrActivityType

    left outer join       I_JournalEntryItem           as item_3        on  journal.CompanyCode          = item_3.CompanyCode
                                                                        and journal.FiscalYear           = item_3.FiscalYear
                                                                        and journal.AccountingDocument   = item_3.AccountingDocument
                                                                        and journal.Ledger               = item_3.Ledger
                                                                        and journal.WBSElementInternalID = item_3.WBSElementInternalID
                                                                        and journal.ProjectInternalID    = item_3.ProjectInternalID
                                                                        and item_3.GLAccount             = '0098888800'

    left outer join       I_JournalEntryItem           as item_4        on  journal.CompanyCode          = item_4.CompanyCode
                                                                        and journal.FiscalYear           = item_4.FiscalYear
                                                                        and journal.AccountingDocument   = item_4.AccountingDocument
                                                                        and journal.Ledger               = item_4.Ledger
                                                                        and journal.PersonnelNumber      = item_4.PersonnelNumber
                                                                        and journal.WBSElementInternalID = item_4.WBSElementInternalID
                                                                        and journal.ProjectInternalID    = item_4.ProjectInternalID
                                                                        and (
                                                                           item_4.GLAccount              = '0041000000'
                                                                           or item_4.GLAccount           = '0042000000'
                                                                         )
    left outer join       I_JournalEntryItem           as item_5        on  journal.CompanyCode          = item_5.CompanyCode
                                                                        and journal.FiscalYear           = item_5.FiscalYear
                                                                        and journal.AccountingDocument   = item_5.AccountingDocument
                                                                        and journal.Ledger               = item_5.Ledger
                                                                        and journal.PersonnelNumber      = item_5.PersonnelNumber
                                                                        and journal.WBSElementInternalID = item_5.WBSElementInternalID
                                                                        and journal.ProjectInternalID    = item_5.ProjectInternalID
                                                                        and item_5.GLAccount             = '0097777700'

    left outer join       I_CustProjSlsOrdItemWorkPckg as workpackage   on  journal.Project    = workpackage.CustomerProject
                                                                        and journal.WBSElement = workpackage.WorkPackage
    left outer join       I_SalesOrderItem             as salesitem     on  workpackage.SalesOrder     = salesitem.SalesOrder
                                                                        and workpackage.SalesOrderItem = salesitem.SalesOrderItem
    left outer join       ZCO_001_DD_PRODUCT_TOTAL     as total_product on  journal.ProjectInternalID      = total_product.ProjectInternalID
                                                                        and salesitem.WBSElementInternalID = total_product.WBSElementInternalID
                                                                        and journal.Ledger                 = total_product.Ledger
                                                                        and journal.FiscalYear             = total_product.FiscalYear
    left outer join       ZCO_001_DD_COST_TOTAL        as cost_total    on  journal.ProjectInternalID      = cost_total.ProjectInternalID
                                                                        and salesitem.WBSElementInternalID = cost_total.WBSElementInternalID
{
  key journal.AccountingDocument,
  key journal.Ledger,
  key journal.FiscalYear,
      journal.FiscalPeriod,
      journal.PersonnelNumber,
      journal.Project,
      journal.PersonFullName,
      journal.CompanyCode,
      journal.WBSElement,
      //      (case when journal.WBSElement like '%.0%' then replace(journal.WBSElement, '.0', '.1')
      //            else journal.WBSElement end) as wbselement,
      //  journal.TransactionCurrency,
      //  journal.GlobalCurrency,
      //  journal.Quantity,
      //  journal.OriginCostCtrActivityType,
      journal.BaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      (case when item_1.Quantity is not null
        then item_1.Quantity
        else (case when item_2.Quantity is not null
        then item_2.Quantity
        else (case when item_3.Quantity is not null
        then item_3.Quantity
        else (case when item_4.Quantity is not null
        then item_4.Quantity end) end) end) end)                                                                                          as quantity,

      (case when item_1.OriginCostCtrActivityType is not null
        then item_1.OriginCostCtrActivityType
        else (case when item_2.OriginCostCtrActivityType is not null
        then item_2.OriginCostCtrActivityType
        else (case when item_3.OriginCostCtrActivityType is not null
        then item_3.OriginCostCtrActivityType
        else (case when item_4.OriginCostCtrActivityType is not null
        then item_4.OriginCostCtrActivityType end) end) end) end)                                                                         as OriginCostCtrActivityType,

      (case when item_1.CompanyCodeCurrency is not null
        then item_1.CompanyCodeCurrency
        else (case when item_2.CompanyCodeCurrency is not null
        then item_2.CompanyCodeCurrency
        else (case when item_3.CompanyCodeCurrency is not null
        then item_3.CompanyCodeCurrency
        else (case when item_4.CompanyCodeCurrency is not null
        then item_4.CompanyCodeCurrency
        else (case when item_5.CompanyCodeCurrency is not null
        then item_5.CompanyCodeCurrency end) end) end) end) end)                                                                          as CompanyCodeCurrency,

      (case when item_1.GlobalCurrency is not null
        then item_1.GlobalCurrency
        else (case when item_2.GlobalCurrency is not null
        then item_2.GlobalCurrency
        else (case when item_3.GlobalCurrency is not null
        then item_3.GlobalCurrency
        else (case when item_4.GlobalCurrency is not null
        then item_4.GlobalCurrency
        else (case when item_5.GlobalCurrency is not null
        then item_5.GlobalCurrency end) end) end) end) end)                                                                          as GlobalCurrency,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      item_1.AmountInCompanyCodeCurrency                                                                                                  as Amount_C_99999900,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      item_1.AmountInGlobalCurrency                                                                                                       as Amount_G_99999900,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      item_2.AmountInCompanyCodeCurrency                                                                                                  as Amount_C_94308000,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      item_2.AmountInGlobalCurrency                                                                                                       as Amount_G_94308000,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      ( -1 * item_3.AmountInCompanyCodeCurrency )                                                                                         as Amount_C_98888800,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      ( -1 * item_3.AmountInGlobalCurrency )                                                                                              as Amount_G_98888800,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      item_4.AmountInCompanyCodeCurrency                                                                                                  as Amount_C_410,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      item_4.AmountInGlobalCurrency                                                                                                       as Amount_G_410,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      total_product.Amount_G_WBS                                                                                                          as Fixed_price_global,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      total_product.Amount_C_WBS                                                                                                          as fixed_price_company,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      cost_total.AmountInGlobalCurrency                                                                                                   as cost_amount_global,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cost_total.AmountInCompanyCodeCurrency                                                                                              as cost_amount_company,
//      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
//      (case when item_1.AmountInCompanyCodeCurrency is not null
//       then item_1.AmountInCompanyCodeCurrency
//       else item_2.AmountInCompanyCodeCurrency end)                                                                                       as total_cost_company,
//      @Semantics.amount.currencyCode: 'GlobalCurrency'
//      (case when item_1.AmountInGlobalCurrency is not null
//       then item_1.AmountInGlobalCurrency
//       else item_2.AmountInGlobalCurrency end)                                                                                            as total_cost_global,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      (case when item_1.AmountInCompanyCodeCurrency is not null then cast(item_1.AmountInCompanyCodeCurrency as abap.fltp)else 0 end)
      + (case when item_2.AmountInCompanyCodeCurrency  is not null then cast(item_2.AmountInCompanyCodeCurrency  as abap.fltp) else 0 end)
      + (case when item_3.AmountInCompanyCodeCurrency is not null then cast( item_3.AmountInCompanyCodeCurrency as abap.fltp) else 0 end)
      + (case when item_5.AmountInCompanyCodeCurrency is not null then cast( item_5.AmountInCompanyCodeCurrency as abap.fltp) else 0 end) as ico_cost_com,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      (case when item_1.AmountInGlobalCurrency is not null then cast(item_1.AmountInGlobalCurrency as abap.fltp)else 0 end)
      + (case when item_2.AmountInGlobalCurrency  is not null then cast(item_2.AmountInGlobalCurrency as abap.fltp) else 0 end)
      + (case when item_3.AmountInGlobalCurrency is not null then cast( item_3.AmountInGlobalCurrency as abap.fltp) else 0 end)
      + (case when item_5.AmountInGlobalCurrency is not null then cast( item_5.AmountInGlobalCurrency as abap.fltp) else 0 end)           as ico_cost_glo,
      //      (case when item_1.AmountInCompanyCodeCurrency is not null
      //       then (case when cost_total.AmountInCompanyCodeCurrency is not null and cost_total.AmountInCompanyCodeCurrency != 0.00
      //            then cast(division(item_1.AmountInCompanyCodeCurrency,cost_total.AmountInCompanyCodeCurrency,3) as abap.fltp) * cast(total_product.Amount_C_WBS as abap.fltp)
      //            else 0.00 end)
      //       else (case when cost_total.AmountInCompanyCodeCurrency is not null and cost_total.AmountInCompanyCodeCurrency != 0.00
      //                  then cast(division(item_2.AmountInCompanyCodeCurrency,cost_total.AmountInCompanyCodeCurrency,3) as abap.fltp) * cast(total_product.Amount_C_WBS as abap.fltp)
      //                  else 0.00 end) end)                                                                                                     as fixed_price_company2,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      (case when cost_total.AmountInCompanyCodeCurrency is not null and cost_total.AmountInCompanyCodeCurrency != 0.00
       then cast(division(cast((case when item_1.AmountInCompanyCodeCurrency is not null then cast(item_1.AmountInCompanyCodeCurrency as abap.fltp)else 0.00 end)
                           + (case when item_2.AmountInCompanyCodeCurrency  is not null then cast(item_2.AmountInCompanyCodeCurrency  as abap.fltp) else 0.00 end)
                           + (case when item_3.AmountInCompanyCodeCurrency is not null then cast( item_3.AmountInCompanyCodeCurrency as abap.fltp) else 0.00 end)
                           + (case when item_5.AmountInCompanyCodeCurrency is not null then cast( item_5.AmountInCompanyCodeCurrency as abap.fltp) else 0.00 end) as abap.dec( 23, 3 )), cast(cost_total.AmountInCompanyCodeCurrency as abap.dec( 23, 3 )),3 ) as abap.fltp) * cast(total_product.Amount_C_WBS as abap.fltp)
       else 0.00 end)                                                                                                                     as fixed_price_company2,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      (case when cost_total.AmountInGlobalCurrency is not null and cost_total.AmountInGlobalCurrency != 0.00
       then cast(division(cast((case when item_1.AmountInGlobalCurrency is not null then cast(item_1.AmountInGlobalCurrency as abap.fltp)else 0 end)
      + (case when item_2.AmountInGlobalCurrency  is not null then cast(item_2.AmountInGlobalCurrency  as abap.fltp) else 0 end)
      + (case when item_3.AmountInGlobalCurrency is not null then cast( item_3.AmountInGlobalCurrency as abap.fltp) else 0 end)
      + (case when item_5.AmountInGlobalCurrency is not null then cast( item_5.AmountInGlobalCurrency as abap.fltp) else 0 end) as abap.dec( 23, 3 )), cast(cost_total.AmountInGlobalCurrency as abap.dec( 23, 3 )),3 ) as abap.fltp) * cast(total_product.Amount_G_WBS as abap.fltp)
       else 0.00 end)                                                                                                                     as fixed_price_global2
      //      (case when item_1.AmountInGlobalCurrency is not null
      //       then (case when cost_total.AmountInGlobalCurrency is not null and cost_total.AmountInGlobalCurrency != 0.00
      //                  then cast(division(item_1.AmountInGlobalCurrency,cost_total.AmountInGlobalCurrency,3) as abap.fltp) * cast(total_product.Amount_G_WBS as abap.fltp)
      //                  else 0.00 end)
      //       else (case when cost_total.AmountInGlobalCurrency is not null and cost_total.AmountInGlobalCurrency != 0.00
      //                  then cast(division(item_2.AmountInGlobalCurrency,cost_total.AmountInGlobalCurrency,3) as abap.fltp) * cast(total_product.Amount_G_WBS as abap.fltp)
      //                  else 0.00 end) end)                             as fixed_price_global2
      //  (total_product.Amount_T_WBS + item_4.AmountInTransactionCurrency  + item_3.AmountInTransactionCurrency) as toplam_gelir_transaction,
      //  (total_product.Amount_G_WBS + item_4.AmountInGlobalCurrency  + item_3.AmountInGlobalCurrency)           as toplam_gelir_global,
      //  (item_1.AmountInTransactionCurrency + item_2.AmountInTransactionCurrency)                               as toplam_gider_transaction,
      //  (item_1.AmountInGlobalCurrency + item_2.AmountInGlobalCurrency)                                         as toplam_gider_global,
      //  m

}
where
      journal.Ledger            = '0L'
  //  and journal.LedgerGLLineItem = '000001'
  //  and journal.WBSElement      is not initial
  and journal.ProjectInternalID is not initial
  and journal.PersonnelNumber   is not initial
