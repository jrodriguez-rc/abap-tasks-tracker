"! <p class="shorttext synchronized" lang="en">Generated</p>
CLASS zcl_tt_d_i_projects_action_and DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /bobf/if_frw_determination~execute
        REDEFINITION .

  PROTECTED SECTION.
    METHODS projects
      IMPORTING
        is_ctx        TYPE /bobf/s_frw_ctx_det
        it_key        TYPE /bobf/t_frw_key
        io_read       TYPE REF TO /bobf/if_frw_read
        io_modify     TYPE REF TO /bobf/if_frw_modify
      EXPORTING
        eo_message    TYPE REF TO /bobf/if_frw_message
        et_failed_key TYPE /bobf/t_frw_key
      RAISING
        /bobf/cx_frw.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_tt_d_i_projects_action_and IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    CASE is_ctx-node_key.
      WHEN zif_tt_i_tasks_c=>sc_node-ztt_i_tasks.
        projects( EXPORTING is_ctx        = is_ctx
                            it_key        = it_key
                            io_read       = io_read
                            io_modify     = io_modify
                  IMPORTING eo_message    = eo_message
                            et_failed_key = et_failed_key ).

    ENDCASE.

  ENDMETHOD.


  METHOD projects.

*    DATA: projects TYPE zttti_projects.
*
*    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
*                                 it_key  = it_key
*                       IMPORTING et_data = projects ).
*
*    DATA(property_helper) = NEW /bobf/cl_lib_h_set_property( io_modify  = io_modify
*                                                             is_context = is_ctx ).
*
*    LOOP AT projects INTO DATA(project) WHERE code IS NOT INITIAL.
*
*      property_helper->set_attribute_read_only(
*           iv_attribute_name = zif_tt_i_projects_c=>sc_node_attribute-ztt_i_projects-code
*           iv_key            = project-key ).
*
*    ENDLOOP.

  ENDMETHOD.


ENDCLASS.
