@AbapCatalog.sqlViewName: 'ZTTI_TR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Transport Requests'

@Search.searchable: true

@ObjectModel: {
    representativeKey: 'request'
}

define view ZTT_I_TRANSPORT_REQUESTS
    as select from e070
    association [0..*] to ZTT_I_TRANSPORT_REQUESTS_TEXT as _text
        on $projection.request = _text.request
    association [0..1] to ZTT_VH_USER as _owner
        on $projection.owner = _owner.userName
{
    @ObjectModel.text.association: '_text'
    @Search.defaultSearchElement: true
    @Search.ranking: #HIGH
    key trkorr as request,
    
    trfunction as function,
    
    trstatus as status,
    
    tarsystem as targetSystem,
    
    korrdev as category,
    
    @ObjectModel.foreignKey.association: '_owner'
    as4user as owner,
    
    as4date as lastChangedOn,
    
    as4time as lastChangedat,
    
    _owner,
    _text
    
} where strkorr = ''
