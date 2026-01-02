@EndUserText.label : 'Course Master Table'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zcourse_td {

  key client    : abap.clnt not null;
  key course_id : abap.char(10) not null;
  title         : abap.char(100);
  credits       : abap.int4;

}
