@AbapCatalog.sqlViewName: 'ZV_STUD_COURSE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Student Course enrollment Overview'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_STUDENT_COURSE 
    as select from ZI_ENROLLMENT
    
{
    key student_id,
    key course_id,
    
    student_name,
    course_title,
    enroll_date,
    grade
}
