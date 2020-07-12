"! <p class="shorttext synchronized" lang="en">Validation: End task</p>
CLASS zcl_tt_v_task_end DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_v_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /bobf/if_frw_validation~execute
        REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA:
      context      TYPE /bobf/s_frw_ctx_val,
      read         TYPE REF TO /bobf/if_frw_read,
      all_messages TYPE REF TO /bobf/if_frw_message.

    METHODS check_end_status
      IMPORTING
        task          TYPE zstti_tasks
      RETURNING
        VALUE(failed) TYPE abap_bool.

    METHODS check_end_progress
      IMPORTING
        task          TYPE zstti_tasks
      RETURNING
        VALUE(failed) TYPE abap_bool.

ENDCLASS.



CLASS zcl_tt_v_task_end IMPLEMENTATION.


  METHOD /bobf/if_frw_validation~execute.

    DATA: tasks TYPE zttti_tasks.

    CLEAR: eo_message, et_failed_key.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = tasks ).

    context = is_ctx.
    read    = io_read.

    LOOP AT tasks INTO DATA(task).

      IF check_end_status( task ) AND NOT line_exists( et_failed_key[ KEY key_sort key = task-key ] ).
        INSERT VALUE #( key = task-key ) INTO TABLE et_failed_key.
      ENDIF.

      IF check_end_progress( task ) AND NOT line_exists( et_failed_key[ KEY key_sort key = task-key ] ).
        INSERT VALUE #( key = task-key ) INTO TABLE et_failed_key.
      ENDIF.

    ENDLOOP.

    eo_message = all_messages.

  ENDMETHOD.


  METHOD check_end_status.

    IF task-ended_on = 0 AND
        ( task-status = zif_tt_constants=>gc_status-ended OR
          task-status = zif_tt_constants=>gc_status-cancelled ).

      zcx_tt_management=>collect_bo_message(
        EXPORTING
          textid      = zcx_tt_management=>task_end_time
          node        = context-node_key
          key         = task-key
          attribute   = zif_tt_i_tasks_c=>sc_node_attribute-ztt_i_tasks-ended_on
        CHANGING
          bo_messages = all_messages ).
      failed = abap_true.

    ENDIF.

    IF task-ended_on > 0 AND
        task-status <> zif_tt_constants=>gc_status-ended AND
        task-status <> zif_tt_constants=>gc_status-cancelled.

      zcx_tt_management=>collect_bo_message(
        EXPORTING
          textid      = zcx_tt_management=>task_status_end_time
          node        = context-node_key
          key         = task-key
          attribute   = zif_tt_i_tasks_c=>sc_node_attribute-ztt_i_tasks-status
        CHANGING
          bo_messages = all_messages ).
      failed = abap_true.

    ENDIF.

  ENDMETHOD.


  METHOD check_end_progress.

    IF task-status = zif_tt_constants=>gc_status-ended AND task-progress <> 100.

      zcx_tt_management=>collect_bo_message(
        EXPORTING
          textid      = zcx_tt_management=>ended_task_progress_not_100
          node        = context-node_key
          key         = task-key
          attribute   = zif_tt_i_tasks_c=>sc_node_attribute-ztt_i_tasks-progress
        CHANGING
          bo_messages = all_messages ).
      failed = abap_true.

    ENDIF.

    IF task-status <> zif_tt_constants=>gc_status-ended AND task-progress = 100.

      zcx_tt_management=>collect_bo_message(
        EXPORTING
          textid      = zcx_tt_management=>progress_100_non_ended_task
          node        = context-node_key
          key         = task-key
          attribute   = zif_tt_i_tasks_c=>sc_node_attribute-ztt_i_tasks-status
        CHANGING
          bo_messages = all_messages ).
      failed = abap_true.

    ENDIF.

  ENDMETHOD.


ENDCLASS.
