@AbapCatalog.sqlViewName: 'ZTTI_TASK_COMM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Task comments'

@Search.searchable: true

@ObjectModel: {
    modelCategory: #BUSINESS_OBJECT,
    representativeKey: 'code',
    semanticKey: [ 'project_code', 'task_code', 'code' ],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'ZTT_COMMENTS'
}

define view ZTT_I_TASK_COMMENTS
    as select from ztt_comments
    association [1] to ZTT_I_PROJECTS as _project        on $projection.project_code = _project.code
    association [1] to ZTT_I_TASKS as _task              on $projection.project_code = _task.project_code
                                                          and $projection.task_code = _task.code
    association [0..1] to ZTT_VH_USER as _createUserInfo on $projection.crea_uname = _createUserInfo.userName
    association [0..1] to ZTT_VH_USER as _updateUserInfo on $projection.lchg_uname = _updateUserInfo.userName
{
    
        @Search.defaultSearchElement: true
        @ObjectModel.readOnly: true
        @ObjectModel.foreignKey.association: '_project'
    key project_code,
    
        @Search.defaultSearchElement: true
        @ObjectModel.readOnly: true
        @ObjectModel.foreignKey.association: '_task'
    key task_code,

    key code,
    
        @Search.ranking: #HIGH
        commentary,
        
        @ObjectModel.readOnly: true
        crea_date_time,
        
        @ObjectModel.readOnly: true
        @ObjectModel.foreignKey.association: '_createUserInfo'
        crea_uname,
        
        @ObjectModel.readOnly: true
        lchg_date_time,
    
        @ObjectModel.readOnly: true
        @ObjectModel.foreignKey.association: '_updateUserInfo'
        lchg_uname,
        
        _project,
        @ObjectModel.association.type: [#TO_COMPOSITION_ROOT,#TO_COMPOSITION_PARENT]
        _task,
        _createUserInfo,
        _updateUserInfo
    
}