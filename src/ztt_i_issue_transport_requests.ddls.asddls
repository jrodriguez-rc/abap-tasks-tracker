@AbapCatalog.sqlViewName: 'ZTTI_ISSUETR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Issue Transport Requests'

@Search.searchable: true

@ObjectModel: {
    modelCategory: #BUSINESS_OBJECT,
    representativeKey: 'transport_request',
    semanticKey: [ 'project_code', 'issue_code', 'transport_request' ],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'ZTT_ISSUE_TR'
}

define view ZTT_I_ISSUE_TRANSPORT_REQUESTS
    as select from ztt_issue_tr
    association [1] to ZTT_I_PROJECTS as _project on $projection.project_code = _project.code
    association [1] to ZTT_I_ISSUES as _issue     on $projection.project_code = _issue.project_code
                                                   and $projection.issue_code   = _issue.code
    association [1] to ZTT_I_TRANSPORT_REQUESTS as _request on $projection.transport_request = _request.request
{

        @Search.defaultSearchElement: true
        @ObjectModel: {
            mandatory: true,
            readOnly: 'true',
            text.association: '_project',
            foreignKey.association: '_project'
        }
    key project_code,
    
        @Search.defaultSearchElement: true
        @ObjectModel: {
            mandatory: true,
            readOnly: 'true',
            text.association: '_issue',
            foreignKey.association: '_issue'
        }
    key issue_code,
    
        @Search.ranking: #HIGH
        @ObjectModel: {
            mandatory: true,
            readOnly: 'true',
            text.association: '_request',
            foreignKey.association: '_request'
        }
    key transport_request,
    
        @Semantics.text
        commentary,
        
        @ObjectModel.readOnly: true
        crea_date_time,
        
        @ObjectModel.readOnly: true
        crea_uname,
        
        @ObjectModel.readOnly: true
        lchg_date_time,
        
        @ObjectModel.readOnly: true
        lchg_uname,
    
        @ObjectModel.association.type: #TO_COMPOSITION_ROOT
        _project,
        @ObjectModel.association.type: #TO_COMPOSITION_PARENT
        _issue,
        _request

}
