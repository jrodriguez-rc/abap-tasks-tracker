@AbapCatalog.sqlViewName: 'ZTTC_TASKS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption: Tasks'

@Search.searchable: true
@OData.publish: true
@Metadata.allowExtensions

@ObjectModel: {
    representativeKey: 'code',
    semanticKey: [ 'projectCode', 'code' ],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    transactionalProcessingDelegated: true
}

@UI.headerInfo:
{
    typeName: 'Task',
    typeNamePlural: 'Tasks',
    title.label: 'Task',
    title.value: 'description'
}

define view ZTT_C_TASKS
    as select from ZTT_I_TASKS
    association [1] to ZTT_C_PROJECTS          as _project            on $projection.projectCode = _project.projectCode
    association [0..1] to ZTT_VH_USER          as _functionalUserInfo on $projection.functionalResponsible = _functionalUserInfo.userName
    association [0..1] to ZTT_VH_USER          as _technicalUserInfo  on $projection.technicalResponsible = _technicalUserInfo.userName
    association [0..1] to ZTT_VH_TIME_UNIT     as _timeUnit           on $projection.timeUnit = _timeUnit.timeUnit
    association [0..1] to ZTT_I_STATUS         as _status             on $projection.status = _status.status
    association [0..*] to ZTT_C_TASK_COMMENTS  as _comments           on $projection.code        = _comments.taskCode
                                                                       and $projection.projectCode = _comments.projectCode
    association [0..*] to ZTT_C_TASK_TRANSPORT_REQUEST as _transportRequests on $projection.code        = _transportRequests.taskCode
                                                                              and $projection.projectCode = _transportRequests.projectCode
    association [0..*] to ZTT_C_TASK_TIME_LOG          as _timeLog           on $projection.code                  = _timeLog.taskCode
                                                                               and $projection.projectCode           = _timeLog.projectCode
{
        @ObjectModel: { 
            mandatory: true,
            text.element: ['name']
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #HIGH,
            fuzzinessThreshold: 1
        }
        @UI: {
            identification: [
                {type: #FOR_ACTION, position: 1, dataAction: 'BOPF:CREATE_TR_WB', label: 'New Workbench TR'},
                {type: #FOR_ACTION, position: 2, dataAction: 'BOPF:CREATE_TR_CU', label: 'New Customizing TR'},
                { position: 10, importance: #HIGH }
            ],
            lineItem: {
                position: 10,
                importance: #HIGH
            },
            selectionField.position: 10,
            dataPoint.title: 'Project code'
        }
        @Consumption.valueHelp:'_project'
        @ObjectModel.foreignKey.association: '_project'
    key project_code as projectCode,
    
        @ObjectModel: { 
            mandatory: true,
            readOnly: true,
            text.element: ['description']
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
            selectionField.position: 20,
            dataPoint.title: 'Task code'
        }
    key code,
    
        @Search: {
            defaultSearchElement: true,
            ranking: #MEDIUM,
            fuzzinessThreshold: 0.8
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
            selectionField.position: 30,
            dataPoint.title: 'Description'
        }
        @ObjectModel.mandatory: true
        @Semantics.text: true
        description,
        
        @Search: {
            defaultSearchElement: true,
            ranking: #MEDIUM,
            fuzzinessThreshold: 1
        }
        @UI: {
            identification: {
                position: 35,
                importance: #HIGH
            },
            lineItem: {
                position: 35,
                importance: #HIGH
            },
            selectionField.position: 35
        }
        @ObjectModel.mandatory: true
        @Consumption.valueHelp:'_status'
        @Consumption.filter.defaultValue: ['OPEN']
        @ObjectModel.foreignKey.association: '_status'
        @UI.statusInfo: [ { position: 10 } ]
        status,
        
        @UI.identification: {position: 40, importance: #MEDIUM }
        @UI.lineItem: {position: 40, importance: #HIGH }
        estimation,
        
        @UI.identification: {position: 50, importance: #MEDIUM }
        @UI.lineItem: {position: 50, importance: #HIGH }
        @Consumption.valueHelp:'_timeUnit'
        @Consumption.defaultValue: 'HOUR'
        @ObjectModel.foreignKey.association: '_timeUnit'
        time_unit as timeUnit,
        
        @UI.identification: {position: 55, importance: #MEDIUM, label: 'Total Hours' }
        @UI.lineItem: {position: 55, importance: #LOW, label: 'Total Hours' }
        @ObjectModel.readOnly: true
        _totalHours.totalHours as totalHours,
        
        @Search.defaultSearchElement: true
        @UI.identification: {position: 60, importance: #MEDIUM }
        @UI.lineItem: {position: 60, importance: #MEDIUM }
        ended_on as endDate,
        
        @Search: {
            defaultSearchElement: true,
            ranking: #MEDIUM,
            fuzzinessThreshold: 1
        }
        @UI: {
            identification: {
                position: 70,
                importance: #HIGH
            },
            lineItem: {
                position: 70,
                importance: #HIGH
            },
            selectionField.position: 70
        }
        @Consumption.valueHelp:'_functionalUserInfo'
        @ObjectModel.foreignKey.association: '_functionalUserInfo'
        functional_responsible as functionalResponsible,
        
        @Search: {
            defaultSearchElement: true,
            ranking: #MEDIUM,
            fuzzinessThreshold: 1
        }
        @UI: {
            identification: {
                position: 80,
                importance: #MEDIUM
            },
            lineItem: {
                position: 80,
                importance: #MEDIUM
            },
            selectionField.position: 80
        }
        @Consumption.valueHelp:'_technicalUserInfo'
        @ObjectModel.foreignKey.association: '_technicalUserInfo'
        technical_responsible as technicalResponsible,
        
        /* Associations */
        _project,
        @ObjectModel.association.type: #TO_COMPOSITION_CHILD
        _comments,
        @ObjectModel.association.type: #TO_COMPOSITION_CHILD
        _transportRequests,
        @ObjectModel.association.type: #TO_COMPOSITION_CHILD
        _timeLog,
        _functionalUserInfo,
        _technicalUserInfo,
        _timeUnit,
        _status
}