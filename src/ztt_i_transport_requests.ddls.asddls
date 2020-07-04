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
    inner join e07t on e070.trkorr = e07t.trkorr
  association [0..1] to ZTT_I_TR_STATUS   as _status   on $projection.status = _status.status
  association [0..1] to ZTT_I_TR_FUNCTION as _function on $projection.function = _function.function
  association [0..1] to ZTT_VH_USER       as _owner    on $projection.owner = _owner.userName
{
      @Search.defaultSearchElement: true
      @Search.ranking: #HIGH
      @ObjectModel.text.element: ['description']
  key e070.trkorr as request,

      as4text     as description,
        
      @ObjectModel.foreignKey.association: '_function'
      trfunction as function,
        
      @ObjectModel.foreignKey.association: '_status'
      trstatus as status,
        
      tarsystem as targetSystem,
        
      korrdev as category,
        
      @ObjectModel.foreignKey.association: '_owner'
      as4user as owner,
        
      as4date as lastChangedOn,
        
      as4time as lastChangedat,
      
      _status,
      _function,
      _owner
    
} where strkorr = ''
