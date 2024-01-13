@EndUserText.label: 'WBS Element Value Help'
@AccessControl.authorizationCheck: #CHECK
define root view entity zmm_002_dd_wbselement
  as select from I_FinWBSElementHierarchyNode as wbs
{
  key wbs.WBSElementExternalID,
      wbs.WBSElement
}
