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
    association [0..*] to ZTT_C_TASKS as _tasks   on $projection.projectCode = _tasks.projectCode
{

        @ObjectModel.text.element: ['name']
        @Search: {
            defaultSearchElement: true,
            ranking: #HIGH,
            fuzzinessThreshold: 1
        }
        @UI: {
            lineItem: {
                position: 10
            },
            identification: [{ position: 10, importance: #HIGH }],
            selectionField.position: 10,
            dataPoint.title: 'Project code'
        }
    key code as projectCode,
    
        @Search.fuzzinessThreshold: 0.8
        @UI.dataPoint.title: 'Project name'
        @UI.identification: [ {position: 20, importance: #HIGH },
                              {position: 20, label: 'Show Tasks', type: #FOR_INTENT_BASED_NAVIGATION, semanticObjectAction: 'tasks' } ]
        @UI.selectionField.position: 20
        @UI.lineItem: [ {position: 20, label: 'Show Tasks', type: #FOR_INTENT_BASED_NAVIGATION, semanticObjectAction: 'tasks' } ]
        @Consumption.semanticObject: 'tasksTracker'
        name,
        
        @Search.defaultSearchElement: true
        @UI.identification: {position: 40, importance: #MEDIUM }
        @UI.lineItem.position: 40
        started_on as startedOn,
        
        @UI.identification: {position: 50, importance: #LOW }
        @UI.lineItem.position: 50
        ended_on as endedOn,
        
        @UI.identification: {position: 60, importance: #LOW }
        @UI.lineItem.position: 60
        tr_target as transportTarget,
    
        @UI.identification: {position: 70, importance: #LOW }
        @UI.lineItem.position: 70
        cts_project as CTSProject,
    
        @Consumption.hidden: true
        crea_date_time as createdOn,
        
        @Consumption.hidden: true
        crea_uname as createdBy,
        
        @Consumption.hidden: true
        lchg_date_time as changedOn,
        
        @Consumption.hidden: true
        lchg_uname as changedBy,
        
        /* Associations */
//        @UI.fieldGroup: [{qualifier: 'code', groupLabel: 'code', position: 60, importance: #HIGH }]
//        @ObjectModel.association.type: #TO_COMPOSITION_CHILD
        _tasks
}
