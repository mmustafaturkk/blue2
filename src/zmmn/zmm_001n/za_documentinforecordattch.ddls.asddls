/********** GENERATED on 11/22/2023 at 07:31:46 by CB9980000012**************/
 @OData.entitySet.name: 'A_DocumentInfoRecordAttch' 
 @OData.entityType.name: 'A_DocumentInfoRecordAttchType' 
 define root abstract entity ZA_DOCUMENTINFORECORDATTCH { 
 key DocumentInfoRecordDocType : abap.char( 3 ) ; 
 key DocumentInfoRecordDocNumber : abap.char( 25 ) ; 
 key DocumentInfoRecordDocVersion : abap.char( 2 ) ; 
 key DocumentInfoRecordDocPart : abap.char( 3 ) ; 
 @Odata.property.valueControl: 'DocumentInfoRecord_vc' 
 DocumentInfoRecord : abap.char( 70 ) ; 
 DocumentInfoRecord_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DocumentDescription_vc' 
 DocumentDescription : abap.char( 40 ) ; 
 DocumentDescription_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ExternalDocumentStatus_vc' 
 ExternalDocumentStatus : abap.char( 2 ) ; 
 ExternalDocumentStatus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DocumentStatusName_vc' 
 DocumentStatusName : abap.char( 16 ) ; 
 DocumentStatusName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DocInfoRecdIsMarkedForDelet_vc' 
 DocInfoRecdIsMarkedForDeletion : abap_boolean ; 
 DocInfoRecdIsMarkedForDelet_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'DocumentInfoRecordToAttachmentNavigation' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _DocumentInfoRecordToAttachme1 : association [0..*] to ZATTACHMENTCONTENTSET on 1 = 1; 
 } 
