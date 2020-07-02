CLASS zcl_tt_d_task_tlog_at_creation DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /bobf/if_frw_determination~execute
        REDEFINITION.

  PROTECTED SECTION.
    METHODS fill
      CHANGING
        time_log TYPE zstti_task_time_log
      RAISING
        cx_uuid_error.

  PRIVATE SECTION.
    DATA:
      read    TYPE REF TO /bobf/if_frw_read,
      context TYPE /bobf/s_frw_ctx_det.

ENDCLASS.



CLASS zcl_tt_d_task_tlog_at_creation IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    DATA: time_logs TYPE zttti_task_time_log.

    CLEAR: eo_message, et_failed_key.

    IF is_ctx-exectime <> /bobf/if_conf_c=>sc_time_after_modify.
      RAISE EXCEPTION TYPE /bobf/cx_lib
        EXPORTING
          textid = /bobf/cx_lib=>wrong_determination_time.
    ENDIF.

    eo_message = /bobf/cl_frw_factory=>get_message( ).

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = time_logs ).

    read = io_read.
    context = is_ctx.

    LOOP AT time_logs INTO DATA(time_log) WHERE task_code IS INITIAL.

      TRY.
          fill( CHANGING time_log = time_log ).
        CATCH cx_uuid_error INTO DATA(lx_uuid_error).
          eo_message->add_exception( lx_uuid_error ).
          et_failed_key = it_key.
          RETURN.
      ENDTRY.

      io_modify->update( iv_node = is_ctx-node_key
                         iv_key  = time_log-key
                         is_data = REF #( time_log ) ).

    ENDLOOP.

  ENDMETHOD.


  METHOD fill.

    DATA: tasks TYPE zttti_tasks.

    read->retrieve_by_association(
      EXPORTING iv_node                 = context-node_key
                it_key                  = VALUE #( ( key = time_log-key ) )
                iv_association          = zif_tt_i_tasks_c=>sc_association-ztt_i_task_time_log-to_parent
                iv_fill_data            = abap_true
      IMPORTING et_data                 = tasks ).

    DATA(task) = tasks[ 1 ].

    time_log-task_code    = task-code.
    time_log-project_code = task-project_code.
    time_log-code         = cl_system_uuid=>create_uuid_c32_static( ).

  ENDMETHOD.


ENDCLASS.
