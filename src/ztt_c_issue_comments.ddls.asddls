@AbapCatalog.sqlViewName: 'ZTTC_ISSUE_COMM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Issue Comments'

@Search.searchable: true
@Metadata.allowExtensions

@ObjectModel: {
    representativeKey: 'code',
    semanticKey: [ 'projectCode', 'issueCode', 'code' ],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    transactionalProcessingDelegated: true
}

@UI.headerInfo:
{
    typeName: 'Comment',
    typeNamePlural: 'Comments',
    title.value: 'code',
    title.label: 'Comment'
}

//@UI.presentationVariant: [{sortOrder: [{by: 'projectCode', direction: #ASC},
//                                       {by: 'issueCode', direction: #DESC},
//                                       {by: 'createdOn', direction: #DESC}] }]

define view ZTT_C_ISSUE_COMMENTS
    as select from ZTT_I_ISSUE_COMMENTS
    association [1] to ZTT_C_PROJECTS as _project        on $projection.projectCode = _project.code
    association [1] to ZTT_C_ISSUES as _issue            on $projection.projectCode = _issue.projectCode
                                                        and $projection.issueCode = _issue.code
    association [0..1] to ZTT_VH_USER as _createUserInfo on $projection.createdBy = _createUserInfo.userName
    association [0..1] to ZTT_VH_USER as _updateUserInfo on $projection.updatedBy = _updateUserInfo.userName
{
    
    @ObjectModel: { 
        readOnly: true
    }
    @Search: {
        defaultSearchElement: true,
        ranking: #HIGH,
        fuzzinessThreshold: 1
    }
    @UI: {
//        identification: {
//            position: 10,
//            importance: #HIGH
//        },
//        lineItem: {
//            position: 10,
//            importance: #HIGH
//        },
        selectionField.position: 10,
        dataPoint.title: 'Project code'
    }
    @ObjectModel.foreignKey.association: '_project'
    key project_code as projectCode,
    
    @ObjectModel: { 
        mandatory: true,
        readOnly: true
    }
    @Search: {
        defaultSearchElement: true,
        ranking: #HIGH,
        fuzzinessThreshold: 1
    }
    @UI: {
//        identification: {
//            position: 20,
//            importance: #HIGH
//        },
//        lineItem: {
//            position: 20,
//            importance: #HIGH
//        },
        selectionField.position: 20,
        dataPoint.title: 'Issue code'
    }
    @ObjectModel.foreignKey.association: '_issue'
    key issue_code as issueCode,

//    @ObjectModel: { 
//        mandatory: true,
//        readOnly: true
//    }
//    @Search: {
//        ranking: #HIGH,
//        fuzzinessThreshold: 1
//    }
//    @UI: {
//        identification: {
//            position: 30,
//            importance: #HIGH
//        },
//        lineItem: {
//            position: 30,
//            importance: #HIGH
//        },
//        selectionField.position: 30,
//        dataPoint.title: 'Comment code'
//    }
    @Consumption.hidden: true
    key code,
    
    @ObjectModel: { 
        mandatory: true
    }
    @Search: {
        ranking: #HIGH,
        fuzzinessThreshold: 0.8
    }
    @UI: {
        identification: {
            position: 40,
            importance: #HIGH
        },
        lineItem: {
            position: 40,
            importance: #HIGH
        },
        multiLineText: true
    }
    @Semantics.text: true
    commentary as commentary,
    
    @UI: {
        identification: {
            position: 60,
            importance: #HIGH
        },
        dataPoint.responsibleName: 'createdBy'
    }
    crea_date_time as createdOn,
    
    @UI: {
        identification: {
            position: 50,
            importance: #HIGH
        }
    }
    @ObjectModel.foreignKey.association: '_createUserInfo'
    crea_uname as createdBy,
    
    lchg_date_time as updatedOn,
    
    @ObjectModel.foreignKey.association: '_updateUserInfo'
    lchg_uname as updatedBy,
    
    _project,
    _issue,
    _createUserInfo,
    _updateUserInfo
    
}