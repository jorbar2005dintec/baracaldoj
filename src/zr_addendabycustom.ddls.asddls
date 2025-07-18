@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_ADDENDABYCUSTOM
  as select from ZADDENDABYCUSTOM as ZC_ADDENDABYCUSTOM_DM
{
  key customer as Customer,
  addendatype as Addendatype,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  createdat as Createdat,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  lastchangedat as Lastchangedat,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  locallastchanged as Locallastchanged
  
}
