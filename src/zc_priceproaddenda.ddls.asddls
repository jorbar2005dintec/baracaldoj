@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZPRICEPROADDENDA'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_PRICEPROADDENDA
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_PRICEPROADDENDA
  association [1..1] to ZR_PRICEPROADDENDA as _BaseEntity on $projection.CUSTOMERID = _BaseEntity.CUSTOMERID and $projection.MATTYPE = _BaseEntity.MATTYPE and $projection.CONDTYPE = _BaseEntity.CONDTYPE
{
  key Customerid,
  key Mattype,
  key Condtype,
  Condtypetax,
  @Semantics: {
    User.Createdby: true
  }
  Createdby,
  Createdat,
  @Semantics: {
    User.Lastchangedby: true
  }
  Changedby,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  Lastchangedat,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  Locallastchanged,
  _BaseEntity
}
