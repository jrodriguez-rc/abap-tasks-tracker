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

@UI: {
    headerInfo: {
        typeName: 'Task',
        typeNamePlural: 'Tasks',
        title.label: 'Description',
        title.value: 'description',
        title.criticality: 'endCritically',
        description.label: 'Task code',
        description.value: 'code',
        description.criticality: 'endCritically'
    },
    lineItem:[{criticality:'endCritically'}]
}

define view ZTT_C_TASKS
    as select from ZTT_I_TASKS as task
    association [1] to ZTT_C_PROJECTS                  as _project            on $projection.projectCode = _project.projectCode
    association [0..1] to ZTT_VH_USER                  as _functionalUserInfo on $projection.functionalResponsible = _functionalUserInfo.userName
    association [0..1] to ZTT_VH_USER                  as _technicalUserInfo  on $projection.technicalResponsible = _technicalUserInfo.userName
    association [0..1] to ZTT_I_STATUS                 as _status             on $projection.status      = _status.status
    association [0..1] to ZTT_I_TASK_CRITICALITY       as _criticality        on $projection.endCritically = _criticality.criticality
    association [0..*] to ZTT_C_TASK_COMMENTS          as _comments           on $projection.code        = _comments.taskCode
                                                                             and $projection.projectCode = _comments.projectCode
    association [0..*] to ZTT_C_TASK_TRANSPORT_REQUEST as _transportRequests  on $projection.code        = _transportRequests.taskCode
                                                                             and $projection.projectCode = _transportRequests.projectCode
    association [0..*] to ZTT_C_TASK_TIME_LOG          as _timeLog            on $projection.code        = _timeLog.taskCode
                                                                             and $projection.projectCode = _timeLog.projectCode
{

        @Search: {
            defaultSearchElement: true,
            ranking: #HIGH,
            fuzzinessThreshold: 1
        }
        @UI: {
            identification: [
                {type: #FOR_ACTION, position: 1, dataAction: 'BOPF:CREATE_TR_WB', label: 'New Workbench TR'},
                {type: #FOR_ACTION, position: 2, dataAction: 'BOPF:CREATE_TR_CU', label: 'New Customizing TR'},
                {type: #FOR_ACTION, position: 9, dataAction: 'BOPF:END_TASK', label: 'End task'},
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
            dataPoint: {
                title: 'Task',
                criticality: 'endCritically'
            }
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
            selectionField.position: 30
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
        
        @UI.dataPoint: {
            title: 'Progress',
            description: 'Progress percentage',
            longDescription: 'Progress percentage',
            minimumValue: 0,
            maximumValue: 100,
            responsible: 'functional_responsible'
        }
        @UI.identification: {position: 38, importance: #MEDIUM }
        @UI.lineItem: {position: 38, importance: #HIGH }
        progress,
        
        @UI.identification: {position: 40, importance: #MEDIUM }
        @UI.lineItem: {position: 40, importance: #HIGH }
        estimation,
        
        @UI.identification: {position: 55, importance: #MEDIUM, label: 'Total Hours' }
        @UI.lineItem: {position: 55, importance: #LOW, label: 'Total Hours' }
        @ObjectModel.readOnly: true
//        @DefaultAggregation: #SUM
        _totalHours.totalHours as totalHours,

        @Search.defaultSearchElement: true
        @UI.identification: {position: 60, importance: #MEDIUM, criticality: 'endCritically' }
        @UI.lineItem: {position: 60, importance: #MEDIUM, criticality: 'endCritically' }
        plan_end_date as planEndDate,

        @Search.defaultSearchElement: true
        @UI.identification: {position: 63, importance: #MEDIUM }
        @UI.lineItem: {position: 63, importance: #MEDIUM }
        ended_on as endDate,
        
        @ObjectModel:{
            readOnly: true,
            foreignKey.association: '_criticality'
        }
        @UI:{
            identification: {position: 66, importance: #MEDIUM, criticality: 'endCritically' },
            lineItem: {position: 66, importance: #MEDIUM, criticality: 'endCritically' },
            textArrangement: #TEXT_ONLY
        }
        @Consumption.valueHelp:'_criticality'
        cast(substring(cast( case when plan_end_date <> '00000000'
                      then case when secondsToDeadline <= 0 then 1
                                when secondsToDeadline between 0 and 86400 then 2
                                else 3
                              end
                      else 0 end as abap.char(3) ),1,1) as ztt_task_criticality )
            as endCritically,
        
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
                importance: #HIGH,
                type: #AS_CONTACT,
                label: 'Functional Responsible',
                value: '_functionalUserInfo'
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
                importance: #MEDIUM,
                type: #AS_CONTACT,
                label: 'Technical Responsible',
                value: '_technicalUserInfo'
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
        _criticality,
        @UI: { fieldGroup: [{ qualifier: 'Responsible', importance: #HIGH, position: 20, label: 'Functional Responsible Contact Details', type: #AS_CONTACT, value: '_functionalUserInfo'}],
               identification: [{ importance: #HIGH, position: 71, label: 'Functional Responsible Contact Details', type: #AS_CONTACT, value: '_functionalUserInfo'}]}
        _functionalUserInfo,
        @UI: { fieldGroup: [{ qualifier: 'Responsible', importance: #MEDIUM, position: 21, label: 'Technical Responsible Contact Details', type: #AS_CONTACT, value: '_technicalUserInfo'}],
               identification: [{ importance: #MEDIUM, position: 81, label: 'Technical Responsible Contact Details', type: #AS_CONTACT, value: '_technicalUserInfo'}]}
        _technicalUserInfo,
        _status
}