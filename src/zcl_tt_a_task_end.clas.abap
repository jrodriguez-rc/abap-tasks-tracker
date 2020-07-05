CLASS zcl_tt_a_task_end DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_a_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /bobf/if_frw_action~execute
        REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    METHODS end_task
      CHANGING
        task TYPE zstti_tasks
      RAISING
        zcx_tt_management.

ENDCLASS.



CLASS zcl_tt_a_task_end IMPLEMENTATION.


  METHOD /bobf/if_frw_action~execute.

    DATA: tasks TYPE zttti_tasks.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = tasks ).

    LOOP AT tasks INTO DATA(task).

      TRY.
          end_task( CHANGING task = task ).
        CATCH zcx_tt_management INTO DATA(lx_management).
          zcx_tt_management=>collect_bo_message(
            EXPORTING
              exception   = lx_management
              node        = is_ctx-node_key
              key         = task-key
              attribute   = zif_tt_i_tasks_c=>sc_node_attribute-ztt_i_tasks-ended_on
            CHANGING
              bo_messages = eo_message ).
          INSERT VALUE #( key = task-key ) INTO TABLE et_failed_key.
          CONTINUE.
      ENDTRY.

      io_modify->update( iv_node = is_ctx-node_key
                         iv_key  = task-key
                         is_data = REF #( task ) ).

    ENDLOOP.

  ENDMETHOD.


  METHOD end_task.

    IF task-ended_on IS NOT INITIAL.
      RAISE EXCEPTION TYPE zcx_tt_management
        EXPORTING
          message_key = zcx_tt_management=>task_ended
          text_attr1  = CONV #( task-description ).
    ENDIF.

    GET TIME STAMP FIELD task-ended_on.
    task-status = zif_tt_constants=>gc_status-ended.

  ENDMETHOD.


ENDCLASS.
