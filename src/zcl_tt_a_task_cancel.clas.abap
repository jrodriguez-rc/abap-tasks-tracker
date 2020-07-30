"! <p class="shorttext synchronized" lang="en">Cancel task</p>
CLASS zcl_tt_a_task_cancel DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_a_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_action~execute
        REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    METHODS cancel_task
      CHANGING
        task TYPE zstti_tasks
      RAISING
        zcx_tt_management.

ENDCLASS.



CLASS zcl_tt_a_task_cancel IMPLEMENTATION.


  METHOD /bobf/if_frw_action~execute.

    DATA: tasks TYPE zttti_tasks.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = tasks ).

    LOOP AT tasks INTO DATA(task).

      TRY.
          cancel_task( CHANGING task = task ).
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

      INSERT task INTO TABLE et_data.

      IF eo_message IS NOT BOUND.
        eo_message = /bobf/cl_frw_factory=>get_message( ).
      ENDIF.

      eo_message->add_message( VALUE symsg( msgty = 'S'
                                            msgid = zcx_tt_management=>progress_over_100-msgid
                                            msgno = zcx_tt_management=>progress_over_100-msgno ) ).

    ENDLOOP.

  ENDMETHOD.


  METHOD cancel_task.

    task-cancelled       = abap_true.
    task-cancelled_uname = sy-uname.
    GET TIME STAMP FIELD task-cancelled_date_time.

  ENDMETHOD.


ENDCLASS.
