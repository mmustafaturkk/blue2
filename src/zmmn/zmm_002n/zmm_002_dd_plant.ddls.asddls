@EndUserText.label: 'Plant Value Help'
@AccessControl.authorizationCheck: #CHECK
define root view entity zmm_002_dd_plant
  as select from I_Plant as plant
{
  key plant.Plant,
      plant.PlantName
}
