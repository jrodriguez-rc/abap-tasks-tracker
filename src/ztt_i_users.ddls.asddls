@AbapCatalog.sqlViewName: 'ZTTIUSERS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Users'
define view ZTT_I_USERS
  as select from usr02
    inner join   usr21 on usr02.bname = usr21.bname
  association [0..1] to adrp      as _adrp      on  _adrp.persnumber      = usr21.persnumber
                                                and _adrp.nation          = ''
                                                and _adrp.date_from       = '00010101'
  association [0..1] to adcp      as _adcp      on  _adcp.persnumber      = usr21.persnumber
                                                and _adcp.addrnumber      = usr21.addrnumber
                                                and _adcp.nation          = ''
                                                and _adcp.date_from       = '00010101'
  association [0..1] to uscompany as _uscompany on  _uscompany.addrnumber = usr21.addrnumber
                                                or  _uscompany.addrnumber = usr21.template_orgaddr // Use company or template_company
  association [0..1] to adrc      as _adrc      on  _adrc.addrnumber      = usr21.addrnumber
                                                and _adrc.nation          = ''
                                                and _adrc.date_from       = '00010101'
  association [0..1] to adr6      as _adr6      on  _adr6.persnumber      = usr21.persnumber
                                                and _adr6.addrnumber      = usr21.addrnumber
                                                and _adr6.date_from       = '00010101'
                                                and _adr6.flgdefault      = 'X'
  association [0..1] to but000    as _but000    on  _but000.persnumber    = usr21.persnumber
                                                and _but000.partner_guid  = usr21.bpperson
{
  key usr21.mandt as client,
  key usr21.bname as userName,
      usr21.kostl as costCenter,
      usr21.idadtype as addressType,
      usr21.persnumber as personNumber,
      usr21.addrnumber as addressNumber,
      usr21.bpperson as BPGUID,
      usr21.template_orgaddr as templateOrgAddressNumber,
      usr21.techdesc as technicalUserDescription,
      _adrp,
      _adcp,
      _uscompany,
      _adrc,
      _adr6,
      _but000
}
