CLASS zcl_tt_v_task_progress DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_v_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /bobf/if_frw_validation~execute
        REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_tt_v_task_progress IMPLEMENTATION.


  METHOD /bobf/if_frw_validation~execute.

    DATA: tasks TYPE zttti_tasks.

    CLEAR: eo_message, et_failed_key.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = tasks ).

    LOOP AT tasks INTO DATA(task).

      IF task-progress > 100.

        zcx_tt_management=>collect_bo_message(
          EXPORTING
            exception    = NEW zcx_tt_management( message_key = zcx_tt_management=>progress_over_100 )
            node         = is_ctx-node_key
            key          = task-key
            attribute    = zif_tt_i_tasks_c=>sc_node_attribute-ztt_i_tasks-progress
          CHANGING
            bo_messages  = eo_message ).

        INSERT VALUE #( key = task-key ) INTO TABLE et_failed_key.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.


ENDCLASS.
