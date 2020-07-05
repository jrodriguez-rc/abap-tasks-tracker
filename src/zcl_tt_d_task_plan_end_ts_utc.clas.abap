"! <p class="shorttext synchronized" lang="en">Determination: Task End timestamp UTC</p>
CLASS zcl_tt_d_task_plan_end_ts_utc DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /bobf/if_frw_determination~execute
        REDEFINITION.

  PROTECTED SECTION.
    "! <p class="shorttext synchronized" lang="en">Convert date to timestamp UTC</p>
    "!
    "! @parameter date | <p class="shorttext synchronized" lang="en">Date</p>
    "! @parameter timestamp | <p class="shorttext synchronized" lang="en">Timestamp UTC</p>
    METHODS conv_dats_to_ts_utc
      IMPORTING
        date TYPE d
      RETURNING
        VALUE(timestamp) TYPE timestampl.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_tt_d_task_plan_end_ts_utc IMPLEMENTATION.


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

    LOOP AT tasks INTO DATA(task).

      task-plan_end_ts_utc = conv_dats_to_ts_utc( task-plan_end_date ).

      io_modify->update( iv_node = is_ctx-node_key
                         iv_key  = task-key
                         is_data = REF #( task ) ).

    ENDLOOP.

  ENDMETHOD.


  METHOD conv_dats_to_ts_utc.

    CONVERT DATE date TIME '235959' INTO TIME STAMP timestamp TIME ZONE sy-zonlo.

  ENDMETHOD.


ENDCLASS.
