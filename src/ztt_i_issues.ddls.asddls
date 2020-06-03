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
    transactionalProcessingDelegated: true,
    writeActivePersistence: 'ZTT_ISSUES'
}

define view ZTT_I_ISSUES
    as select from ztt_issues
    association [1] to ZTT_I_PROJECTS as _project
        on $projection.project_code = _project.code
    association [0..1] to ZTT_I_USERS as _functionalUserInfo
        on $projection.functional_responsible = _functionalUserInfo.userName
    association [0..1] to ZTT_I_USERS as _technicalUserInfo
        on $projection.technical_responsible = _technicalUserInfo.userName
{
    //ZTT_ISSUES
    @Search.defaultSearchElement: true
    @ObjectModel.readOnly: true
    key project_code,
    @Search.defaultSearchElement: true
    @ObjectModel.readOnly: true
    key code,
    @Search.defaultSearchElement: true
    description,
    @Search.defaultSearchElement: true
    status,
    estimation,
    time_unit,
    ended_on,
    functional_responsible,
    technical_responsible,
    crea_date_time,
    crea_uname,
    lchg_date_time,
    lchg_uname,

    /* Associations */
    @ObjectModel.association.type: [#TO_COMPOSITION_PARENT,#TO_COMPOSITION_ROOT]
    _project,
    _functionalUserInfo,
    _technicalUserInfo

}
