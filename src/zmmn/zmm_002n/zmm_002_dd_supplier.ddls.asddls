@EndUserText.label: 'Supplier Value Help'
@AccessControl.authorizationCheck: #CHECK
//Expense App İçerisinde Employee ID için Value Help Olarak Kullanılacak CDS
define root view entity ZMM_002_DD_SUPPLIER
  as select from I_Supplier as Supplier
{
  key Supplier,
      SupplierName
}
where
  substring(Supplier, 1, 2) = '99'
