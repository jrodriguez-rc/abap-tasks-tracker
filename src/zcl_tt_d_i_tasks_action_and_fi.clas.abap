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
    TYPES:
      BEGIN OF ts_tr_status,
        workbench_open   TYPE abap_bool,
        customizing_open TYPE abap_bool,
      END OF ts_tr_status.

    "! <p class="shorttext synchronized" lang="en"></p>
    "!
    "! @parameter task | <p class="shorttext synchronized" lang="en"></p>
    METHODS set_create_request_enabled
      IMPORTING
        task            TYPE zstti_tasks
        property_helper TYPE REF TO /bobf/cl_lib_h_set_property .

    METHODS read_tr_status
      IMPORTING
        task          TYPE zstti_tasks
      RETURNING
        VALUE(status) TYPE ts_tr_status.

ENDCLASS.



CLASS zcl_tt_d_i_tasks_action_and_fi IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    DATA: tasks TYPE zttti_tasks.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = tasks ).

    DATA(property_helper) = NEW /bobf/cl_lib_h_set_property( io_modify  = io_modify
                                                             is_context = is_ctx ).

    LOOP AT tasks INTO DATA(task).

      property_helper->set_attribute_read_only(
           iv_attribute_name = zif_tt_i_tasks_c=>sc_node_attribute-ztt_i_tasks-project_code
           iv_key            = task-key
           iv_value          = xsdbool( task-project_code IS NOT INITIAL ) ).

      set_create_request_enabled( task            = task
                                  property_helper = property_helper ).

      property_helper->set_action_enabled(
            iv_action_key = zif_tt_i_tasks_c=>sc_action-ztt_i_tasks-end_task
            iv_key        = task-key
            iv_value      = xsdbool( task-status = zif_tt_constants=>gc_status-open OR
                                     task-status = zif_tt_constants=>gc_status-work_in_progress ) ).

    ENDLOOP.

  ENDMETHOD.


  METHOD set_create_request_enabled.

    DATA: workbench_enabled   TYPE abap_bool,
          customizing_enabled TYPE abap_bool.

    DATA(tr_status) = read_tr_status( task = task ).

    IF task-status = zif_tt_constants=>gc_status-open OR task-status = zif_tt_constants=>gc_status-work_in_progress.

      workbench_enabled   = xsdbool( tr_status-workbench_open   = abap_false ).
      customizing_enabled = xsdbool( tr_status-customizing_open = abap_false ).

    ELSE.

      workbench_enabled   = abap_false.
      customizing_enabled = abap_false.

    ENDIF.

    property_helper->set_action_enabled( iv_action_key = zif_tt_i_tasks_c=>sc_action-ztt_i_tasks-create_tr_wb
                                         iv_key        = task-key
                                         iv_value      = workbench_enabled ).

    property_helper->set_action_enabled( iv_action_key = zif_tt_i_tasks_c=>sc_action-ztt_i_tasks-create_tr_cu
                                         iv_key        = task-key
                                         iv_value      = customizing_enabled ).

  ENDMETHOD.


  METHOD read_tr_status.

    SELECT requestfunction
      FROM ztt_c_task_transport_request
      INTO TABLE @DATA(transport_requests)
      WHERE projectcode   = @task-project_code
        AND taskcode      = @task-code
        AND requeststatus = 'D'.

    status-customizing_open = xsdbool( line_exists( transport_requests[ requestfunction = 'W' ] ) ).
    status-workbench_open   = xsdbool( line_exists( transport_requests[ requestfunction = 'K' ] ) ).

  ENDMETHOD.


ENDCLASS.
