@AbapCatalog.sqlViewName: 'ZTTI_TASKS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Tasks'

@Search.searchable: true

@ObjectModel: {
    modelCategory: #BUSINESS_OBJECT,
    compositionRoot: true,
    representativeKey: 'code',
    semanticKey: [ 'project_code', 'code' ],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'ZTT_TASKS'
}

define view ZTT_I_TASKS
    as select from ztt_tasks
    association [1]    to ZTT_I_PROJECTS               as _project            on $projection.project_code           = _project.code
    association [0..1] to ZTT_VH_USER                  as _functionalUserInfo on $projection.functional_responsible = _functionalUserInfo.userName
    association [0..1] to ZTT_VH_USER                  as _technicalUserInfo  on $projection.technical_responsible  = _technicalUserInfo.userName
    association [0..1] to ZTT_VH_TIME_UNIT             as _timeUnit           on $projection.time_unit              = _timeUnit.timeUnit
    association [0..1] to ZTT_I_STATUS                 as _status             on $projection.status                 = _status.status
    association [0..*] to ZTT_I_TASK_TRANSPORT_REQUEST as _transportRequests  on $projection.code                   = _transportRequests.task_code
                                                                             and $projection.project_code           = _transportRequests.project_code
    association [0..*] to ZTT_I_TASK_COMMENTS          as _comments           on $projection.code                   = _comments.task_code
                                                                             and $projection.project_code           = _comments.project_code
    association [0..*] to ZTT_I_TASK_TIME_LOG          as _timeLog            on $projection.code                   = _timeLog.task_code
                                                                             and $projection.project_code           = _timeLog.project_code
    association [0..1] to ZTT_I_TASK_TOTAL_HOURS       as _totalHours         on $projection.code                   = _totalHours.taskCode
                                                                             and $projection.project_code           = _totalHours.projectCode
{

        @Search.defaultSearchElement: true
        @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
        @Search.ranking: #HIGH
        @ObjectModel.foreignKey.association: '_project'
    key project_code,
    
        @Search.defaultSearchElement: true
        @ObjectModel.readOnly: true
        @ObjectModel.text.element: ['description']
        @Search.ranking: #HIGH
    key code,
    
        @Search.defaultSearchElement: true
        @Search.ranking: #MEDIUM
        description,
        
        @Search.defaultSearchElement: true
        @ObjectModel.foreignKey.association: '_status'
        status,
        
        estimation,
        
        @ObjectModel.foreignKey.association: '_timeUnit'
        time_unit,
        
        ended_on,
        
        @ObjectModel.foreignKey.association: '_functionalUserInfo'
        functional_responsible,
        
        @ObjectModel.foreignKey.association: '_technicalUserInfo'
        technical_responsible,
        
        crea_date_time,
        
        crea_uname,
        
        lchg_date_time,
        
        lchg_uname,
    
        /* Associations */
        _project,
        @ObjectModel.association.type: #TO_COMPOSITION_CHILD
        _comments,
        @ObjectModel.association.type: #TO_COMPOSITION_CHILD
        _transportRequests,
        @ObjectModel.association.type: #TO_COMPOSITION_CHILD
        _timeLog,
        _totalHours,
        _functionalUserInfo,
        _technicalUserInfo,
        _timeUnit,
        _status

}