/********** GENERATED on 11/22/2023 at 07:31:46 by CB9980000012**************/
 @OData.entitySet.name: 'SAPObjectDocumentTypeSet' 
 @OData.entityType.name: 'SAPObjectDocumentType' 
 define root abstract entity ZSAPOBJECTDOCUMENTTYPESET { 
 key SAPObjectType : abap.char( 30 ) ; 
 key SAPObjectNodeType : abap.char( 30 ) ; 
 key HarmonizedDocumentType : abap.char( 40 ) ; 
 @Odata.property.valueControl: 'DocumentTypeDescription_vc' 
 DocumentTypeDescription : abap.char( 40 ) ; 
 DocumentTypeDescription_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PermittedArchiveLinkMimeTyp_vc' 
 PermittedArchiveLinkMimeType : abap.char( 128 ) ; 
 PermittedArchiveLinkMimeTyp_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AttachmentFramework_vc' 
 AttachmentFramework : abap.char( 3 ) ; 
 AttachmentFramework_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DocumentTypeIsDefault_vc' 
 DocumentTypeIsDefault : abap.char( 1 ) ; 
 DocumentTypeIsDefault_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
