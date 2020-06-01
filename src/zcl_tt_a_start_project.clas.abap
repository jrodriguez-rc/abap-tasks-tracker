"! <p class="shorttext synchronized" lang="en">Start project</p>
CLASS zcl_tt_a_start_project DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_a_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_action~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tt_a_start_project IMPLEMENTATION.


  METHOD /bobf/if_frw_action~execute.
  ENDMETHOD.


ENDCLASS.
