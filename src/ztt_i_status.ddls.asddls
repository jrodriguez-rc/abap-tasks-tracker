@AbapCatalog.sqlViewName: 'ZTTI_STATUS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status'

@Search.searchable: true

@ObjectModel: {
    representativeKey: 'status',
    resultSet.sizeCategory: #XS
}

@UI.headerInfo.typeName: 'Status'
@UI.headerInfo.typeNamePlural: 'Statuses'
@UI.headerInfo.title.value: 'status'

define view ZTT_I_STATUS
    as select from dd07l as status
    association [0..*] to ZTT_I_DOMAIN_TEXT as _text on _text.domainName    = 'ZTT_STATUS'
                                                      and _text.valuePosition = status.valpos
{
    @ObjectModel.text.association: '_text'
    @Search: { defaultSearchElement: true, ranking: #HIGH }
    key cast( domvalue_l as ZTT_STATUS ) as status,
    
    @Consumption.hidden: true
    valpos,
    
    _text
    
} where status.domname = 'ZTT_STATUS'
    and status.as4local = 'A';
