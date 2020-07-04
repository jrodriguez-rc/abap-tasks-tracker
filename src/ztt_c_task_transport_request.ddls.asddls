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
  association [1] to ZTT_C_PROJECTS       as _project         on $projection.projectCode = _project.projectCode
  association [1] to ZTT_C_TASKS          as _task            on $projection.projectCode = _task.projectCode
                                                             and $projection.taskCode    = _task.code
  association [0..1] to ZTT_I_TR_STATUS   as _requestStatus   on $projection.requestStatus = _requestStatus.status
  association [0..1] to ZTT_I_TR_FUNCTION as _requestFunction on $projection.requestFunction = _requestFunction.function
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
            dataPoint.title: 'Transport Request'
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #HIGH,
            fuzzinessThreshold: 1
        }
        @Consumption.valueHelp:'_request'
    key transport_request as request,
    
        @UI: {
            identification: [{ position: 35, importance: #LOW }],
            lineItem:[{position: 35, importance: #LOW}],
            selectionField:[{position: 35}],
            textArrangement: #TEXT_ONLY
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #HIGH,
            fuzzinessThreshold: 1
        }
        @Consumption.valueHelp:'_requestFunction'
        @ObjectModel: {
            readOnly: true,
            foreignKey.association: '_requestFunction'
        }
        _request.function as requestFunction,
        
        @UI: {
            identification: [{ position: 37, importance: #LOW }],
            lineItem:[{position: 37, importance: #LOW}],
            selectionField:[{position: 37}],
            textArrangement: #TEXT_ONLY
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #HIGH,
            fuzzinessThreshold: 1
        }
        @Consumption.valueHelp:'_requestStatus'
        @ObjectModel: {
            readOnly: true,
            foreignKey.association: '_requestStatus'
        }
        _request.status as requestStatus,
    
        @UI: {
            identification: [{ position: 50, importance: #LOW }],
            lineItem:[{position: 50, importance: #LOW}]
        }
        commentary,
        
        /* Associations */
        _project,
        @ObjectModel.association.type: [#TO_COMPOSITION_ROOT,#TO_COMPOSITION_PARENT]
        _task,
        _requestStatus,
        _requestFunction,
        _request
    
}