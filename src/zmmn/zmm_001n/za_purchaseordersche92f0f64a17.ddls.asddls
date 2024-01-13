/********** GENERATED on 11/18/2023 at 12:02:52 by CB9980000012**************/
 @OData.entitySet.name: 'A_PurchaseOrderScheduleLine' 
 @OData.entityType.name: 'A_PurchaseOrderScheduleLineType' 
 define root abstract entity ZA_PURCHASEORDERSCHE92F0F64A17 { 
 key PurchasingDocument : abap.char( 10 ) ; 
 key PurchasingDocumentItem : abap.numc( 5 ) ; 
 key ScheduleLine : abap.numc( 4 ) ; 
 @Odata.property.valueControl: 'DelivDateCategory_vc' 
 DelivDateCategory : abap.char( 1 ) ; 
 DelivDateCategory_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ScheduleLineDeliveryDate_vc' 
 ScheduleLineDeliveryDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 ScheduleLineDeliveryDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseOrderQuantityUnit_vc' 
 @Semantics.unitOfMeasure: true 
 PurchaseOrderQuantityUnit : abap.unit( 3 ) ; 
 PurchaseOrderQuantityUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ScheduleLineOrderQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit' 
 ScheduleLineOrderQuantity : abap.dec( 13, 3 ) ; 
 ScheduleLineOrderQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ScheduleLineDeliveryTime_vc' 
 ScheduleLineDeliveryTime : RAP_CP_ODATA_V2_EDM_TIME ; 
 ScheduleLineDeliveryTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SchedLineStscDeliveryDate_vc' 
 SchedLineStscDeliveryDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 SchedLineStscDeliveryDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseRequisition_vc' 
 PurchaseRequisition : abap.char( 10 ) ; 
 PurchaseRequisition_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseRequisitionItem_vc' 
 PurchaseRequisitionItem : abap.numc( 5 ) ; 
 PurchaseRequisitionItem_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ScheduleLineCommittedQuanti_vc' 
 @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit' 
 ScheduleLineCommittedQuantity : abap.dec( 13, 3 ) ; 
 ScheduleLineCommittedQuanti_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PerformancePeriodStartDate_vc' 
 PerformancePeriodStartDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 PerformancePeriodStartDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PerformancePeriodEndDate_vc' 
 PerformancePeriodEndDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 PerformancePeriodEndDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_SubcontractingComponent' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SubcontractingComponent : association [0..*] to ZA_POSUBCONTRACTINGC10922380D3 on 1 = 1; 
 } 
