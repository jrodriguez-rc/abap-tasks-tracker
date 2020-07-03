"! <p class="shorttext synchronized" lang="en">Validation: Project code</p>
CLASS zcl_tt_v_project_code DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_v_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /bobf/if_frw_validation~execute
        REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_tt_v_project_code IMPLEMENTATION.


  METHOD /bobf/if_frw_validation~execute.

    DATA: projects TYPE zttti_projects.

    CLEAR: eo_message, et_failed_key.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = projects ).

    LOOP AT projects INTO DATA(project) WHERE code IS INITIAL.

      zcx_tt_management=>collect_bo_message(
        EXPORTING
          exception    = NEW zcx_tt_management( message_key = zcx_tt_management=>project_mandatory )
          node         = is_ctx-node_key
          key          = project-key
          attribute    = 'CODE'
        CHANGING
          bo_messages  = eo_message ).

      INSERT VALUE #( key = project-key ) INTO TABLE et_failed_key.

    ENDLOOP.

  ENDMETHOD.


ENDCLASS.
