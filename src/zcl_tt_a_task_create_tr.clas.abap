CLASS zcl_tt_a_task_create_tr DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_a_supercl_simple
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /bobf/if_frw_action~execute
        REDEFINITION .

  PROTECTED SECTION.
    METHODS get_tr_type ABSTRACT
      RETURNING
        VALUE(type) TYPE trfunction.

    METHODS read_project
      IMPORTING
        code           TYPE ztt_project_code
      RETURNING
        VALUE(project) TYPE ztti_projects.

  PRIVATE SECTION.
    DATA:
      context TYPE /bobf/s_frw_ctx_act,
      read    TYPE REF TO /bobf/if_frw_read,
      modify  TYPE REF TO /bobf/if_frw_modify.

    METHODS create_request
      IMPORTING
        type               TYPE trfunction
        task               TYPE zstti_tasks
      RETURNING
        VALUE(new_request) TYPE trkorr
      RAISING
        zcx_tt_management.

    METHODS create_bo
      IMPORTING
        new_request            TYPE trkorr
        task                   TYPE zstti_tasks
        error_after_creation   TYPE abap_bool DEFAULT abap_false
      RETURNING
        VALUE(created_request) TYPE zttti_task_transport_request.

ENDCLASS.



CLASS zcl_tt_a_task_create_tr IMPLEMENTATION.


  METHOD /bobf/if_frw_action~execute.

    DATA: tasks TYPE zttti_tasks.

    context = is_ctx.
    read    = io_read.
    modify  = io_modify.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = tasks ).

    LOOP AT tasks INTO DATA(task).

      DATA(error_after_creation) = abap_false.

      TRY.
          DATA(new_request) = create_request( type  = get_tr_type( )
                                              task = task ).
        CATCH zcx_tt_after_req_creation INTO DATA(lx_after_req_creation).
          zcx_tt_management=>collect_bo_message( EXPORTING exception    = lx_after_req_creation
                                                           message_type = 'W'
                                                           node         = is_ctx-node_key
                                                           key          = task-key
                                                 CHANGING  bo_messages  = eo_message ).
          error_after_creation = abap_true.
        CATCH zcx_tt_management INTO DATA(lx_management).
          zcx_tt_management=>collect_bo_message( EXPORTING exception   = lx_management
                                                           node        = is_ctx-node_key
                                                           key         = task-key
                                                 CHANGING  bo_messages = eo_message ).

          INSERT VALUE #( key = task-key ) INTO TABLE et_failed_key.
          CONTINUE.
      ENDTRY.

      create_bo( new_request = new_request task = task error_after_creation = error_after_creation ).

    ENDLOOP.


  ENDMETHOD.


  METHOD create_request.

    DATA: users              TYPE scts_users,
          attributes         TYPE scts_attrs,
          new_request_header TYPE trwbo_request_header.

    DATA(project) = read_project( task-project_code ).

    DATA(request_copy_text) = CONV as4text( task-description ).

    IF task-functional_responsible IS NOT INITIAL.
      INSERT VALUE #( user = task-functional_responsible type = 'X' ) INTO TABLE users.
    ENDIF.

    IF task-technical_responsible IS NOT INITIAL.
      INSERT VALUE #( user = task-technical_responsible  type = 'X' ) INTO TABLE users.
    ENDIF.

    attributes = COND #( WHEN project-cts_project IS NOT INITIAL
                             THEN VALUE #( ( attribute = 'SAP_CTS_PROJECT' value = project-cts_project ) ) ).

    CALL FUNCTION 'TR_INSERT_REQUEST_WITH_TASKS'
      EXPORTING
        iv_type            = type
        iv_text            = request_copy_text
        iv_target          = project-tr_target
        it_attributes      = attributes
        it_users           = users
        iv_with_badi_check = abap_true
      IMPORTING
        es_request_header  = new_request_header
      EXCEPTIONS
        insert_failed      = 1
        enqueue_failed     = 2
        OTHERS             = 3.
    IF sy-subrc <> 0.
      zcx_tt_management=>raise_syst( ).
    ENDIF.

    new_request = new_request_header-trkorr.

  ENDMETHOD.


  METHOD create_bo.

    DATA(copy_request) = VALUE zstti_task_transport_request( transport_request = new_request ).

    modify->create( EXPORTING iv_node            = zif_tt_i_tasks_c=>sc_node-ztt_i_task_transport_request
                              iv_assoc_key       = zif_tt_i_tasks_c=>sc_association-ztt_i_tasks-_transportrequests
                              iv_source_node_key = zif_tt_i_tasks_c=>sc_node-ztt_i_tasks
                              iv_source_key      = task-key
                              is_data            = REF #( copy_request )
                    IMPORTING ev_key             = DATA(lv_key) ).

    IF lv_key IS NOT INITIAL.
      read->retrieve( EXPORTING iv_node         = zif_tt_i_tasks_c=>sc_node-ztt_i_task_transport_request
                                it_key          = VALUE #( ( key = lv_key ) )
                                iv_before_image = abap_true
                      IMPORTING et_data         = created_request ).
    ENDIF.

  ENDMETHOD.


  METHOD read_project.

    SELECT SINGLE *
      INTO @project
      FROM ztt_projects
      WHERE code = @code.

  ENDMETHOD.


ENDCLASS.
