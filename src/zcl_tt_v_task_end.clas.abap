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
    "! <p class="shorttext synchronized" lang="en">Check end status consistency</p>
    "!
    "! @parameter task | <p class="shorttext synchronized" lang="en">Task</p>
    "! @raising zcx_tt_management | <p class="shorttext synchronized" lang="en">Task exception</p>
    METHODS check_end_status
      IMPORTING
        task TYPE zstti_tasks
      RAISING
        zcx_tt_management.

ENDCLASS.



CLASS zcl_tt_v_task_end IMPLEMENTATION.


  METHOD /bobf/if_frw_validation~execute.

    DATA: tasks TYPE zttti_tasks.

    CLEAR: eo_message, et_failed_key.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = tasks ).

    LOOP AT tasks INTO DATA(task).

      TRY.
          check_end_status( task ).
        CATCH zcx_tt_management INTO DATA(lx_management).
          zcx_tt_management=>collect_bo_message(
            EXPORTING
              exception   = lx_management
              node        = is_ctx-node_key
              key         = task-key
            CHANGING
              bo_messages = eo_message ).
          INSERT VALUE #( key = task-key ) INTO TABLE et_failed_key.
          CONTINUE.
      ENDTRY.

    ENDLOOP.

  ENDMETHOD.


  METHOD check_end_status.

    IF task-ended_on = 0 AND
        ( task-status = zif_tt_constants=>gc_status-ended OR
          task-status = zif_tt_constants=>gc_status-cancelled ).

      RAISE EXCEPTION TYPE zcx_tt_management
        EXPORTING
          message_key    = zcx_tt_management=>task_end_time
          node_attribute = zif_tt_i_tasks_c=>sc_node_attribute-ztt_i_tasks-ended_on.

    ENDIF.

    IF task-ended_on > 0 AND
        task-status <> zif_tt_constants=>gc_status-ended AND
        task-status <> zif_tt_constants=>gc_status-cancelled.

      RAISE EXCEPTION TYPE zcx_tt_management
        EXPORTING
          message_key    = zcx_tt_management=>task_status_end_time
          node_attribute = zif_tt_i_tasks_c=>sc_node_attribute-ztt_i_tasks-status.

    ENDIF.

  ENDMETHOD.


ENDCLASS.
