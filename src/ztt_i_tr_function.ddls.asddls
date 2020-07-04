@AbapCatalog.sqlViewName: 'ZTTI_TRFUNC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transport Request Function'

@ObjectModel: {
    representativeKey: 'function',
    resultSet.sizeCategory: #XS
}

@UI.headerInfo.typeName: 'Transport Request Function'
@UI.headerInfo.typeNamePlural: 'Transport Request Functions'
@UI.headerInfo.title.value: 'function'

@Search.searchable: true

define view ZTT_I_TR_FUNCTION
    as select from dd07l
    association [0..*] to ZTT_I_DOMAIN_TEXT as _text on _text.domainName    = 'TRFUNCTION'
                                                    and _text.valuePosition = dd07l.valpos
{
    @ObjectModel.text.association: '_text'
    @Search.defaultSearchElement: true
    @Search.ranking: #HIGH
    key cast( dd07l.domvalue_l as trfunction ) as function,
    
    @Consumption.hidden: true
    valpos,
    
    _text
    
} where dd07l.domname  = 'TRFUNCTION'
    and dd07l.as4local = 'A';
    
