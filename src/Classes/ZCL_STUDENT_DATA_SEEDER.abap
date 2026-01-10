CLASS zcl_student_data_seeder DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS zcl_student_data_seeder IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lt_students   TYPE STANDARD TABLE OF zstudent_td,
          lt_courses    TYPE STANDARD TABLE OF zcourse_td,
          lt_enrollments TYPE STANDARD TABLE OF zenrollment_td.

    "---------------------------------
    " Students
    "---------------------------------
    APPEND VALUE #( client = sy-mandt student_id = 'S001' name = 'Alice' email = 'alice@mail.com' ) TO lt_students.
    APPEND VALUE #( client = sy-mandt student_id = 'S002' name = 'Bob'   email = 'bob@mail.com'   ) TO lt_students.

    INSERT zstudent_td FROM TABLE @lt_students.


    "---------------------------------
    " Courses
    "---------------------------------
    APPEND VALUE #( client = sy-mandt course_id = 'C101' title = 'Algorithms' credits = 4 ) TO lt_courses.
    APPEND VALUE #( client = sy-mandt course_id = 'C102' title = 'Databases'  credits = 3 ) TO lt_courses.

    INSERT zcourse_td FROM TABLE @lt_courses.


    "---------------------------------
    " Enrollments
    "---------------------------------
    APPEND VALUE #(
      client = sy-mandt
      student_id = 'S001'
      course_id = 'C101'
      enroll_date = sy-datum
      grade = 'A'
    ) TO lt_enrollments.

    APPEND VALUE #(
      client = sy-mandt
      student_id = 'S002'
      course_id = 'C102'
      enroll_date = sy-datum
      grade = 'B'
    ) TO lt_enrollments.

    INSERT zenrollment_td FROM TABLE @lt_enrollments.


    COMMIT WORK.

    out->write( 'Sample data inserted successfully.' ).

  ENDMETHOD.

ENDCLASS.

