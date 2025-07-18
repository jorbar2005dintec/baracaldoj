@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_ADDENDABYCUSTOM000
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_ADDENDABYCUSTOM000
{
  key Customer,
  Addendatype,
  Createdby,
  Createdat,
  LastChangedBy,
  Lastchangedat,
  Locallastchanged
  
}
