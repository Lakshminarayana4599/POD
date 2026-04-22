@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for service view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zi_serviceorder
  as select from zservice_report
{
  key vbeln         as Vbeln,
      erdat         as Erdat,
      pod_date      as PodDate,
      pgi_date      as PgiDate,
      pgi_status    as PgiStatus,
      pod_status    as PodStatus,
      delivery_type as DeliveryType
}
