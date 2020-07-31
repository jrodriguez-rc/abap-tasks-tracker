"! <p class="shorttext synchronized" lang="en">Back task to previous version</p>
CLASS zcl_tt_a_task_back_prev_vers DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_a_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /bobf/if_frw_action~execute
        REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    METHODS restore_task_status
      CHANGING
        task TYPE zstti_tasks
      RAISING
        zcx_tt_management.

ENDCLASS.



CLASS zcl_tt_a_task_back_prev_vers IMPLEMENTATION.


  METHOD /bobf/if_frw_action~execute.

    DATA: tasks TYPE zttti_tasks.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = tasks ).

    LOOP AT tasks INTO DATA(task).

      TRY.
          restore_task_status( CHANGING task = task ).
        CATCH zcx_tt_management INTO DATA(lx_management).
          zcx_tt_management=>collect_bo_message(
            EXPORTING
              textid      = lx_management->if_t100_message~t100key
              text1       = lx_management->text1
              text2       = lx_management->text2
              text3       = lx_management->text3
              text4       = lx_management->text4
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


  METHOD restore_task_status.

    task-status = task-status_previous.
    CLEAR: task-status_previous.

  ENDMETHOD.


ENDCLASS.
