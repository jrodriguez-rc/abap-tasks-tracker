CLASS zcl_tt_a_issue_create_tr DEFINITION
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



CLASS zcl_tt_a_issue_create_tr IMPLEMENTATION.


  METHOD /bobf/if_frw_action~execute.

    FIELD-SYMBOLS: <ls_parameters> TYPE ztt_s_a_create_tr.

    ASSIGN is_parameters->* TO <ls_parameters>.
    ASSERT sy-subrc = 0.

  ENDMETHOD.


ENDCLASS.
