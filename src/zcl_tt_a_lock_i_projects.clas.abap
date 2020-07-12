"! <p class="shorttext synchronized" lang="en">Action: Lock project</p>
CLASS zcl_tt_a_lock_i_projects DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_a_lock_active
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /bobf/if_lib_lock_active~lock_active_entity
        REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_tt_a_lock_i_projects IMPLEMENTATION.


  METHOD /bobf/if_lib_lock_active~lock_active_entity.

    " Not valid

  ENDMETHOD.


ENDCLASS.
