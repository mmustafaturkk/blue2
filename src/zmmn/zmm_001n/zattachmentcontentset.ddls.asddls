/********** GENERATED on 11/22/2023 at 07:31:45 by CB9980000012**************/
 @OData.entitySet.name: 'AttachmentContentSet' 
 @OData.entityType.name: 'AttachmentContent' 
 define root abstract entity ZATTACHMENTCONTENTSET { 
 key DocumentInfoRecordDocType : abap.char( 3 ) ; 
 key DocumentInfoRecordDocNumber : abap.char( 25 ) ; 
 key DocumentInfoRecordDocVersion : abap.char( 2 ) ; 
 key DocumentInfoRecordDocPart : abap.char( 3 ) ; 
 key LogicalDocument : abap.char( 32 ) ; 
 key ArchiveDocumentID : abap.char( 40 ) ; 
 key LinkedSAPObjectKey : abap.char( 90 ) ; 
 key BusinessObjectTypeName : abap.char( 40 ) ; 
 @OData.property.valueControl: 'SemanticObject_vc' 
 SemanticObject : abap.char( 40 ) ; 
 SemanticObject_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'WorkstationApplication_vc' 
 WorkstationApplication : abap.char( 3 ) ; 
 WorkstationApplication_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'FileSize_vc' 
 FileSize : abap.char( 12 ) ; 
 FileSize_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'FileName_vc' 
 FileName : abap.char( 255 ) ; 
 FileName_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DocumentURL_vc' 
 DocumentURL : abap.string( 0 ) ; 
 DocumentURL_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'MimeType_vc' 
 MimeType : abap.char( 128 ) ; 
 MimeType_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Content_vc' 
 Content : abap.raw( 16 ) ; 
 Content_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'CreatedByUser_vc' 
 CreatedByUser : abap.char( 12 ) ; 
 CreatedByUser_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'CreatedByUserFullName_vc' 
 CreatedByUserFullName : abap.char( 80 ) ; 
 CreatedByUserFullName_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'CreationDateTime_vc' 
 CreationDateTime : rap_cp_odata_v2_edm_datetime ; 
 CreationDateTime_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'BusinessObjectType_vc' 
 BusinessObjectType : abap.char( 40 ) ; 
 BusinessObjectType_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'LastChangedByUser_vc' 
 LastChangedByUser : abap.char( 12 ) ; 
 LastChangedByUser_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'LastChangedByUserFullName_vc' 
 LastChangedByUserFullName : abap.char( 80 ) ; 
 LastChangedByUserFullName_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ChangedDateTime_vc' 
 ChangedDateTime : rap_cp_odata_v2_edm_datetime ; 
 ChangedDateTime_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'StorageCategory_vc' 
 StorageCategory : abap.char( 10 ) ; 
 StorageCategory_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ArchiveLinkRepository_vc' 
 ArchiveLinkRepository : abap.char( 2 ) ; 
 ArchiveLinkRepository_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SAPObjectType_vc' 
 SAPObjectType : abap.char( 30 ) ; 
 SAPObjectType_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SAPObjectNodeType_vc' 
 SAPObjectNodeType : abap.char( 30 ) ; 
 SAPObjectNodeType_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'HarmonizedDocumentType_vc' 
 HarmonizedDocumentType : abap.char( 40 ) ; 
 HarmonizedDocumentType_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'AttachmentDeletionIsAllowed_vc' 
 AttachmentDeletionIsAllowed : abap_boolean ; 
 AttachmentDeletionIsAllowed_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'AttachmentRenameIsAllowed_vc' 
 AttachmentRenameIsAllowed : abap_boolean ; 
 AttachmentRenameIsAllowed_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Source_vc' 
 Source : abap.char( 10 ) ; 
 Source_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'AttachmentContentHash_vc' 
 AttachmentContentHash : abap.char( 255 ) ; 
 AttachmentContentHash_vc : rap_cp_odata_value_control ; 
 
 } 
