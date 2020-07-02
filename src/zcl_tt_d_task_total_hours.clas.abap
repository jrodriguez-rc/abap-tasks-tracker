CLASS zcl_tt_d_task_total_hours DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /bobf/if_frw_determination~execute
        REDEFINITION.

  PROTECTED SECTION.
    METHODS calc_hours
      IMPORTING
        from_ts            TYPE timestampl
        to_ts              TYPE timestampl
      RETURNING
        VALUE(total_hours) TYPE ztt_total_hours.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_tt_d_task_total_hours IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    DATA: time_logs TYPE zttti_task_time_log.

    CLEAR: eo_message, et_failed_key.

    eo_message = /bobf/cl_frw_factory=>get_message( ).

    IF is_ctx-exectime <> /bobf/if_conf_c=>sc_time_after_modify.
      RAISE EXCEPTION TYPE /bobf/cx_lib
        EXPORTING
          textid = /bobf/cx_lib=>wrong_determination_time.
    ENDIF.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = time_logs ).

    LOOP AT time_logs INTO DATA(time_log).

      time_log-total_hours = calc_hours( from_ts = time_log-start_ts
                                         to_ts   = time_log-end_ts ).

      io_modify->update( iv_node = is_ctx-node_key
                         iv_key  = time_log-key
                         is_data = REF #( time_log ) ).

    ENDLOOP.

  ENDMETHOD.


  METHOD calc_hours.

    DATA: secs TYPE i.

    CONVERT TIME STAMP from_ts TIME ZONE 'UTC' INTO DATE DATA(date_from) TIME DATA(time_from).
    CONVERT TIME STAMP to_ts   TIME ZONE 'UTC' INTO DATE DATA(date_to)   TIME DATA(time_to).

    CALL FUNCTION 'SWI_DURATION_DETERMINE'
      EXPORTING
        start_date = date_from
        start_time = time_from
        end_date   = date_to
        end_time   = time_to
      IMPORTING
        duration   = secs.

    CALL FUNCTION 'UNIT_CONVERSION_SIMPLE'
      EXPORTING
        input                = secs
        round_sign           = ' '
        unit_in              = 'S'
        unit_out             = 'H'
      IMPORTING
        output               = total_hours
      EXCEPTIONS
        conversion_not_found = 1
        division_by_zero     = 2
        input_invalid        = 3
        output_invalid       = 4
        overflow             = 5
        type_invalid         = 6
        units_missing        = 7
        unit_in_not_found    = 8
        unit_out_not_found   = 9
        OTHERS               = 10.

  ENDMETHOD.


ENDCLASS.
