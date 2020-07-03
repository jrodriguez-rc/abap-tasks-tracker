"! <p class="shorttext synchronized" lang="en">Task transport request action and field control</p>
CLASS zcl_tt_d_i_task_tr_action_and DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_determination~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tt_d_i_task_tr_action_and IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    DATA: transport_requests TYPE zttti_task_transport_request.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = transport_requests ).

    DATA(property_helper) = NEW /bobf/cl_lib_h_set_property( io_modify  = io_modify
                                                             is_context = is_ctx ).

    LOOP AT transport_requests INTO DATA(transport_request) WHERE transport_request IS NOT INITIAL.

      property_helper->set_attribute_read_only(
           iv_attribute_name = zif_tt_i_tasks_c=>sc_node_attribute-ztt_i_task_transport_request-transport_request
           iv_key            = transport_request-key ).

    ENDLOOP.

  ENDMETHOD.


ENDCLASS.
