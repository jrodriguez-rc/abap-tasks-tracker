"! <p class="shorttext synchronized" lang="en">Generated</p>
CLASS zcl_d_tt_i_projects_action_and DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /bobf/if_frw_determination~execute
        REDEFINITION .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d_tt_i_projects_action_and IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    DATA: projects TYPE zttti_projects.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = projects ).

    DATA(property_helper) = NEW /bobf/cl_lib_h_set_property( io_modify  = io_modify
                                                             is_context = is_ctx ).

    LOOP AT projects INTO DATA(project) WHERE code IS NOT INITIAL.

      property_helper->set_attribute_read_only(
           iv_attribute_name = zif_tt_i_projects_c=>sc_node_attribute-ztt_i_projects-code
           iv_key            = project-key ).

    ENDLOOP.

  ENDMETHOD.


ENDCLASS.
