//@AbapCatalog.sqlViewName: ''
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'Allowance App Header Projection'
@EndUserText.label: 'Projection view for Header table'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZFI_001_ALW_P_HEADER2
  provider contract transactional_query
  as projection on ZFI_001_ALW_HEADER2
{
      @UI.facet: [{
                id: 'StudentData',
                purpose: #STANDARD,
                label: 'Student Data',
                type: #IDENTIFICATION_REFERENCE,
                position: 10
            },{
                id: 'Upload',
                purpose: #STANDARD,
                label: 'Upload Attachments',
                type: #LINEITEM_REFERENCE,
                position: 20,
                targetElement: '_Item'
            }]

      @UI: {
          selectionField: [{ position: 10,exclude: true }],
          lineItem: [{ position: 10,hidden: true }],
          identification: [{ position: 10,hidden: true }]
      }
  key Id,
      @UI: {
            lineItem: [{position: 20,hidden: true }],
            identification: [{position: 20,hidden: true }]
            }
      Refdoc,

      @UI: {
            lineItem: [{position: 30,hidden: true }],
            identification: [{position: 30,hidden: true }]
            }
      Bustratype,
      @UI: {
            lineItem: [{position: 40,hidden: true }],
            identification: [{position: 40,hidden: true }]
            }
      Accdoctype,
      @UI: {
            lineItem: [{position: 50 }],
            identification: [{position: 50,hidden: true }]
            }
      Docno,
      @UI: {
            lineItem: [{position: 60 }],
            identification: [{position: 60 }]
            }
      Comcode,
      @UI: {
            lineItem: [{position: 70 }],
            identification: [{position: 70 }]
            }
      Docdate,
      @UI: {
            lineItem: [{position: 80 },
            {type: #FOR_ACTION,
             dataAction: 'jount',
             label: 'Create Journal Entry'},
             {type: #FOR_ACTION,
             dataAction: 'att',
             label: 'Attachment'}],
            identification: [{position: 80 }]
            }
      Pastdate,
      @UI: {
            lineItem: [{position: 90 }],
            identification: [{position: 90 }]
            }
      Taxdetdate,
      @UI: {
            lineItem: [{position: 100 }],
            identification: [{position: 100 }]
            }
      Attachment,
      @UI: {
            lineItem: [{position: 110,hidden: true }],
            identification: [{position: 110,hidden: true }]
            }
      Mimetype,
      @UI: {
            lineItem: [{position: 120,hidden: true }],
            identification: [{position: 120,hidden: true }]
            }
      Filename,
      Lastchangedat,
      Locallastchangedat,
      /* Associations */
      _Item : redirected to composition child ZFI_001_ALW_P_ITEM2
}
