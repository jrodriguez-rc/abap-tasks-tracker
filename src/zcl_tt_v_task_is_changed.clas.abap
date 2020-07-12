"! <p class="shorttext synchronized" lang="en">Validation: Is task has been changed by another process?</p>
CLASS zcl_tt_v_task_is_changed DEFINITION
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

    METHODS check_admin_data_changes
      IMPORTING
        task          TYPE zstti_tasks
      RETURNING
        VALUE(failed) TYPE abap_bool.

ENDCLASS.



CLASS zcl_tt_v_task_is_changed IMPLEMENTATION.


  METHOD /bobf/if_frw_validation~execute.

    DATA: tasks TYPE zttti_tasks.

    CLEAR: eo_message, et_failed_key.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = tasks ).

    context = is_ctx.
    read    = io_read.

    LOOP AT tasks INTO DATA(task).

      IF check_admin_data_changes( task ) AND NOT line_exists( et_failed_key[ KEY key_sort key = task-key ] ).
        INSERT VALUE #( key = task-key ) INTO TABLE et_failed_key.
      ENDIF.

    ENDLOOP.

    eo_message = all_messages.

  ENDMETHOD.


  METHOD check_admin_data_changes.

    SELECT SINGLE crea_date_time,lchg_date_time
      INTO @DATA(admin_data)
      FROM ztt_tasks
      WHERE project_code = @task-project_code
        AND code         = @task-code.
    IF sy-subrc <> 0. " New
      RETURN.
    ENDIF.

    IF admin_data-crea_date_time <> task-crea_date_time OR admin_data-lchg_date_time <> task-lchg_date_time.
      zcx_tt_management=>collect_bo_message(
        EXPORTING
          textid      = zcx_tt_management=>task_changed
          node        = context-node_key
          key         = task-key
        CHANGING
          bo_messages = all_messages ).
      failed = abap_true.
    ENDIF.

  ENDMETHOD.


ENDCLASS.
