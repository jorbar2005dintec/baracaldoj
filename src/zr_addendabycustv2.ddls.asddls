@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZADDENDABYCUSTV2'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_ADDENDABYCUSTV2
  as select from zaddendabycustv2 as ZCD_ADDENDABYCUSTOMV2
{
  key customerid as Customerid,
  addendatype as Addendatype,
  
  @Semantics.user.createdBy: true
  createdby as Createdby,
  createdat as Createdat,
  @Semantics.user.lastChangedBy: true
  changedby as Changedby,
  @Semantics.systemDateTime.lastChangedAt: true
  lastchangedat as Lastchangedat,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  locallastchanged as Locallastchanged
}
