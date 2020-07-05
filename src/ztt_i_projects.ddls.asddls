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
    association [0..*] to ZTT_I_TASKS as _tasks     on $projection.code = _tasks.project_code
    association [0..1] to ZTT_VH_USER as _createdBy on $projection.crea_uname = _createdBy.userName
    association [0..1] to ZTT_VH_USER as _updatedBy on $projection.lchg_uname = _updatedBy.userName
{

        @Search.defaultSearchElement: true
        @Search.ranking: #HIGH
        @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
        @ObjectModel.text.element: ['name']
        @ObjectModel.mandatory: true
    key code,
    
        @Search.defaultSearchElement: true
        @ObjectModel.mandatory: true
        @Search.ranking: #MEDIUM
        name,
        
        started_on,
        
        ended_on,
        
        tr_target,
    
        cts_project,
        
        @ObjectModel.readOnly: true
        crea_date_time,
        
        @ObjectModel.readOnly: true
        @ObjectModel.foreignKey.association: '_createdBy'
        crea_uname,
        
        @ObjectModel.readOnly: true
        lchg_date_time,
        
        @ObjectModel.readOnly: true
        @ObjectModel.foreignKey.association: '_updatedBy'
        lchg_uname,
        
        /* Associations */
//        @ObjectModel.association.type: #TO_COMPOSITION_CHILD
        _tasks,
        _createdBy,
        _updatedBy
    
}
