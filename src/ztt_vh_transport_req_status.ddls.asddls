@AbapCatalog.sqlViewName: 'ZTTVHTRSTATUS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Value Help: Transport Request Status'
define view ZTT_VH_TRANSPORT_REQ_STATUS
    as select from ZTT_I_DOMAIN {
    
    key domainName,
    
    key value,
    
    valpos,

    //ZTT_I_DOMAIN
    _text
    
} where domainName = ''
