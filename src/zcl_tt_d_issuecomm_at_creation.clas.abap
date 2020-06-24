CLASS zcl_tt_d_issuecomm_at_creation DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_determination~execute
        REDEFINITION .
  PROTECTED SECTION.
    METHODS fill
      CHANGING
        cs_comment TYPE zstti_issue_comments
      RAISING
        cx_uuid_error.

  PRIVATE SECTION.
    DATA:
      mi_read    TYPE REF TO /bobf/if_frw_read,
      ms_context TYPE /bobf/s_frw_ctx_det.

ENDCLASS.



CLASS zcl_tt_d_issuecomm_at_creation IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    DATA: lt_comments TYPE zttti_issue_comments.

    CLEAR: eo_message, et_failed_key.

    eo_message = /bobf/cl_frw_factory=>get_message( ).

    IF is_ctx-exectime <> /bobf/if_conf_c=>sc_time_at_save.
      RAISE EXCEPTION TYPE /bobf/cx_lib
        EXPORTING
          textid = /bobf/cx_lib=>wrong_determination_time.
    ENDIF.

    DATA(lo_admin_data) = NEW /bobf/cl_lib_d_admin_data_tsm( ).
    DATA(ls_context) = is_ctx.
    ls_context-exectime = /bobf/if_conf_c=>sc_time_before_save.
    lo_admin_data->/bobf/if_frw_determination~execute(
      EXPORTING
        is_ctx        = ls_context
        it_key        = it_key
        io_read       = io_read
        io_modify     = io_modify
      IMPORTING
        eo_message    = eo_message
        et_failed_key = et_failed_key ).

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = lt_comments ).

    mi_read = io_read.
    ms_context = is_ctx.

    LOOP AT lt_comments INTO DATA(ls_comment) WHERE project_code IS INITIAL.

      TRY.
          fill( CHANGING cs_comment = ls_comment ).
        CATCH cx_uuid_error INTO DATA(lx_uuid_error).
          eo_message->add_exception( lx_uuid_error ).
          et_failed_key = it_key.
          RETURN.
      ENDTRY.

      io_modify->update( iv_node = is_ctx-node_key
                         iv_key  = ls_comment-key
                         is_data = REF #( ls_comment ) ).

    ENDLOOP.

  ENDMETHOD.


  METHOD fill.

    DATA: lt_issues TYPE zttti_issues,
          lv_number TYPE n LENGTH 5.

    mi_read->retrieve_by_association(
      EXPORTING iv_node                 = ms_context-node_key
                it_key                  = VALUE #( ( key = cs_comment-key ) )
                iv_association          = zif_tt_i_projects_c=>sc_association-ztt_i_issue_comments-to_parent
                iv_fill_data            = abap_true
      IMPORTING et_data                 = lt_issues ).

    DATA(ls_issue) = lt_issues[ 1 ].

    cs_comment-issue_code   = ls_issue-code.
    cs_comment-project_code = ls_issue-project_code.
    cs_comment-code         = CAST if_system_uuid( NEW cl_system_uuid( ) )->create_uuid_c32( ).

  ENDMETHOD.


ENDCLASS.
