"! <p class="shorttext synchronized" lang="en">Determination: Task at creation</p>
CLASS zcl_tt_d_task_at_creation DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /bobf/if_frw_determination~execute
        REDEFINITION.

  PROTECTED SECTION.
    "! <p class="shorttext synchronized" lang="en">Fill content</p>
    "!
    "! @parameter task | <p class="shorttext synchronized" lang="en">Task</p>
    METHODS fill
      CHANGING
        task TYPE zstti_tasks.

  PRIVATE SECTION.
    TYPES:
      ty_number TYPE n LENGTH 5.

    TYPES:
      BEGIN OF ts_last_project_number,
        project_code TYPE ztt_project_code,
        number       TYPE ty_number,
      END OF ts_last_project_number,
      tt_last_project_number TYPE HASHED TABLE OF ts_last_project_number WITH UNIQUE KEY project_code.

    DATA:
      read                 TYPE REF TO /bobf/if_frw_read,
      context              TYPE /bobf/s_frw_ctx_det,
      last_project_numbers TYPE tt_last_project_number.

    METHODS get_next_number
      IMPORTING
        project_code       TYPE ztt_project_code
      RETURNING
        VALUE(next_number) TYPE ty_number.

ENDCLASS.



CLASS zcl_tt_d_task_at_creation IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    DATA: tasks TYPE zttti_tasks.

    CLEAR: eo_message, et_failed_key.

    IF is_ctx-exectime <> /bobf/if_conf_c=>sc_time_after_modify.
      RAISE EXCEPTION TYPE /bobf/cx_lib
        EXPORTING
          textid = /bobf/cx_lib=>wrong_determination_time.
    ENDIF.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = tasks ).

    read = io_read.
    context = is_ctx.

    LOOP AT tasks INTO DATA(task).

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

    IF task-code IS INITIAL.
      task-code = |{ task-project_code }-{ get_next_number( task-project_code ) }|.
    ENDIF.

  ENDMETHOD.


  METHOD get_next_number.

    READ TABLE last_project_numbers ASSIGNING FIELD-SYMBOL(<last_project_number>)
      WITH KEY project_code = project_code.
    IF sy-subrc <> 0.

      INSERT INITIAL LINE INTO TABLE last_project_numbers ASSIGNING <last_project_number>.

      <last_project_number>-project_code = project_code.

      SELECT COUNT(*)
        INTO @DATA(count)
        FROM ztt_tasks
        WHERE project_code = @project_code.
      <last_project_number>-number = count.

    ENDIF.

    <last_project_number>-number = <last_project_number>-number + 1.

    next_number = <last_project_number>-number.

  ENDMETHOD.


ENDCLASS.
