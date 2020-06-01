@AbapCatalog.sqlViewName: 'ZTTI_STATUS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Status'
define view ZTT_I_STATUS
    as select from dd07l as status
    association [0..*] to /RSLT/BS_I_DOMAIN_TEXT as _text
        on _text.DomainName = 'ZTT_STATUS'
       and status.valpos = _text.ValuePosition
{
   @ObjectModel.text.association: '_text'
   
    key cast( domvalue_l as ZTT_STATUS ) as status,
    key valpos as ValuePosition,
    _text
    
} where status.domname = 'ZTT_STATUS' and status.as4local = 'A';