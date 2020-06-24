@AbapCatalog.sqlViewName: 'ZTTVH_USERS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help: User'

@Search.searchable: true

@ObjectModel: {
    representativeKey: 'userName'
}

define view ZTT_VH_USER
    as select from ZTT_I_USERS {

    @ObjectModel.text.element: ['name']
    key userName,
    
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    @Search.ranking: #HIGH
    _userInfo.name_text as name
    
} where userType = 'A' or userType = 'L'