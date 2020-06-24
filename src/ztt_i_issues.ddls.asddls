@AbapCatalog.sqlViewName: 'ZTTI_ISSUES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Issues'

@Search.searchable: true

@ObjectModel: {
    modelCategory: #BUSINESS_OBJECT,
    representativeKey: 'code',
    semanticKey: [ 'project_code', 'code' ],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'ZTT_ISSUES'
}

define view ZTT_I_ISSUES
    as select from ztt_issues
    association [1] to ZTT_I_PROJECTS as _project
        on $projection.project_code = _project.code
    association [0..1] to ZTT_VH_USER as _functionalUserInfo
        on $projection.functional_responsible = _functionalUserInfo.userName
    association [0..1] to ZTT_VH_USER as _technicalUserInfo
        on $projection.technical_responsible = _technicalUserInfo.userName
    association [0..1] to ZTT_VH_TIME_UNIT as _timeUnit
        on $projection.time_unit = _timeUnit.timeUnit
    association [0..1] to ZTT_I_STATUS as _status
        on $projection.status = _status.status
    association [0..*] to ZTT_I_ISSUE_TRANSPORT_REQUESTS as _transportRequest
        on $projection.code         = _transportRequest.issue_code
       and $projection.project_code = _transportRequest.project_code
    association [0..*] to ZTT_I_ISSUE_COMMENTS as _comment
        on $projection.code         = _comment.issue_code
       and $projection.project_code = _comment.project_code
{
    //ZTT_ISSUES
    @Search.defaultSearchElement: true
    @ObjectModel.readOnly: true
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
    @ObjectModel.association.type: [#TO_COMPOSITION_PARENT,#TO_COMPOSITION_ROOT]
    _project,
    @ObjectModel.association.type: #TO_COMPOSITION_CHILD
    _comment,
    @ObjectModel.association.type: #TO_COMPOSITION_CHILD
    _transportRequest,
    _functionalUserInfo,
    _technicalUserInfo,
    _timeUnit,
    _status

}
