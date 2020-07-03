"! <p class="shorttext synchronized" lang="en">Validation: Task project code</p>
CLASS zcl_tt_v_task_project_code DEFINITION
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



CLASS zcl_tt_v_task_project_code IMPLEMENTATION.


  METHOD /bobf/if_frw_validation~execute.

    DATA: tasks TYPE zttti_tasks.

    CLEAR: eo_message, et_failed_key.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = tasks ).

    LOOP AT tasks INTO DATA(task) WHERE project_code IS INITIAL.

      zcx_tt_management=>collect_bo_message(
        EXPORTING
          exception    = NEW zcx_tt_management( message_key = zcx_tt_management=>project_mandatory )
          node         = is_ctx-node_key
          key          = task-key
          attribute    = 'PROJECT_CODE'
        CHANGING
          bo_messages  = eo_message ).

      INSERT VALUE #( key = task-key ) INTO TABLE et_failed_key.

    ENDLOOP.

  ENDMETHOD.


ENDCLASS.
