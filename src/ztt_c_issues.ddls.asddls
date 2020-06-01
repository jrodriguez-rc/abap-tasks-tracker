@AbapCatalog.sqlViewName: 'ZTTC_ISSUES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Issues'

@Search.searchable: true

@UI.headerInfo.typeName: 'Issues'
@UI.headerInfo.title.value: 'code'

@ObjectModel: {
    transactionalProcessingDelegated: true,
    representativeKey: 'code',
    semanticKey: ['projectCode,code'],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}


define view ZTT_C_ISSUES
    as select from ZTT_I_ISSUES
{
    @Search.defaultSearchElement: true
    @ObjectModel.readOnly: true
    @UI.identification: {position: 10, importance: #HIGH }
    @UI.lineItem: {position: 10, importance: #HIGH }
    key project_code as projectCode,
    
    @Search.defaultSearchElement: true
    @ObjectModel.readOnly: true
    @UI.identification: {position: 20, importance: #HIGH }
    @UI.lineItem: {position: 20, importance: #HIGH }
    key code,
    
    @Search.defaultSearchElement: true
    @UI.identification: {position: 30, importance: #HIGH }
    @UI.lineItem: {position: 30, importance: #HIGH }
    description,
    
    @Search.defaultSearchElement: true
    @UI.identification: {position: 35, importance: #HIGH }
    @UI.lineItem: {position: 35, importance: #HIGH }
    status,
    
    @UI.identification: {position: 40, importance: #MEDIUM }
    @UI.lineItem: {position: 40, importance: #HIGH }
    estimation,
    
    @UI.identification: {position: 50, importance: #MEDIUM }
    @UI.lineItem: {position: 50, importance: #HIGH }
    time_unit as timeUnit,
    
    @Search.defaultSearchElement: true
    @UI.identification: {position: 60, importance: #MEDIUM }
    @UI.lineItem: {position: 60, importance: #MEDIUM }
    ended_on as endDate,
    
    @UI.identification: {position: 70, importance: #HIGH }
    @UI.lineItem: {position: 70, importance: #HIGH }
    functional_responsible as functionalResponsible,
    
    @UI.identification: {position: 80, importance: #MEDIUM }
    @UI.lineItem: {position: 80, importance: #MEDIUM }
    technical_responsible as technicalResponsible,
    
    @ObjectModel.readOnly: true
    @UI.identification: {position: 90, importance: #LOW }
    @UI.lineItem: {position: 90, importance: #LOW }
    crea_date_time as createdOn,
    
    @ObjectModel.readOnly: true
    @UI.identification: {position: 91, importance: #LOW }
    @UI.lineItem: {position: 90, importance: #LOW }
    crea_uname as createdBy,
    
    @ObjectModel.readOnly: true
    @UI.identification: {position: 92, importance: #LOW }
    @UI.lineItem: {position: 90, importance: #LOW }
    lchg_date_time as updatedOn,
    
    @ObjectModel.readOnly: true
    @UI.identification: {position: 93, importance: #LOW }
    @UI.lineItem: {position: 90, importance: #LOW }
    lchg_uname as updatedBy,
    
    /* Associations */
    // ZTT_I_ISSUES
    @ObjectModel.association.type: [#TO_COMPOSITION_PARENT,#TO_COMPOSITION_ROOT]
    _project,
    _functionalUserInfo,
    _technicalUserInfo
}