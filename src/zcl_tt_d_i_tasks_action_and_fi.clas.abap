"! <p class="shorttext synchronized" lang="en">Task action and field control</p>
CLASS zcl_tt_d_i_tasks_action_and_fi DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /bobf/if_frw_determination~execute
        REDEFINITION.

  PROTECTED SECTION.
    "! <p class="shorttext synchronized" lang="en">Task node</p>
    "!
    "! @parameter is_ctx | <p class="shorttext synchronized" lang="en">Context Information for Determinations</p>
    "! @parameter it_key | <p class="shorttext synchronized" lang="en">Key Table</p>
    "! @parameter io_read | <p class="shorttext synchronized" lang="en">Read operations</p>
    "! @parameter io_modify | <p class="shorttext synchronized" lang="en">Change operations</p>
    "! @parameter eo_message | <p class="shorttext synchronized" lang="en">Messages</p>
    "! @parameter et_failed_key | <p class="shorttext synchronized" lang="en">Failed keys</p>
    "! @raising /bobf/cx_frw | <p class="shorttext synchronized" lang="en">BOPF Exception</p>
    METHODS tasks
      IMPORTING
        is_ctx        TYPE /bobf/s_frw_ctx_det
        it_key        TYPE /bobf/t_frw_key
        io_read       TYPE REF TO /bobf/if_frw_read
        io_modify     TYPE REF TO /bobf/if_frw_modify
      EXPORTING
        eo_message    TYPE REF TO /bobf/if_frw_message
        et_failed_key TYPE /bobf/t_frw_key
      RAISING
        /bobf/cx_frw.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_tt_d_i_tasks_action_and_fi IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    CASE is_ctx-node_key.
      WHEN zif_tt_i_tasks_c=>sc_node-ztt_i_tasks.
        tasks( EXPORTING is_ctx        = is_ctx
                         it_key        = it_key
                         io_read       = io_read
                         io_modify     = io_modify
               IMPORTING eo_message    = eo_message
                         et_failed_key = et_failed_key ).

    ENDCASE.

  ENDMETHOD.


  METHOD tasks.

    DATA: tasks TYPE zttti_tasks.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = tasks ).

    DATA(property_helper) = NEW /bobf/cl_lib_h_set_property( io_modify  = io_modify
                                                             is_context = is_ctx ).

    LOOP AT tasks INTO DATA(task) WHERE project_code IS NOT INITIAL.

      property_helper->set_attribute_read_only(
           iv_attribute_name = zif_tt_i_tasks_c=>sc_node_attribute-ztt_i_tasks-project_code
           iv_key            = task-key ).

    ENDLOOP.

  ENDMETHOD.


ENDCLASS.
