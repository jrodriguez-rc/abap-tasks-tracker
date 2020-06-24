@AbapCatalog.sqlViewName: 'ZTTC_ISSUES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Issues'

@Search.searchable: true
@Metadata.allowExtensions

@ObjectModel: {
    representativeKey: 'code',
    semanticKey: [ 'projectCode', 'code' ],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    transactionalProcessingDelegated: true
}

@UI.headerInfo:
{
    typeName: 'Issue',
    typeNamePlural: 'Issues',
    title.value: 'description',
    title.label: 'Issue'
}

//@UI.presentationVariant: [{sortOrder: [{by: 'projectCode', direction: #ASC},
//                                       {by: 'code', direction: #DESC}] }]

define view ZTT_C_ISSUES
    as select from ZTT_I_ISSUES
    association [1] to ZTT_C_PROJECTS          as _project            on $projection.projectCode = _project.code
    association [0..1] to ZTT_VH_USER          as _functionalUserInfo on $projection.functionalResponsible = _functionalUserInfo.userName
    association [0..1] to ZTT_VH_USER          as _technicalUserInfo  on $projection.technicalResponsible = _technicalUserInfo.userName
    association [0..1] to ZTT_VH_TIME_UNIT     as _timeUnit           on $projection.timeUnit = _timeUnit.timeUnit
    association [0..1] to ZTT_I_STATUS         as _status             on $projection.status = _status.status
    association [0..*] to ZTT_C_ISSUE_COMMENTS as _comment            on $projection.code        = _comment.issueCode
                                                                       and $projection.projectCode = _comment.projectCode
    association [0..*] to ZTT_C_ISSUE_TRANSPORT_REQUESTS as _transportRequests on $projection.code        = _transportRequests.issueCode
                                                                                and $projection.projectCode = _transportRequests.projectCode
{
    @ObjectModel: { 
        mandatory: true,
        readOnly: true,
        text.element: ['name']
    }
    @Search: {
        defaultSearchElement: true,
        ranking: #HIGH,
        fuzzinessThreshold: 1
    }
    @UI: {
        identification: {
            position: 10,
            importance: #HIGH
        },
        lineItem: {
            position: 10,
            importance: #HIGH
        },
        selectionField.position: 10,
        dataPoint.title: 'Project code'
    }
    @Consumption.valueHelp:'_project'
    @ObjectModel.foreignKey.association: '_project'
    key project_code as projectCode,
    
    @ObjectModel: { 
        mandatory: true,
        readOnly: true,
        text.element: ['description']
    }
    @Search: {
        defaultSearchElement: true,
        ranking: #HIGH,
        fuzzinessThreshold: 1
    }
    @UI: {
        identification: {
            position: 20,
            importance: #HIGH
        },
        lineItem: {
            position: 20,
            importance: #HIGH
        },
        selectionField.position: 20,
        dataPoint.title: 'Issue code'
    }
    key code,
    
    @Search: {
        defaultSearchElement: true,
        ranking: #MEDIUM,
        fuzzinessThreshold: 0.8
    }
    @UI: {
        identification: {
            position: 30,
            importance: #HIGH
        },
        lineItem: {
            position: 30,
            importance: #HIGH
        },
        selectionField.position: 30,
        dataPoint.title: 'Description'
    }
    @ObjectModel.mandatory: true
    @Semantics.text: true
    description,
    
    @Search: {
        defaultSearchElement: true,
        ranking: #MEDIUM,
        fuzzinessThreshold: 1
    }
    @UI: {
        identification: {
            position: 35,
            importance: #HIGH
        },
        lineItem: {
            position: 35,
            importance: #HIGH
        },
        selectionField.position: 35
    }
    @ObjectModel.mandatory: true
    @Consumption.valueHelp:'_status'
    @Consumption.filter.defaultValue: ['OPEN']
    @ObjectModel.foreignKey.association: '_status'
    status,
    
    @UI.identification: {position: 40, importance: #MEDIUM }
    @UI.lineItem: {position: 40, importance: #HIGH }
    estimation,
    
    @UI.identification: {position: 50, importance: #MEDIUM }
    @UI.lineItem: {position: 50, importance: #HIGH }
    @Consumption.valueHelp:'_timeUnit'
    @ObjectModel.foreignKey.association: '_timeUnit'
    time_unit as timeUnit,
    
    @Search.defaultSearchElement: true
    @UI.identification: {position: 60, importance: #MEDIUM }
    @UI.lineItem: {position: 60, importance: #MEDIUM }
    ended_on as endDate,
    
    @Search: {
        defaultSearchElement: true,
        ranking: #MEDIUM,
        fuzzinessThreshold: 1
    }
    @UI: {
        identification: {
            position: 70,
            importance: #HIGH
        },
        lineItem: {
            position: 70,
            importance: #HIGH
        },
        selectionField.position: 70
    }
    @Consumption.valueHelp:'_functionalUserInfo'
    @ObjectModel.foreignKey.association: '_functionalUserInfo'
    functional_responsible as functionalResponsible,
    
    @Search: {
        defaultSearchElement: true,
        ranking: #MEDIUM,
        fuzzinessThreshold: 1
    }
    @UI: {
        identification: {
            position: 80,
            importance: #MEDIUM
        },
        lineItem: {
            position: 80,
            importance: #MEDIUM
        },
        selectionField.position: 80
    }
    @Consumption.valueHelp:'_technicalUserInfo'
    @ObjectModel.foreignKey.association: '_technicalUserInfo'
    technical_responsible as technicalResponsible,
    
//    @ObjectModel.readOnly: true
//    @UI.identification: {position: 90, importance: #LOW }
//    @UI.lineItem: {position: 90, importance: #LOW }
//    @Consumption.hidden: true
//    crea_date_time as createdOn,
//    
//    @ObjectModel.readOnly: true
//    @UI.identification: {position: 91, importance: #LOW }
//    @UI.lineItem: {position: 91, importance: #LOW }
//    @Consumption.hidden: true
//    crea_uname as createdBy,
//    
//    @ObjectModel.readOnly: true
//    @UI.identification: {position: 92, importance: #LOW }
//    @UI.lineItem: {position: 92, importance: #LOW }
//    @Consumption.hidden: true
//    lchg_date_time as updatedOn,
//    
//    @ObjectModel.readOnly: true
//    @UI.identification: {position: 93, importance: #LOW }
//    @UI.lineItem: {position: 93, importance: #LOW }
//    @Consumption.hidden: true
//    lchg_uname as updatedBy,
    
    /* Associations */
    // ZTT_I_ISSUES
    @ObjectModel.association.type: [#TO_COMPOSITION_PARENT,#TO_COMPOSITION_ROOT]
    _project,
    @ObjectModel.association.type: #TO_COMPOSITION_CHILD
    _comment,
    @ObjectModel.association.type: #TO_COMPOSITION_CHILD
    _transportRequests,
    _functionalUserInfo,
    _technicalUserInfo,
    _timeUnit,
    _status
}
