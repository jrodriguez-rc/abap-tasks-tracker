@AbapCatalog.sqlViewName: 'ZTT_TRT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Transport Requests Text'
                        
@Search.searchable: true

@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: [ 'request' ]

define view ZTT_I_TRANSPORT_REQUESTS_TEXT
    as select from e07t
{
    key trkorr as request,
    
    @Semantics.language: true
    key langu as language,
    
    @Semantics.text: true
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    @Search.ranking: #HIGH
    as4text as text
}
