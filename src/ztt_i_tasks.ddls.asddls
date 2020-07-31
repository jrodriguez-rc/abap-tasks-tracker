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
    deleteEnabled: false,
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
      @ObjectModel.mandatory: true
      @ObjectModel.text.association: '_project'
      @Search.ranking: #HIGH
      @ObjectModel.foreignKey.association: '_project'
  key project_code,

      @ObjectModel: { 
          mandatory: true,
          readOnly: 'EXTERNAL_CALCULATION',
          text.element: ['description']
      }
      @Search.defaultSearchElement: true
      @Search.ranking: #HIGH
  key code,

      @Search.defaultSearchElement: true
      @Search.ranking: #MEDIUM
      description,

      @Search.defaultSearchElement: true
      @ObjectModel.foreignKey.association: '_status'
      status,

      status_previous,

      progress,

      estimation,

      @ObjectModel.foreignKey.association: '_timeUnit'
      time_unit,

      plan_end_date,

      plan_end_ts_utc,

      ended_on,

      @ObjectModel.readOnly: true
      case when plan_end_ts_utc > 0
              then 
                  case when ended_on > 0
                          then TSTMP_SECONDS_BETWEEN(ended_on,plan_end_ts_utc,'INITIAL')
                          else TSTMP_SECONDS_BETWEEN(tstmp_current_utctimestamp(),plan_end_ts_utc,'INITIAL') end
              else 0 end as secondsToDeadline,

      @ObjectModel.foreignKey.association: '_functionalUserInfo'
      @Semantics.user.responsible: true
      functional_responsible,

      @ObjectModel.foreignKey.association: '_technicalUserInfo'
      @Semantics.user.responsible: true
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