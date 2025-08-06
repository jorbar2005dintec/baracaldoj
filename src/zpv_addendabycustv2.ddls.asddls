@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}


@ObjectModel: {
  sapObjectNodeType.name: 'ZADDENDABYCUSTV2'
  
}
@AccessControl.authorizationCheck: #MANDATORY

define root view entity ZPV_ADDENDABYCUSTV2
  provider contract transactional_query
  as projection on ZR_ADDENDABYCUSTV2
  association [1..1] to ZR_ADDENDABYCUSTV2 as _BaseEntity on $projection.Customerid = _BaseEntity.Customerid
{
  @UI.lineItem: [{ position: 10 }]
@UI.identification: [{ position: 10, importance: #HIGH }]
@UI.selectionField: [{ position: 10 }]
@Consumption.valueHelpDefinition: [{ entity: { name: 'I_Customer', element: 'Customer' } }] // Optional
  key Customerid,
  Addendatype,
  @Semantics: {
    user.createdBy: true
  }
  Createdby,
  Createdat,
  @Semantics: {
    user.lastChangedBy: true
  }
  Changedby,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  Lastchangedat,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  Locallastchanged,
  _BaseEntity
}
