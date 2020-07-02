@AbapCatalog.sqlViewName: 'ZTTC_TASKTR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption: Task Transport Requests'

@Search.searchable: true
@Metadata.allowExtensions

@ObjectModel: {
    representativeKey: 'request',
    semanticKey: [ 'projectCode', 'taskCode', 'request' ],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    transactionalProcessingDelegated: true
}

@UI.headerInfo:
{
    typeName: 'Transport Request',
    typeNamePlural: 'Transport Requests',
    title.value: 'request',
    title.label: 'Transport Request'
}

define view ZTT_C_TASK_TRANSPORT_REQUEST
    as select from ZTT_I_TASK_TRANSPORT_REQUEST
    association [1] to ZTT_C_PROJECTS as _project on $projection.projectCode = _project.projectCode
    association [1] to ZTT_C_TASKS    as _task    on $projection.projectCode = _task.projectCode
                                                   and $projection.taskCode    = _task.code
{

        @UI: {
            identification: [{ position: 10, importance: #HIGH }],
            lineItem:[{position: 10, importance: #HIGH}],
            selectionField:[{position: 10}],
            dataPoint.title: 'Project'
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #HIGH,
            fuzzinessThreshold: 1
        }
        @Consumption.valueHelp:'_project'
    key project_code as projectCode,
    
        @UI: {
            identification: [{ position: 20, importance: #HIGH }],
            lineItem:[{position: 20, importance: #HIGH}],
            selectionField:[{position: 20}],
            dataPoint.title: 'Task'
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #HIGH,
            fuzzinessThreshold: 1
        }
        @Consumption.valueHelp:'_task'
    key task_code as taskCode,
    
        @UI: {
            identification: [{ position: 30, importance: #HIGH }],
            lineItem:[{position: 30, importance: #HIGH}],
            selectionField:[{position: 30}],
            dataPoint.title: 'Trans.Request'
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #HIGH,
            fuzzinessThreshold: 1
        }
        @Consumption.valueHelp:'_request'
    key transport_request as request,
    
        @UI: {
            identification: [{ position: 50, importance: #LOW }],
            lineItem:[{position: 50, importance: #LOW}]
        }
        commentary,
        
        /* Associations */
        _project,
        @ObjectModel.association.type: [#TO_COMPOSITION_ROOT,#TO_COMPOSITION_PARENT]
        _task,
        _request
    
}