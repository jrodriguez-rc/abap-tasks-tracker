"! <p class="shorttext synchronized" lang="en">Determination: Task comment at creation</p>
CLASS zcl_tt_d_task_comm_at_creation DEFINITION
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
    "! @parameter comment | <p class="shorttext synchronized" lang="en">Comment</p>
    "! @raising cx_uuid_error | <p class="shorttext synchronized" lang="en">UUID Exception</p>
    METHODS fill
      CHANGING
        comment TYPE zstti_task_comments
      RAISING
        cx_uuid_error.

  PRIVATE SECTION.
    DATA:
      read    TYPE REF TO /bobf/if_frw_read,
      context TYPE /bobf/s_frw_ctx_det.

ENDCLASS.



CLASS zcl_tt_d_task_comm_at_creation IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    DATA: comments TYPE zttti_task_comments.

    CLEAR: eo_message, et_failed_key.

    eo_message = /bobf/cl_frw_factory=>get_message( ).

    IF is_ctx-exectime <> /bobf/if_conf_c=>sc_time_at_save.
      RAISE EXCEPTION TYPE /bobf/cx_lib
        EXPORTING
          textid = /bobf/cx_lib=>wrong_determination_time.
    ENDIF.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = comments ).

    read = io_read.
    context = is_ctx.

    LOOP AT comments INTO DATA(comment) WHERE project_code IS INITIAL.

      TRY.
          fill( CHANGING comment = comment ).
        CATCH cx_uuid_error INTO DATA(lx_uuid_error).
          eo_message->add_exception( lx_uuid_error ).
          et_failed_key = it_key.
          RETURN.
      ENDTRY.

      io_modify->update( iv_node = is_ctx-node_key
                         iv_key  = comment-key
                         is_data = REF #( comment ) ).

    ENDLOOP.

  ENDMETHOD.


  METHOD fill.

    DATA: tasks TYPE zttti_tasks.

    read->retrieve_by_association(
      EXPORTING iv_node                 = context-node_key
                it_key                  = VALUE #( ( key = comment-key ) )
                iv_association          = zif_tt_i_tasks_c=>sc_association-ztt_i_task_comments-to_parent
                iv_fill_data            = abap_true
      IMPORTING et_data                 = tasks ).

    DATA(task) = tasks[ 1 ].

    comment-task_code    = task-code.
    comment-project_code = task-project_code.
    comment-code         = cl_system_uuid=>create_uuid_c32_static( ).

  ENDMETHOD.


ENDCLASS.
