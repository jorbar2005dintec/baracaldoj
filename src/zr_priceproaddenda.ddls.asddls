@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZPRICEPROADDENDA'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_PRICEPROADDENDA
  as select from ZPRICEPROADDENDA
{
  key customerid as Customerid,
  key mattype as Mattype,
  key condtype as Condtype,
  condtypetax as Condtypetax,
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
