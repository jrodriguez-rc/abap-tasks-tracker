@AbapCatalog.sqlViewName: 'ZTTC_TASK_COMM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption: Task comments'

@Search.searchable: true
@Metadata.allowExtensions

@ObjectModel: {
    representativeKey: 'code',
    semanticKey: [ 'projectCode', 'taskCode', 'code' ],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    transactionalProcessingDelegated: true
}

@UI.headerInfo:
{
    typeName: 'Comment',
    typeNamePlural: 'Comments',
    title.value: 'code',
    title.label: 'Comment'
}

//@UI.presentationVariant: [{sortOrder: [{by: 'projectCode', direction: #ASC},
//                                       {by: 'taskCode', direction: #DESC},
//                                       {by: 'createdOn', direction: #DESC}] }]

define view ZTT_C_TASK_COMMENTS
    as select from ZTT_I_TASK_COMMENTS
    association [1] to ZTT_C_PROJECTS as _project        on $projection.projectCode = _project.projectCode
    association [1] to ZTT_C_TASKS as _task              on $projection.projectCode = _task.projectCode
                                                          and $projection.taskCode = _task.code
    association [0..1] to ZTT_VH_USER as _createUserInfo on $projection.createdBy = _createUserInfo.userName
    association [0..1] to ZTT_VH_USER as _updateUserInfo on $projection.updatedBy = _updateUserInfo.userName
{
    
        @ObjectModel: { 
            readOnly: true
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #HIGH,
            fuzzinessThreshold: 1
        }
        @UI: {
            selectionField.position: 10,
            dataPoint.title: 'Project code'
        }
        @ObjectModel.foreignKey.association: '_project'
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
            selectionField.position: 20,
            dataPoint.title: 'Task code'
        }
        @ObjectModel.foreignKey.association: '_task'
    key task_code as taskCode,

        @Consumption.hidden: true
    key code,
    
        @ObjectModel: { 
            mandatory: true
        }
        @Search: {
            ranking: #HIGH,
            fuzzinessThreshold: 0.8
        }
        @UI: {
            identification: {
                position: 40,
                importance: #HIGH
            },
            lineItem: {
                position: 40,
                importance: #HIGH
            },
            multiLineText: true
        }
        @Semantics.text: true
        commentary as commentary,
        
        @UI: {
            identification: {
                position: 60,
                importance: #HIGH
            },
            dataPoint.responsibleName: 'createdBy'
        }
        crea_date_time as createdOn,
        
        @UI: {
            identification: {
                position: 50,
                importance: #HIGH
            }
        }
        @ObjectModel.foreignKey.association: '_createUserInfo'
        crea_uname as createdBy,
        
        lchg_date_time as updatedOn,
        
        @ObjectModel.foreignKey.association: '_updateUserInfo'
        lchg_uname as updatedBy,
        
        _project,
        @ObjectModel.association.type: [#TO_COMPOSITION_ROOT,#TO_COMPOSITION_PARENT]
        _task,
        _createUserInfo,
        _updateUserInfo
    
}