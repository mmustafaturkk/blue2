@EndUserText.label: 'Product Group Value Help'
@AccessControl.authorizationCheck: #CHECK
define root view entity zmm_002_dd_productgroup
  as select from I_ProductGroup_2     as prdgrp
    inner join   I_ProductGroupText_2 as prdgrp_text on prdgrp_text.ProductGroup = prdgrp.ProductGroup
{
  key prdgrp.ProductGroup,
      //  key prdgrp_text.Language,
      prdgrp_text.ProductGroupText
}
where
      prdgrp_text.Language                 = $session.system_language
  and substring(prdgrp.ProductGroup, 1, 3) = 'EXP'
