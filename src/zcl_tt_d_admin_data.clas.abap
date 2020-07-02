"! <p class="shorttext synchronized" lang="en">Admin data</p>
CLASS zcl_tt_d_admin_data DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /bobf/if_frw_determination~execute
        REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_tt_d_admin_data IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    IF is_ctx-exectime <> /bobf/if_conf_c=>sc_time_at_save.
      RAISE EXCEPTION TYPE /bobf/cx_lib
        EXPORTING
          textid = /bobf/cx_lib=>wrong_determination_time.
    ENDIF.

    DATA(context) = is_ctx.
    context-exectime = /bobf/if_conf_c=>sc_time_before_save.

    NEW /bobf/cl_lib_d_admin_data_tsm( )->/bobf/if_frw_determination~execute(
      EXPORTING
        is_ctx        = context
        it_key        = it_key
        io_read       = io_read
        io_modify     = io_modify
      IMPORTING
        eo_message    = eo_message
        et_failed_key = et_failed_key ).

  ENDMETHOD.


ENDCLASS.
