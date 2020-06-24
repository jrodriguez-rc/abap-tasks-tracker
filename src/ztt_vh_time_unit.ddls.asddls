@AbapCatalog.sqlViewName: 'ZTTVH_TIME_UNIT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Time Unit Value Help'

@Search.searchable: true

@ObjectModel: {
    representativeKey: 'timeUnit',
    resultSet.sizeCategory: #XS
}

@UI.headerInfo.typeName: 'Time Unit'
@UI.headerInfo.typeNamePlural: 'Time Units'
@UI.headerInfo.title.value: 'timeUnit'

define view ZTT_VH_TIME_UNIT
    as select from dd07l
    association [0..*] to ZTT_I_DOMAIN_TEXT as _text on _text.domainName    = 'ZTT_TIME_UNIT'
                                                      and _text.valuePosition = dd07l.valpos
{
    @ObjectModel.text.association: '_text'
    @Search.defaultSearchElement: true
    @Search.ranking: #HIGH
    key cast( dd07l.domvalue_l as ZTT_TIME_UNIT ) as timeUnit,
    
    @Consumption.hidden: true
    valpos,
    
    _text
    
} where dd07l.domname  = 'ZTT_TIME_UNIT'
    and dd07l.as4local = 'A';
    