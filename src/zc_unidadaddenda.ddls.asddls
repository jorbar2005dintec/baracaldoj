@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZUNIDADADDENDA'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_UNIDADADDENDA
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_UNIDADADDENDA
  association [1..1] to ZR_UNIDADADDENDA as _BaseEntity on $projection.CUSTOMERID = _BaseEntity.CUSTOMERID and $projection.UNITOFMEASURE = _BaseEntity.UNITOFMEASURE
{
  key Customerid,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  key Unitofmeasure,
  Claveunidadaddenda,
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
