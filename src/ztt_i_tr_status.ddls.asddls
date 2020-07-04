@AbapCatalog.sqlViewName: 'ZTTI_TRSTAT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transport Request Status'

@ObjectModel: {
    representativeKey: 'status',
    resultSet.sizeCategory: #XS
}

@UI.headerInfo.typeName: 'Transport Request Status'
@UI.headerInfo.typeNamePlural: 'Transport Request Statuses'
@UI.headerInfo.title.value: 'status'

@Search.searchable: true

define view ZTT_I_TR_STATUS
    as select from dd07l
    association [0..*] to ZTT_I_DOMAIN_TEXT as _text on _text.domainName    = 'TRSTATUS'
                                                    and _text.valuePosition = dd07l.valpos
{
    @ObjectModel.text.association: '_text'
    @Search.defaultSearchElement: true
    @Search.ranking: #HIGH
    key cast( dd07l.domvalue_l as trstatus ) as status,
    
    @Consumption.hidden: true
    valpos,
    
    _text
    
} where dd07l.domname  = 'TRSTATUS'
    and dd07l.as4local = 'A';
    
