@AbapCatalog.sqlViewName: 'ZTTI_DOMAIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Domain values'

@Search.searchable: true

@ObjectModel: {
    representativeKey: ['domainName','value'],
    resultSet.sizeCategory: #XS
}

define view ZTT_I_DOMAIN
    as select from dd07l
    association [0..*] to ZTT_I_DOMAIN_TEXT as _text
        on $projection.domainName = _text.domainName
       and $projection.valpos = _text.valuePosition
{
    @ObjectModel.text.association: '_text'
    @Search.defaultSearchElement: true
    @Search.ranking: #HIGH
    key domname as domainName,
    
    key domvalue_l as value,
    
    @Consumption.hidden: true
    valpos,
    
    _text
    
}
