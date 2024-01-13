/********** GENERATED on 11/22/2023 at 07:31:44 by CB9980000012**************/
 @OData.entitySet.name: 'AttachmentHarmonizedOperationSet' 
 @OData.entityType.name: 'AttachmentHarmonizedOperation' 
 define root abstract entity ZATTACHMENTHARMONIZEDOPERATION { 
 key LogicalDocument : abap.char( 32 ) ; 
 key ArchiveDocumentID : abap.char( 40 ) ; 
 key LinkedSAPObjectKey : abap.char( 90 ) ; 
 key SAPObjectType : abap.char( 30 ) ; 
 key HarmonizedDocumentType : abap.char( 40 ) ; 
 @Odata.property.valueControl: 'DocumentInfoRecordDocType_vc' 
 DocumentInfoRecordDocType : abap.char( 3 ) ; 
 DocumentInfoRecordDocType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DocumentInfoRecordDocNumber_vc' 
 DocumentInfoRecordDocNumber : abap.char( 25 ) ; 
 DocumentInfoRecordDocNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DocumentInfoRecordDocVersio_vc' 
 DocumentInfoRecordDocVersion : abap.char( 2 ) ; 
 DocumentInfoRecordDocVersio_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DocumentInfoRecordDocPart_vc' 
 DocumentInfoRecordDocPart : abap.char( 3 ) ; 
 DocumentInfoRecordDocPart_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BusinessObjectTypeName_vc' 
 BusinessObjectTypeName : abap.char( 40 ) ; 
 BusinessObjectTypeName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FileSize_vc' 
 FileSize : abap.char( 12 ) ; 
 FileSize_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FileName_vc' 
 FileName : abap.char( 255 ) ; 
 FileName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MimeType_vc' 
 MimeType : abap.char( 128 ) ; 
 MimeType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CheckoutUser_vc' 
 CheckoutUser : abap.char( 12 ) ; 
 CheckoutUser_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CheckoutUserFullName_vc' 
 CheckoutUserFullName : abap.char( 80 ) ; 
 CheckoutUserFullName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreatedByUser_vc' 
 CreatedByUser : abap.char( 12 ) ; 
 CreatedByUser_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreatedByUserFullName_vc' 
 CreatedByUserFullName : abap.char( 80 ) ; 
 CreatedByUserFullName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreationDateTime_vc' 
 CreationDateTime : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 CreationDateTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LastChangedByUser_vc' 
 LastChangedByUser : abap.char( 12 ) ; 
 LastChangedByUser_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LastChangedByUserFullName_vc' 
 LastChangedByUserFullName : abap.char( 80 ) ; 
 LastChangedByUserFullName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ChangedDateTime_vc' 
 ChangedDateTime : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 ChangedDateTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'StorageCategory_vc' 
 StorageCategory : abap.char( 10 ) ; 
 StorageCategory_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ArchiveLinkRepository_vc' 
 ArchiveLinkRepository : abap.char( 2 ) ; 
 ArchiveLinkRepository_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SAPObjectNodeType_vc' 
 SAPObjectNodeType : abap.char( 30 ) ; 
 SAPObjectNodeType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AttachmentDeletionIsAllowed_vc' 
 AttachmentDeletionIsAllowed : abap_boolean ; 
 AttachmentDeletionIsAllowed_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AttachmentRenameIsAllowed_vc' 
 AttachmentRenameIsAllowed : abap_boolean ; 
 AttachmentRenameIsAllowed_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'URLToUploadAttachment_vc' 
 URLToUploadAttachment : abap.string( 0 ) ; 
 URLToUploadAttachment_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'URLToReadAttachment_vc' 
 URLToReadAttachment : abap.string( 0 ) ; 
 URLToReadAttachment_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OneTimeValidTokenForAttachm_vc' 
 OneTimeValidTokenForAttachment : abap.char( 128 ) ; 
 OneTimeValidTokenForAttachm_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
