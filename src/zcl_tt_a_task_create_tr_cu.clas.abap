"! <p class="shorttext synchronized" lang="en">Action: Create Customizing Transport Request</p>
CLASS zcl_tt_a_task_create_tr_cu DEFINITION
  PUBLIC
  INHERITING FROM zcl_tt_a_task_create_tr
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  PROTECTED SECTION.
    METHODS get_tr_type
        REDEFINITION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_tt_a_task_create_tr_cu IMPLEMENTATION.


  METHOD get_tr_type.

    type = 'W'.

  ENDMETHOD.


ENDCLASS.
