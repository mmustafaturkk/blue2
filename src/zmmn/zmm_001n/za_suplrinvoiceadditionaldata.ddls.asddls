/********** GENERATED on 11/20/2023 at 11:58:39 by CB9980000012**************/
 @OData.entitySet.name: 'A_SuplrInvoiceAdditionalData' 
 @OData.entityType.name: 'A_SuplrInvoiceAdditionalDataType' 
 define root abstract entity ZA_SUPLRINVOICEADDITIONALDATA { 
 key SupplierInvoice : abap.char( 10 ) ; 
 key FiscalYear : abap.numc( 4 ) ; 
 @Odata.property.valueControl: 'InvoicingPartyName1_vc' 
 InvoicingPartyName1 : abap.char( 35 ) ; 
 InvoicingPartyName1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InvoicingPartyName2_vc' 
 InvoicingPartyName2 : abap.char( 35 ) ; 
 InvoicingPartyName2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InvoicingPartyName3_vc' 
 InvoicingPartyName3 : abap.char( 35 ) ; 
 InvoicingPartyName3_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InvoicingPartyName4_vc' 
 InvoicingPartyName4 : abap.char( 35 ) ; 
 InvoicingPartyName4_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PostalCode_vc' 
 PostalCode : abap.char( 10 ) ; 
 PostalCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CityName_vc' 
 CityName : abap.char( 35 ) ; 
 CityName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Country_vc' 
 Country : abap.char( 3 ) ; 
 Country_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'StreetAddressName_vc' 
 StreetAddressName : abap.char( 35 ) ; 
 StreetAddressName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'POBox_vc' 
 POBox : abap.char( 10 ) ; 
 POBox_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'POBoxPostalCode_vc' 
 POBoxPostalCode : abap.char( 10 ) ; 
 POBoxPostalCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PostOfficeBankAccount_vc' 
 PostOfficeBankAccount : abap.char( 16 ) ; 
 PostOfficeBankAccount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BankAccount_vc' 
 BankAccount : abap.char( 18 ) ; 
 BankAccount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Bank_vc' 
 Bank : abap.char( 15 ) ; 
 Bank_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BankCountry_vc' 
 BankCountry : abap.char( 3 ) ; 
 BankCountry_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxID1_vc' 
 TaxID1 : abap.char( 16 ) ; 
 TaxID1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxID2_vc' 
 TaxID2 : abap.char( 11 ) ; 
 TaxID2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxID3_vc' 
 TaxID3 : abap.char( 18 ) ; 
 TaxID3_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxID4_vc' 
 TaxID4 : abap.char( 18 ) ; 
 TaxID4_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxID5_vc' 
 TaxID5 : abap.char( 60 ) ; 
 TaxID5_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OneTmeAccountIsVATLiable_vc' 
 OneTmeAccountIsVATLiable : abap_boolean ; 
 OneTmeAccountIsVATLiable_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OneTmeAcctIsEqualizationTxS_vc' 
 OneTmeAcctIsEqualizationTxSubj : abap_boolean ; 
 OneTmeAcctIsEqualizationTxS_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Region_vc' 
 Region : abap.char( 3 ) ; 
 Region_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BankControlKey_vc' 
 BankControlKey : abap.char( 2 ) ; 
 BankControlKey_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DataExchangeInstructionKey_vc' 
 DataExchangeInstructionKey : abap.char( 2 ) ; 
 DataExchangeInstructionKey_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DataMediumExchangeIndicator_vc' 
 DataMediumExchangeIndicator : abap.char( 1 ) ; 
 DataMediumExchangeIndicator_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LanguageCode_vc' 
 LanguageCode : abap.char( 2 ) ; 
 LanguageCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsOneTimeAccount_vc' 
 IsOneTimeAccount : abap_boolean ; 
 IsOneTimeAccount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaymentRecipient_vc' 
 PaymentRecipient : abap.char( 16 ) ; 
 PaymentRecipient_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AccountTaxType_vc' 
 AccountTaxType : abap.char( 2 ) ; 
 AccountTaxType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxNumberType_vc' 
 TaxNumberType : abap.char( 2 ) ; 
 TaxNumberType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsNaturalPerson_vc' 
 IsNaturalPerson : abap_boolean ; 
 IsNaturalPerson_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BankDetailReference_vc' 
 BankDetailReference : abap.char( 20 ) ; 
 BankDetailReference_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RepresentativeName_vc' 
 RepresentativeName : abap.char( 10 ) ; 
 RepresentativeName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BusinessType_vc' 
 BusinessType : abap.char( 30 ) ; 
 BusinessType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IndustryType_vc' 
 IndustryType : abap.char( 30 ) ; 
 IndustryType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FormOfAddressName_vc' 
 FormOfAddressName : abap.char( 15 ) ; 
 FormOfAddressName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'VATRegistration_vc' 
 VATRegistration : abap.char( 20 ) ; 
 VATRegistration_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OneTimeAcctCntrySpecificRef_vc' 
 OneTimeAcctCntrySpecificRef1 : abap.char( 140 ) ; 
 OneTimeAcctCntrySpecificRef_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IBAN_vc' 
 IBAN : abap.char( 34 ) ; 
 IBAN_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SWIFTCode_vc' 
 SWIFTCode : abap.char( 11 ) ; 
 SWIFTCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OneTimeBusinessPartnerEmail_vc' 
 OneTimeBusinessPartnerEmail : abap.char( 130 ) ; 
 OneTimeBusinessPartnerEmail_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
