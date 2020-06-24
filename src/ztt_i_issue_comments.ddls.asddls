@AbapCatalog.sqlViewName: 'ZTTI_ISSUE_COMM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Issue Comments'

@Search.searchable: true

@ObjectModel: {
    modelCategory: #BUSINESS_OBJECT,
    representativeKey: 'db_key',
    semanticKey: [ 'project_code', 'issue_code', 'db_key' ],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'ZTT_ISSUE_COMM'
}

define view ZTT_I_ISSUE_COMMENTS
    as select from ztt_issue_comm
    association [1] to ZTT_I_PROJECTS as _project        on $projection.project_code = _project.code
    association [1] to ZTT_I_ISSUES as _issue            on $projection.project_code = _issue.project_code
                                                          and $projection.issue_code = _issue.code
    association [0..1] to ZTT_VH_USER as _createUserInfo on $projection.crea_uname = _createUserInfo.userName
    association [0..1] to ZTT_VH_USER as _updateUserInfo on $projection.lchg_uname = _updateUserInfo.userName
{
    
    @Search.defaultSearchElement: true
    @ObjectModel.readOnly: true
    @ObjectModel.foreignKey.association: '_project'
    key project_code,
    
    @Search.defaultSearchElement: true
    @ObjectModel.readOnly: true
    @ObjectModel.foreignKey.association: '_issue'
    key issue_code,

    key db_key,
    
    @Search.ranking: #HIGH
    commentary,
    
    crea_date_time,
    
    @ObjectModel.foreignKey.association: '_createUserInfo'
    crea_uname,
    
    lchg_date_time,
    
    @ObjectModel.foreignKey.association: '_updateUserInfo'
    lchg_uname,
    
    @ObjectModel.association.type: #TO_COMPOSITION_ROOT
    _project,
    @ObjectModel.association.type: #TO_COMPOSITION_PARENT
    _issue,
    _createUserInfo,
    _updateUserInfo
    
}