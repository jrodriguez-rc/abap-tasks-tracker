@AbapCatalog.sqlViewName: 'ZTTI_DOM_TEXT'
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: ['domainName,valuePosition']
@AccessControl.authorizationCheck: #NOT_REQUIRED
                        
@Search.searchable: true

define view ZTT_I_DOMAIN_TEXT
    as select from dd07t as textProvider
{

    key domname as domainName,
    key valpos as valuePosition,
    @Semantics.language: true
    key ddlanguage as language,
    @Semantics.text: true
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    @Search.ranking: #HIGH
    ddtext as shortText
    
} where as4local = 'A';
