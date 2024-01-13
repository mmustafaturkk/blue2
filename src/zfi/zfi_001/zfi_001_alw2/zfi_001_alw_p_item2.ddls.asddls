//@AbapCatalog.sqlViewName: ''
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'Allowance App Item Projection'
@EndUserText.label: 'Projection for Attachment'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZFI_001_ALW_P_ITEM2
  as projection on ZFI_001_ALW_ITEM2
{
      @UI.facet: [{
                   id: 'StudentData',
                   purpose: #STANDARD,
                   label: 'Attachment Information',
                   type: #IDENTIFICATION_REFERENCE,
                   position: 10
               }]

      @UI: {
            lineItem: [{ position: 10,hidden: true }],
            identification: [{ position: 10,hidden: true }]
        }

  key AttachId,
      Id,
      @UI: {
            lineItem: [{ position: 20,hidden: true }],
            identification: [{ position: 20,hidden: true }]
        }
      Refdocitem,
      @UI: {
            lineItem: [{ position: 30 }],
            identification: [{ position: 30 }]
        }
      Glacc,
      @UI: {
            lineItem: [{ position: 40 }],
            identification: [{ position: 40 }]
        }
      Amnintracur,
      @UI: {
            lineItem: [{ position: 50,hidden: true }],
            identification: [{ position: 50,hidden: true }]
        }
      Currcode,
      @UI: {
            lineItem: [{ position: 60 }],
            identification: [{ position: 60 }]
        }
      Debcrecode,
      @UI: {
            lineItem: [{ position: 70 }],
            identification: [{ position: 70 }]
        }
      Docitemtext,
      @UI: {
            lineItem: [{ position: 80 }],
            identification: [{ position: 80 }]
        }
      Taxcode,
      @UI: {
            lineItem: [{ position: 90 }],
            identification: [{ position: 90 }]
        }
      Costcenter,
      @UI: {
            lineItem: [{ position: 100 }],
            identification: [{ position: 100 }]
        }
      Profitcenter,
      @UI: {
            lineItem: [{ position: 110 }],
            identification: [{ position: 110 }]
        }
      Segment,
      @UI: {
            lineItem: [{ position: 120 }],
            identification: [{ position: 120 }]
        }
      Funcarea,
      @UI: {
            lineItem: [{ position: 130 }],
            identification: [{ position: 130 }]
        }
      Valdate,
      @UI: {
            lineItem: [{ position: 140 }],
            identification: [{ position: 140 }]
        }
      Housebank,
      @UI: {
            lineItem: [{ position: 150 }],
            identification: [{ position: 150 }]
        }
      Housebankacc,
      @UI: {
            lineItem: [{ position: 160,hidden: true }],
            identification: [{ position: 160,hidden: true }]
        }
      Taxclas,
      @UI: {
            lineItem: [{ position: 170,hidden: true }],
            identification: [{ position: 170,hidden: true }]
        }
      Contype,
      @UI: {
            lineItem: [{ position: 180 }],
            identification: [{ position: 180 }]
        }
      Taxbaseamnt,
      LastChangedat,
      /* Associations */
      _Header : redirected to parent ZFI_001_ALW_P_HEADER2
}
