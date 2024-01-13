@EndUserText.label: 'WBS Element Search Help'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZMM_001_DD_WBSELEMENTVH
  as select from I_FinWBSElementHierarchyNode as wbs
{
  key wbs.WBSElement,
      wbs.HierarchyNode,
      wbs.ValidityEndDate,
      wbs.ParentNode,
      wbs.HierarchyVersion,
      wbs.ValidityStartDate,
      wbs.WBSElementExternalID,
      wbs.ParentWBSElementExternalID,
      wbs.NodeType,
      wbs.HierarchyNodeSequence,
      wbs.HierarchyNodeLevel
}
