@AbapCatalog.sqlViewName: 'ZTTI_ACTTYPE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Activity Type'

@Search.searchable: true

@ObjectModel: {
    representativeKey: 'activityType',
    resultSet.sizeCategory: #XS
}

@UI.headerInfo.typeName: 'Activity Type'
@UI.headerInfo.typeNamePlural: 'Activity Types'
@UI.headerInfo.title.value: 'activityType'

define view ZTT_I_ACTIVITY_TYPE
    as select from dd07l
    association [0..*] to ZTT_I_DOMAIN_TEXT as _text on _text.domainName    = 'ZTT_ACTIVITY_TYPE'
                                                      and _text.valuePosition = dd07l.valpos
{
    @ObjectModel.text.association: '_text'
    @Search.defaultSearchElement: true
    @Search.ranking: #HIGH
    key cast( dd07l.domvalue_l as ZTT_ACTIVITY_TYPE ) as activityType,
    
    @Consumption.hidden: true
    valpos,
    
    _text
    
} where dd07l.domname  = 'ZTT_ACTIVITY_TYPE'
    and dd07l.as4local = 'A';
    
