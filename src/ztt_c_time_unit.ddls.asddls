@AbapCatalog.sqlViewName: 'ZTTC_TIME_UNIT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Time Unit'

@Search.searchable: true

@OData.publish: true

@UI.headerInfo.typeName: 'Time Unit'
@UI.headerInfo.typeNamePlural: 'Time Units'
@UI.headerInfo.title.value: 'timeUnit'

define view ZTT_C_TIME_UNIT
    as select from ZTT_I_TIME_UNIT as timeUnit
    association [0..*] to ZTT_I_DOMAIN_TEXT as _text on _text.domainName    = 'ZTT_TIME_UNIT'
                                                    and _text.valuePosition = timeUnit.valpos
{
    
    @ObjectModel.text.association: '_text'

    @Search: { defaultSearchElement: true, ranking: #HIGH }
    key timeUnit,
    
    @Consumption.hidden: true
    valpos,
    
    /* Associations */
    _text
}