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
        @Semantics.contact.type: #PERSON
    key userName,
    
        @Search.defaultSearchElement: true
        @Search.fuzzinessThreshold: 0.8
        @Search.ranking: #HIGH
        @Semantics.name.fullName: true
        @Semantics.text: true
        _userInfo.name_text as name,
        
        @Semantics.name.givenName: true
        _userInfo.name_first as firstName,
        
        @Semantics.name.familyName: true
        _userInfo.name_last as lastName,
        
        @Semantics.name.additionalName: true
        _userInfo.namemiddle as middleName,
        
        @Semantics.eMail.type: [#PREF,#WORK]
        _emailAddress.smtp_addr as email,

        @Semantics.telephone.type: [#PREF,#WORK]
        _businessAddress.tel_number as telephone
    
} where userType = 'A' or userType = 'L' or userType = 'C'
