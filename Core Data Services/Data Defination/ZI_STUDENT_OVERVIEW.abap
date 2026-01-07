@AbapCatalog.sqlViewName: ''
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'STUDENTS WITH ENROLLMENTS'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_STUDENT_OVERVIEW 
    as select from zstudent_td as s
    
    association [0..*] to zenrollment_td as _enrollments
        on s.student_id = _enrollments.student_id
    association [0..*] to zcourse_td as _Courses
        on _enrollments.course_id = _Courses.course_id
    
{
    key s.student_id,
        s.name,
        s.email,
        
        _enrollments.enroll_date,
        _Courses.title as course_title,
        _enrollments.grade
}
