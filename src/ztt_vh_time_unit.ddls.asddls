@AbapCatalog.sqlViewName: 'ZTTVH_TIME_UNIT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Time Unit Value Help'

@Search.searchable: true
@OData.publish:true

@ObjectModel.representativeKey: 'timeUnit'
@ObjectModel.resultSet.sizeCategory: #XS

define view ZTT_VH_TIME_UNIT
    as select from dd07l
    association [0..1] to ZTT_I_DOMAIN_TEXT as _text on _text.domainName    = 'ZTT_TIME_UNIT'
                                                    and _text.valuePosition = dd07l.valpos
                                                    and _text.language      = $session.system_language
{

    @UI.lineItem.position: 10
    @UI.identification: {position: 10, importance: #HIGH }
    @UI.selectionField.position: 10
    @ObjectModel.text.element: 'description'
    @Search: { defaultSearchElement: true, ranking: #MEDIUM }
    key cast( dd07l.domvalue_l as ZTT_TIME_UNIT ) as timeUnit,
    
    @UI.lineItem.position: 20
    @UI.identification: {position: 20, importance: #MEDIUM }
    @UI.selectionField.position: 20
    @Semantics.text: true
    @Search: { defaultSearchElement: true, ranking: #HIGH, fuzzinessThreshold: 0.7 }
    _text.shortText as description
    
} where dd07l.domname  = 'ZTT_TIME_UNIT'
    and dd07l.as4local = 'A';
