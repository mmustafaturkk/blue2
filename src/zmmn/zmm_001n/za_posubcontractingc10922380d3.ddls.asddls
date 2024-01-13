/********** GENERATED on 11/18/2023 at 12:02:49 by CB9980000012**************/
 @OData.entitySet.name: 'A_POSubcontractingComponent' 
 @OData.entityType.name: 'A_POSubcontractingComponentType' 
 define root abstract entity ZA_POSUBCONTRACTINGC10922380D3 { 
 key PurchaseOrder : abap.char( 10 ) ; 
 key PurchaseOrderItem : abap.numc( 5 ) ; 
 key ScheduleLine : abap.numc( 4 ) ; 
 key ReservationItem : abap.numc( 4 ) ; 
 key RecordType : abap.char( 1 ) ; 
 @Odata.property.valueControl: 'Material_vc' 
 Material : abap.char( 40 ) ; 
 Material_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BOMItemDescription_vc' 
 BOMItemDescription : abap.char( 40 ) ; 
 BOMItemDescription_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RequiredQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 RequiredQuantity : abap.dec( 13, 3 ) ; 
 RequiredQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BaseUnit_vc' 
 @Semantics.unitOfMeasure: true 
 BaseUnit : abap.unit( 3 ) ; 
 BaseUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RequirementDate_vc' 
 RequirementDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 RequirementDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'QuantityInEntryUnit_vc' 
 @Semantics.quantity.unitOfMeasure: 'EntryUnit' 
 QuantityInEntryUnit : abap.dec( 13, 3 ) ; 
 QuantityInEntryUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'EntryUnit_vc' 
 @Semantics.unitOfMeasure: true 
 EntryUnit : abap.unit( 3 ) ; 
 EntryUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WithdrawnQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 WithdrawnQuantity : abap.dec( 13, 3 ) ; 
 WithdrawnQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Plant_vc' 
 Plant : abap.char( 4 ) ; 
 Plant_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Batch_vc' 
 Batch : abap.char( 10 ) ; 
 Batch_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
