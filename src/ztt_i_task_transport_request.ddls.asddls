@AbapCatalog.sqlViewName: 'ZTTI_TASKTR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Task Transport Requests'

@Search.searchable: true

@ObjectModel: {
    modelCategory: #BUSINESS_OBJECT,
    representativeKey: 'transport_request',
    semanticKey: [ 'project_code', 'task_code', 'transport_request' ],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'ZTT_TRAN_REQ'
}

define view ZTT_I_TASK_TRANSPORT_REQUEST
    as select from ztt_tran_req
    association [1]    to ZTT_I_PROJECTS           as _project        on $projection.project_code = _project.code
    association [1]    to ZTT_I_TASKS              as _task           on $projection.project_code = _task.project_code
                                                                       and $projection.task_code   = _task.code
    association [1]    to ZTT_I_TRANSPORT_REQUESTS as _request        on $projection.transport_request = _request.request
    association [0..1] to ZTT_VH_USER              as _createUserInfo on $projection.crea_uname = _createUserInfo.userName
    association [0..1] to ZTT_VH_USER              as _updateUserInfo on $projection.lchg_uname  = _updateUserInfo.userName
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
    key task_code,
    
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
        @ObjectModel.foreignKey.association: '_createUserInfo'
        @ObjectModel.text.association: '_createUserInfo'
        crea_uname,
        
        @ObjectModel.readOnly: true
        lchg_date_time,
        
        @ObjectModel.readOnly: true
        @ObjectModel.foreignKey.association: '_updateUserInfo'
        @ObjectModel.text.association: '_updateUserInfo'
        lchg_uname,
    
        _project,
        @ObjectModel.association.type: [#TO_COMPOSITION_ROOT,#TO_COMPOSITION_PARENT]
        _task,
        _request,
        _createUserInfo,
        _updateUserInfo

} where _request.request <> ''