@AbapCatalog.sqlViewName: 'ZTTI_TASKCRITIC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Task Criticality'

@ObjectModel: {
    representativeKey: 'status',
    resultSet.sizeCategory: #XS
}

@UI.headerInfo.typeName: 'Task Criticality'
@UI.headerInfo.typeNamePlural: 'Task Criticalities'
@UI.headerInfo.title.value: 'criticality'

@Search.searchable: true

define view ZTT_I_TASK_CRITICALITY
    as select from dd07l
    association [0..*] to ZTT_I_DOMAIN_TEXT as _text on _text.domainName    = 'ZTT_TASK_CRITICALITY'
                                                    and _text.valuePosition = dd07l.valpos
{
    @ObjectModel.text.association: '_text'
    @Search.defaultSearchElement: true
    @Search.ranking: #HIGH
    key cast( substring(dd07l.domvalue_l, 1, 1) as ztt_task_criticality) as criticality,
    
    @Consumption.hidden: true
    valpos,
    
    _text
    
} where dd07l.domname  = 'ZTT_TASK_CRITICALITY'
    and dd07l.as4local = 'A';
    