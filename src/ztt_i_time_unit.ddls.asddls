@AbapCatalog.sqlViewName: 'ZTTI_TIME_UNIT'
@EndUserText.label: 'Time Unit'
@Search.searchable: true
@AccessControl.authorizationCheck: #NOT_REQUIRED

define view ZTT_I_TIME_UNIT
    as select from dd07l as timeUnit
    association [0..*] to ZTT_I_DOMAIN_TEXT as _text on _text.domainName    = 'ZTT_TIME_UNIT'
                                                    and _text.valuePosition = timeUnit.valpos
{

    @ObjectModel.text.association: '_text'
    @Search: { defaultSearchElement: true, ranking: #HIGH }
    key cast( timeUnit.domvalue_l as ZTT_TIME_UNIT ) as timeUnit,
    
    valpos,
    
    _text
    
} where timeUnit.domname = 'ZTT_TIME_UNIT'
    and timeUnit.as4local = 'A';
