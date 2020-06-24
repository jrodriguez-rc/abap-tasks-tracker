@AbapCatalog.sqlViewName: 'ZTTC_PROJECTS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projects'

@Search.searchable: true

@OData.publish: true
@Metadata.allowExtensions

@ObjectModel: {
    representativeKey: 'code',
    semanticKey: 'code',
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    transactionalProcessingDelegated: true
}

@UI.headerInfo:
{
    typeName: 'Project',
    typeNamePlural: 'Projects',
    title.value: 'name',
    title.label: 'Project'
}

define view ZTT_C_PROJECTS
    as select from ZTT_I_PROJECTS
    association [0..*] to ZTT_C_ISSUES as _issues
        on $projection.code = _issues.projectCode
    association [0..1] to ZTT_VH_TIME_UNIT as _timeUnit
        on $projection.defaultTimeUnit = _timeUnit.timeUnit
{

    @UI.lineItem: [
     {
       type: #FOR_ACTION, position: 1, dataAction: 'BOPF:START', label: 'Start project'
     }
    ]

    @UI.lineItem.position: 10
    @ObjectModel.mandatory: true
    @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
    @Search.defaultSearchElement: true
    @UI.identification: {position: 10, importance: #HIGH }
    @UI.selectionField.position: 10
    @UI.dataPoint.title: 'Project code'
    @ObjectModel.text.element: ['name']
    @Search.ranking: #HIGH
    @Search.fuzzinessThreshold: 1
    key code,
    
    @ObjectModel.mandatory: true
    @UI.dataPoint.title: 'Project name'
    @UI.identification: {position: 20, importance: #HIGH }
    @UI.lineItem.position: 20
    @UI.selectionField.position: 20
    @Search.fuzzinessThreshold: 0.8
    name,
    
    @UI.identification: {position: 30, importance: #MEDIUM }
    @UI.lineItem.position: 30
    @Consumption.valueHelp:'_timeUnit'
    @ObjectModel.foreignKey.association: '_timeUnit'
    default_time_unit as defaultTimeUnit,
    
    @Search.defaultSearchElement: true
    @UI.identification: {position: 40, importance: #MEDIUM }
    @UI.lineItem.position: 40
    started_on as startedOn,
    
    @UI.identification: {position: 50, importance: #LOW }
    @UI.lineItem.position: 50
    ended_on as endedOn,
    
    @ObjectModel.readOnly: true
    @UI.identification: {position: 70, importance: #LOW }
    @UI.lineItem.position: 70
    @Consumption.hidden: true
    crea_date_time as createdOn,
    
    @ObjectModel.readOnly: true
    @UI.identification: {position: 80, importance: #LOW }
    @UI.lineItem.position: 80
    @Consumption.hidden: true
    crea_uname as createdBy,
    
    @ObjectModel.readOnly: true
    @UI.identification: {position: 90, importance: #LOW }
    @UI.lineItem.position: 90
    @Consumption.hidden: true
    lchg_date_time as changedOn,
    
    @ObjectModel.readOnly: true
    @UI.identification: {position: 100, importance: #LOW }
    @UI.lineItem.position: 100
    @Consumption.hidden: true
    lchg_uname as changedBy,
    
    /* Associations */
    @UI.fieldGroup: [{qualifier: 'code', groupLabel: 'code', position: 60, importance: #HIGH }]
    @ObjectModel.association.type: #TO_COMPOSITION_CHILD
    _issues,
    _timeUnit
}
