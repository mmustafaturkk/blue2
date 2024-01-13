/********** GENERATED on 11/18/2023 at 12:04:58 by CB9980000012**************/
 @OData.entitySet.name: 'A_PurchaseOrderNote' 
 @OData.entityType.name: 'A_PurchaseOrderNoteType' 
 define root abstract entity ZA_PURCHASEORDERNOTEAF01A75441 { 
 key PurchaseOrder : abap.char( 10 ) ; 
 key TextObjectType : abap.char( 4 ) ; 
 key Language : abap.char( 2 ) ; 
 @Odata.property.valueControl: 'PlainLongText_vc' 
 PlainLongText : abap.string( 0 ) ; 
 PlainLongText_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
