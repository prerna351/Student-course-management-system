CLASS zcl_student_course_report DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS zcl_student_course_report IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "Internal table based on CDS view
    DATA lt_data TYPE STANDARD TABLE OF zi_student_course.

    "Read data from CDS
    SELECT *
      FROM zi_student_course
      INTO TABLE @lt_data.

    IF lt_data IS INITIAL.
      out->write( 'No enrollment data found.' ).
      RETURN.
    ENDIF.

    "Header
    out->write( 'Student Course Enrollment Report' ).
    out->write( '--------------------------------' ).

    "Display rows
    LOOP AT lt_data INTO DATA(ls_row).
      out->write(
        |Student: { ls_row-student_name } |
        && |Course: { ls_row-course_title } |
        && |Enroll Date: { ls_row-enroll_date } |
        && |Grade: { ls_row-grade }|
      ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.

