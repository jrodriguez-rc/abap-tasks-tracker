CLASS zcl_tt_d_issue_at_creation DEFINITION
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
        cs_issue TYPE zstti_issues.
  PRIVATE SECTION.
    DATA:
      mi_read    TYPE REF TO /bobf/if_frw_read,
      ms_context TYPE /bobf/s_frw_ctx_det.

ENDCLASS.



CLASS zcl_tt_d_issue_at_creation IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    DATA: lt_issues TYPE zttti_issues.

    CLEAR: eo_message, et_failed_key.

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
                       IMPORTING et_data = lt_issues ).

    mi_read = io_read.
    ms_context = is_ctx.

    LOOP AT lt_issues INTO DATA(ls_issue) WHERE project_code IS INITIAL.

      fill( CHANGING cs_issue = ls_issue ).

      io_modify->update( iv_node = is_ctx-node_key
                         iv_key  = ls_issue-key
                         is_data = REF #( ls_issue ) ).

    ENDLOOP.

  ENDMETHOD.


  METHOD fill.

    DATA: lt_projects TYPE zttti_projects,
          lt_issues   TYPE SORTED TABLE OF zstti_issues WITH UNIQUE KEY key
                                                        WITH UNIQUE SORTED KEY code COMPONENTS project_code code,
          lv_number   TYPE n LENGTH 5.

    mi_read->retrieve_by_association(
      EXPORTING iv_node                 = ms_context-node_key
                it_key                  = VALUE #( ( key = cs_issue-key ) )
                iv_association          = zif_tt_i_projects_c=>sc_association-ztt_i_issues-to_parent
                iv_fill_data            = abap_true
      IMPORTING et_data                 = lt_projects ).

    DATA(ls_project) = lt_projects[ 1 ].

    cs_issue-project_code = ls_project-code.

    IF cs_issue-time_unit IS INITIAL.
      cs_issue-time_unit = ls_project-default_time_unit.
    ENDIF.

    mi_read->retrieve_by_association(
      EXPORTING iv_node                 = zif_tt_i_projects_c=>sc_node-ztt_i_projects
                it_key                  = VALUE #( ( key = ls_project-key ) )
                iv_association          = zif_tt_i_projects_c=>sc_association-ztt_i_projects-_issues
                iv_fill_data            = abap_true
      IMPORTING et_data                 = lt_issues ).

    lv_number = lines( FILTER #( lt_issues USING KEY code WHERE project_code = ls_project-code ) ).

    cs_issue-code = |{ ls_project-code }-{ lv_number }|.

  ENDMETHOD.


ENDCLASS.
