/********** GENERATED on 11/18/2023 at 12:02:52 by CB9980000012**************/
 @OData.entitySet.name: 'A_PurchaseOrderItemNote' 
 @OData.entityType.name: 'A_PurchaseOrderItemNoteType' 
 define root abstract entity ZA_PURCHASEORDERITEM87581F9174 { 
 key PurchaseOrder : abap.char( 10 ) ; 
 key PurchaseOrderItem : abap.numc( 5 ) ; 
 key TextObjectType : abap.char( 4 ) ; 
 key Language : abap.char( 2 ) ; 
 @Odata.property.valueControl: 'PlainLongText_vc' 
 PlainLongText : abap.string( 0 ) ; 
 PlainLongText_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
