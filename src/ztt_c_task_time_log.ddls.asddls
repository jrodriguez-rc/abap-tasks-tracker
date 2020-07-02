@AbapCatalog.sqlViewName: 'ZTTC_TASKTIMELOG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption: Time log'

@Search.searchable: true
@Metadata.allowExtensions

@ObjectModel: {
    representativeKey: 'code',
    semanticKey: [ 'project_code', 'task_code', 'code' ],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    transactionalProcessingDelegated: true
}

@UI.headerInfo:
{
    typeName: 'Time Log',
    typeNamePlural: 'Time Logs'
}

define view ZTT_C_TASK_TIME_LOG
    as select from ZTT_I_TASK_TIME_LOG
    association [1] to ZTT_C_PROJECTS as _project        on $projection.projectCode = _project.projectCode
    association [1] to ZTT_C_TASKS    as _task           on $projection.projectCode = _task.projectCode
                                                          and $projection.taskCode = _task.code
    association [0..1] to ZTT_VH_USER as _createUserInfo on $projection.createdBy = _createUserInfo.userName
{

        @ObjectModel: { 
            mandatory: true,
            readOnly: true
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #HIGH,
            fuzzinessThreshold: 1
        }
        @UI: {
            identification: {
                position: 10,
                importance: #HIGH
            },
            lineItem: {
                position: 10,
                importance: #HIGH
            },
            selectionField.position: 10,
            dataPoint.title: 'Project code'
        }
        @Consumption.valueHelp: '_project'
    key project_code as projectCode,

        @ObjectModel: { 
            mandatory: true,
            readOnly: true
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #HIGH,
            fuzzinessThreshold: 1
        }
        @UI: {
            identification: {
                position: 20,
                importance: #HIGH
            },
            lineItem: {
                position: 20,
                importance: #HIGH
            },
            selectionField.position: 10,
            dataPoint.title: 'Task code'
        }
        @Consumption.valueHelp: '_task'
    key task_code as taskCode,

        @ObjectModel: { 
            mandatory: true,
            readOnly: true
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #HIGH,
            fuzzinessThreshold: 1
        }
        @UI: {
            identification: {
                position: 30,
                importance: #HIGH
            },
            lineItem: {
                position: 30,
                importance: #HIGH
            },
            selectionField.position: 10,
            dataPoint.title: 'Time Log Code'
        }
    key code,
        
        @ObjectModel: { 
            readOnly: true
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #MEDIUM,
            fuzzinessThreshold: 1
        }
        @UI: {
            identification: {
                position: 40,
                importance: #MEDIUM
            },
            lineItem: {
                position: 40,
                importance: #MEDIUM
            },
            selectionField.position: 40,
            dataPoint.title: 'Created by'
        }
        crea_uname as createdBy,

        @ObjectModel: { 
            mandatory: true
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #HIGH,
            fuzzinessThreshold: 1
        }
        @UI: {
            identification: {
                position: 50,
                importance: #MEDIUM
            },
            lineItem: {
                position: 50,
                importance: #MEDIUM
            },
            selectionField.position: 50,
            dataPoint.title: 'Started on'
        }
        start_ts as startedOn,
    
        @ObjectModel: { 
            mandatory: true
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #MEDIUM,
            fuzzinessThreshold: 1
        }
        @UI: {
            identification: {
                position: 60,
                importance: #MEDIUM
            },
            lineItem: {
                position: 60,
                importance: #MEDIUM
            },
            selectionField.position: 60,
            dataPoint.title: 'Ended on'
        }
        end_ts as endedOn,
    
        @ObjectModel: { 
            mandatory: true,
            readOnly: true
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #MEDIUM,
            fuzzinessThreshold: 1
        }
        @UI: {
            identification: {
                position: 70,
                importance: #MEDIUM
            },
            lineItem: {
                position: 70,
                importance: #MEDIUM
            },
            selectionField.position: 70,
            dataPoint.title: 'Total hours'
        }
        total_hours as totalHours,

        /* Associations */
        _project,
        @ObjectModel.association.type: [#TO_COMPOSITION_ROOT,#TO_COMPOSITION_PARENT]
        _task,
        _createUserInfo

}