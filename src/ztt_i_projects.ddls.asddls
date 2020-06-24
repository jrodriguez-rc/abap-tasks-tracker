@AbapCatalog.sqlViewName: 'ZTTI_PROJECTS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projects'

@Search.searchable: true

@ObjectModel: {
    modelCategory: #BUSINESS_OBJECT,
    compositionRoot: true,
    representativeKey: 'code',
    semanticKey: 'code',
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'ZTT_PROJECTS'
}

define view ZTT_I_PROJECTS
    as select from ztt_projects
    association [0..*] to ZTT_I_ISSUES as _issues
        on $projection.code = _issues.project_code
    association [0..1] to ZTT_VH_TIME_UNIT as _timeUnit
        on $projection.default_time_unit = _timeUnit.timeUnit
{
    //ZTT_PROJECTS
    @Search.defaultSearchElement: true
    @Search.ranking: #HIGH
    @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
    @ObjectModel.text.element: ['name']
    key code,
    @Search.defaultSearchElement: true
    name,
    @ObjectModel.foreignKey.association: '_timeUnit'
    default_time_unit,
    started_on,
    ended_on,
    crea_date_time,
    crea_uname,
    lchg_date_time,
    lchg_uname,
    
    /* Associations */
    @ObjectModel.association.type: #TO_COMPOSITION_CHILD
    _issues,
    _timeUnit
    
}
