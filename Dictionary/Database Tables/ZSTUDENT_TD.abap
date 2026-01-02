@EndUserText.label : 'Student Master Table'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zstudent_td {

  key client     : abap.clnt not null;
  key student_id : abap.char(10) not null;
  name           : abap.char(100);
  email          : abap.char(100);
  date_of_birth  : abap.dats;

}
