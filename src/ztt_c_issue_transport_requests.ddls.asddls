@AbapCatalog.sqlViewName: 'ZTTC_ISSUETR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption: Issue Transport Requests'

@Search.searchable: true
@Metadata.allowExtensions

@ObjectModel: {
    representativeKey: 'request',
    semanticKey: [ 'projectCode', 'issueCode', 'request' ],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    transactionalProcessingDelegated: true
}

@UI.headerInfo:
{
    typeName: 'Transport Request',
    typeNamePlural: 'Transport Requests',
    title.value: 'request',
    title.label: 'Transport Request'
}

define view ZTT_C_ISSUE_TRANSPORT_REQUESTS
    as select from ZTT_I_ISSUE_TRANSPORT_REQUESTS
    association [1] to ZTT_C_PROJECTS as _project on $projection.projectCode = _project.code
    association [1] to ZTT_C_ISSUES   as _issue   on $projection.projectCode = _issue.projectCode
                                                   and $projection.issueCode   = _issue.code
{

        @UI: {
            identification: [{ position: 10, importance: #HIGH }],
            lineItem:[{position: 10, importance: #HIGH}],
            selectionField:[{position: 10}],
            dataPoint.title: 'Project'
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #HIGH,
            fuzzinessThreshold: 1
        }
        @Consumption.valueHelp:'_project'
    key project_code as projectCode,
    
        @UI: {
            identification: [{ position: 20, importance: #HIGH }],
            lineItem:[{position: 20, importance: #HIGH}],
            selectionField:[{position: 20}],
            dataPoint.title: 'Issue'
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #HIGH,
            fuzzinessThreshold: 1
        }
        @Consumption.valueHelp:'_issue'
    key issue_code as issueCode,
    
        @UI: {
            identification: [{ position: 30, importance: #HIGH }],
            lineItem:[{position: 30, importance: #HIGH}],
            selectionField:[{position: 30}],
            dataPoint.title: 'Trans.Request'
        }
        @Search: {
            defaultSearchElement: true,
            ranking: #HIGH,
            fuzzinessThreshold: 1
        }
        @Consumption.valueHelp:'_request'
    key transport_request as request,
    
        @UI: {
            identification: [{ position: 50, importance: #LOW }],
            lineItem:[{position: 50, importance: #LOW}]
        }
        commentary,
        
        /* Associations */
        @ObjectModel.association.type: #TO_COMPOSITION_ROOT
        _project,
        @ObjectModel.association.type: #TO_COMPOSITION_PARENT
        _issue,
        _request
    
}
