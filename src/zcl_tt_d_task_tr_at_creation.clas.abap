"! <p class="shorttext synchronized" lang="en">Determination: Task transport request at creation</p>
CLASS zcl_tt_d_task_tr_at_creation DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /bobf/if_frw_determination~execute
        REDEFINITION.

  PROTECTED SECTION.
    "! <p class="shorttext synchronized" lang="en"></p>
    "!
    "! @parameter request | <p class="shorttext synchronized" lang="en"></p>
    METHODS fill
      CHANGING
        request TYPE zstti_task_transport_request.

  PRIVATE SECTION.
    DATA:
      read    TYPE REF TO /bobf/if_frw_read,
      context TYPE /bobf/s_frw_ctx_det.

ENDCLASS.



CLASS zcl_tt_d_task_tr_at_creation IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    DATA: requests TYPE zttti_task_transport_request.

    CLEAR: eo_message, et_failed_key.

    eo_message = /bobf/cl_frw_factory=>get_message( ).

    IF is_ctx-exectime <> /bobf/if_conf_c=>sc_time_after_modify.
      RAISE EXCEPTION TYPE /bobf/cx_lib
        EXPORTING
          textid = /bobf/cx_lib=>wrong_determination_time.
    ENDIF.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = requests ).

    read = io_read.
    context = is_ctx.

    LOOP AT requests INTO DATA(request) WHERE project_code IS INITIAL.

      fill( CHANGING request = request ).

      io_modify->update( iv_node = is_ctx-node_key
                         iv_key  = request-key
                         is_data = REF #( request ) ).

    ENDLOOP.

  ENDMETHOD.


  METHOD fill.

    DATA: tasks TYPE zttti_tasks.

    read->retrieve_by_association(
      EXPORTING iv_node                 = context-node_key
                it_key                  = VALUE #( ( key = request-key ) )
                iv_association          = zif_tt_i_tasks_c=>sc_association-ztt_i_task_transport_request-to_parent
                iv_fill_data            = abap_true
      IMPORTING et_data                 = tasks ).

    DATA(task) = tasks[ 1 ].

    request-task_code    = task-code.
    request-project_code = task-project_code.

  ENDMETHOD.


ENDCLASS.
