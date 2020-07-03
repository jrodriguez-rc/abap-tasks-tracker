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

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_tt_d_i_tasks_action_and_fi IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

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
