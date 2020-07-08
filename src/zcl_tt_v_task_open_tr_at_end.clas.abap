"! <p class="shorttext synchronized" lang="en">Validation: Open transport requests at end task</p>
CLASS zcl_tt_v_task_open_tr_at_end DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_v_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /bobf/if_frw_validation~execute
        REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA:
      context      TYPE /bobf/s_frw_ctx_val,
      read         TYPE REF TO /bobf/if_frw_read,
      all_messages TYPE REF TO /bobf/if_frw_message.

    METHODS check_open_transport_request
      IMPORTING
        task          TYPE zstti_tasks
      RETURNING
        VALUE(failed) TYPE abap_bool.

ENDCLASS.



CLASS zcl_tt_v_task_open_tr_at_end IMPLEMENTATION.


  METHOD /bobf/if_frw_validation~execute.

    DATA: tasks TYPE zttti_tasks.

    CLEAR: eo_message, et_failed_key.

    io_read->retrieve( EXPORTING iv_node = is_ctx-node_key
                                 it_key  = it_key
                       IMPORTING et_data = tasks ).

    context = is_ctx.
    read    = io_read.

    LOOP AT tasks INTO DATA(task).

      IF check_open_transport_request( task ) AND NOT line_exists( et_failed_key[ KEY key_sort key = task-key ] ).
        INSERT VALUE #( key = task-key ) INTO TABLE et_failed_key.
      ENDIF.

    ENDLOOP.

    eo_message = all_messages.

  ENDMETHOD.


  METHOD check_open_transport_request.

    DATA: transport_requests TYPE zttti_task_transport_request.

    IF task-status <> zif_tt_constants=>gc_status-ended AND
        task-status <> zif_tt_constants=>gc_status-cancelled.

      RETURN.

    ENDIF.

    read->retrieve_by_association(
      EXPORTING
        iv_node        = context-node_key
        it_key         = VALUE #( ( key = task-key ) )
        iv_association = zif_tt_i_tasks_c=>sc_association-ztt_i_tasks-_transportrequests
        iv_fill_data   = abap_true
      IMPORTING
        et_data        = transport_requests ).

    LOOP AT transport_requests REFERENCE INTO DATA(transport_request).

      SELECT SINGLE trstatus
        INTO @DATA(transport_request_status)
        FROM e070
        WHERE trkorr = @transport_request->transport_request.

      IF transport_request_status = 'D' OR transport_request_status = 'L'.

        zcx_tt_management=>collect_bo_message(
          EXPORTING
            exception    = NEW zcx_tt_management( message_key = zcx_tt_management=>transport_request_open
                                                  text_attr1  = transport_request->transport_request )
            node         = context-node_key
            key          = task-key
            attribute    = zif_tt_i_tasks_c=>sc_node_attribute-ztt_i_tasks-status
          CHANGING
            bo_messages  = all_messages ).
        failed = abap_true.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.


ENDCLASS.
