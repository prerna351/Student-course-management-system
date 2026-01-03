@AbapCatalog.sqlViewName: 'ZV_ENROLL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Enrollment Read View'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_ENROLLMENT as select from zenrollment_td as e
    inner join zstudent_td as s on e.student_id = s.student_id
    inner join zcourse_td  as c on e.course_id = c.course_id
{
    key e.student_id,
    key e.course_id,
    
    s.name              as student_name,
    c.title             as course_title,
    e.enroll_date,
    e.grade       
}
