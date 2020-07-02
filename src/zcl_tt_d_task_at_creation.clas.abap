CLASS zcl_tt_d_task_at_creation DEFINITION
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
        task TYPE zstti_tasks.

  PRIVATE SECTION.
    DATA:
      read    TYPE REF TO /bobf/if_frw_read,
      context TYPE /bobf/s_frw_ctx_det.

ENDCLASS.



CLASS zcl_tt_d_task_at_creation IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    DATA: tasks TYPE zttti_tasks.

    CLEAR: eo_message, et_failed_key.

    IF is_ctx-exectime <> /bobf/if_conf_c=>sc_time_at_save.
      RAISE EXCEPTION TYPE /bobf/cx_lib
        EXPORTING
          textid = /bobf/cx_lib=>wrong_determination_time.
    ENDIF.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = tasks ).

    read = io_read.
    context = is_ctx.

    LOOP AT tasks INTO DATA(task) WHERE code IS INITIAL.

      fill( CHANGING task = task ).

      io_modify->update( iv_node = is_ctx-node_key
                         iv_key  = task-key
                         is_data = REF #( task ) ).

    ENDLOOP.

  ENDMETHOD.


  METHOD fill.

    DATA: number TYPE n LENGTH 5.

    IF task-time_unit IS INITIAL.
      task-time_unit = 'HOUR'.
    ENDIF.

    SELECT COUNT(*)
      INTO @DATA(count)
      FROM ztt_tasks
      WHERE project_code = @task-project_code.
    number = count.

    task-code = |{ task-project_code }-{ number }|.

  ENDMETHOD.


ENDCLASS.
