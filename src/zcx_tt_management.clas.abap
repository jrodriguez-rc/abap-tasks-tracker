"! <p class="shorttext synchronized" lang="en">Project Exception</p>
CLASS zcx_tt_management DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .

    CONSTANTS:
      "! <p class="shorttext synchronized" lang="en">Project is mandatory</p>
      BEGIN OF project_mandatory,
        msgid TYPE symsgid VALUE 'ZTT_TASK',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'TEXT1',
        attr2 TYPE scx_attrname VALUE 'TEXT2',
        attr3 TYPE scx_attrname VALUE 'TEXT3',
        attr4 TYPE scx_attrname VALUE 'TEXT4',
      END OF project_mandatory,
      "! <p class="shorttext synchronized" lang="en">Task &1 is already ended</p>
      BEGIN OF task_ended,
        msgid TYPE symsgid VALUE 'ZTT_TASK',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'TEXT1',
        attr2 TYPE scx_attrname VALUE 'TEXT2',
        attr3 TYPE scx_attrname VALUE 'TEXT3',
        attr4 TYPE scx_attrname VALUE 'TEXT4',
      END OF task_ended,
      "! <p class="shorttext synchronized" lang="en">End time is mandatory for final status</p>
      BEGIN OF task_end_time,
        msgid TYPE symsgid VALUE 'ZTT_TASK',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE 'TEXT1',
        attr2 TYPE scx_attrname VALUE 'TEXT2',
        attr3 TYPE scx_attrname VALUE 'TEXT3',
        attr4 TYPE scx_attrname VALUE 'TEXT4',
      END OF task_end_time,
      "! <p class="shorttext synchronized" lang="en">Set final status for an end time</p>
      BEGIN OF task_status_end_time,
        msgid TYPE symsgid VALUE 'ZTT_TASK',
        msgno TYPE symsgno VALUE '004',
        attr1 TYPE scx_attrname VALUE 'TEXT1',
        attr2 TYPE scx_attrname VALUE 'TEXT2',
        attr3 TYPE scx_attrname VALUE 'TEXT3',
        attr4 TYPE scx_attrname VALUE 'TEXT4',
      END OF task_status_end_time,
      "! <p class="shorttext synchronized" lang="en">Transport Request &1 is still open</p>
      BEGIN OF transport_request_open,
        msgid TYPE symsgid VALUE 'ZTT_TASK',
        msgno TYPE symsgno VALUE '005',
        attr1 TYPE scx_attrname VALUE 'TEXT1',
        attr2 TYPE scx_attrname VALUE 'TEXT2',
        attr3 TYPE scx_attrname VALUE 'TEXT3',
        attr4 TYPE scx_attrname VALUE 'TEXT4',
      END OF transport_request_open.

    "! <p class="shorttext synchronized" lang="en">Text 1</p>
    DATA text1 TYPE sstring .
    "! <p class="shorttext synchronized" lang="en">Text 2</p>
    DATA text2 TYPE sstring .
    "! <p class="shorttext synchronized" lang="en">Text 3</p>
    DATA text3 TYPE sstring .
    "! <p class="shorttext synchronized" lang="en">Text 4</p>
    DATA text4 TYPE sstring .

    DATA attribute TYPE string.

    "! <p class="shorttext synchronized" lang="en">Collect exception to BOPF messages</p>
    "!
    "! @parameter exception | <p class="shorttext synchronized" lang="en">Exception</p>
    "! @parameter message_type | <p class="shorttext synchronized" lang="en">Message type</p>
    "! @parameter node | <p class="shorttext synchronized" lang="en">Node</p>
    "! @parameter key | <p class="shorttext synchronized" lang="en">Key</p>
    "! @parameter attribute | <p class="shorttext synchronized" lang="en">Attribute</p>
    "! @parameter lifetime | <p class="shorttext synchronized" lang="en">Lifetime</p>
    "! @parameter bo_messages | <p class="shorttext synchronized" lang="en">BOPF Messages</p>
    CLASS-METHODS collect_bo_message
      IMPORTING
        !exception    TYPE REF TO zcx_tt_management
        !message_type TYPE symsgty OPTIONAL
        !node         TYPE /bobf/obm_node_key OPTIONAL
        !key          TYPE /bobf/conf_key OPTIONAL
        !attribute    TYPE string OPTIONAL
        !lifetime     TYPE /bobf/cm_frw=>ty_message_lifetime DEFAULT /bobf/cm_frw=>co_lifetime_transition
      CHANGING
        !bo_messages  TYPE REF TO /bobf/if_frw_message.

    "! <p class="shorttext synchronized" lang="en">Raise exception from system variables</p>
    "!
    "! @raising zcx_tt_after_req_creation | <p class="shorttext synchronized" lang="en">Tasks Tracker management exc</p>
    CLASS-METHODS raise_syst
      IMPORTING
        !node_attribute TYPE string OPTIONAL
      RAISING
        zcx_tt_management.

    "! <p class="shorttext synchronized" lang="en">CONSTRUCTOR</p>
    "!
    "! @parameter message_key   | <p class="shorttext synchronized" lang="en">Text ID</p>
    "! @parameter previous | <p class="shorttext synchronized" lang="en">Previous exception</p>
    "! @parameter text_attr1    | <p class="shorttext synchronized" lang="en">Message Text 1</p>
    "! @parameter text_attr2    | <p class="shorttext synchronized" lang="en">Message Text 2</p>
    "! @parameter text_attr3    | <p class="shorttext synchronized" lang="en">Message Text 3</p>
    "! @parameter text_attr4    | <p class="shorttext synchronized" lang="en">Message Text 4</p>
    METHODS constructor
      IMPORTING
        !message_key    LIKE if_t100_message=>t100key OPTIONAL
        !previous       LIKE previous OPTIONAL
        !text_attr1     TYPE sstring OPTIONAL
        !text_attr2     TYPE sstring OPTIONAL
        !text_attr3     TYPE sstring OPTIONAL
        !text_attr4     TYPE sstring OPTIONAL
        !node_attribute TYPE string OPTIONAL.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcx_tt_management IMPLEMENTATION.


  METHOD collect_bo_message.

    IF exception IS NOT BOUND.
      RETURN.
    ENDIF.

    IF bo_messages IS NOT BOUND.
      bo_messages = /bobf/cl_frw_factory=>get_message( ).
    ENDIF.

    DATA(node_attribute) = COND #( WHEN attribute IS NOT INITIAL THEN attribute
                                                                 ELSE exception->attribute ).

    TRY.

        IF message_type IS INITIAL.
          CAST /bobf/cl_frw_durable_message( bo_messages ).
        ENDIF.

        bo_messages->add_message( is_msg       = VALUE symsg( msgty = COND #( WHEN message_type IS NOT INITIAL
                                                                                   THEN message_type
                                                                                   ELSE 'E' )
                                                              msgid = exception->if_t100_message~t100key-msgid
                                                              msgno = exception->if_t100_message~t100key-msgno
                                                              msgv1 = exception->text1
                                                              msgv2 = exception->text2
                                                              msgv3 = exception->text3
                                                              msgv4 = exception->text4 )
                                  iv_node      = node
                                  iv_key       = key
                                  iv_attribute = node_attribute
                                  iv_lifetime  = lifetime ).

      CATCH cx_sy_move_cast_error.
        bo_messages->add_exception( io_exception = exception
                                    iv_node      = node
                                    iv_key       = key
                                    iv_attribute = CONV #( node_attribute ) ).
    ENDTRY.

  ENDMETHOD.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    text1     = text_attr1.
    text2     = text_attr2.
    text3     = text_attr3.
    text4     = text_attr4.
    attribute = node_attribute.
    CLEAR textid.
    IF message_key IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = message_key.
    ENDIF.
  ENDMETHOD.


  METHOD raise_syst.

    RAISE EXCEPTION TYPE zcx_tt_management
      EXPORTING
        message_key    = VALUE scx_t100key( msgid = sy-msgid
                                       msgno = sy-msgno
                                       attr1 = 'TEXT1'
                                       attr2 = 'TEXT2'
                                       attr3 = 'TEXT3'
                                       attr4 = 'TEXT4' )
        text_attr1     = CONV #( sy-msgv1 )
        text_attr2     = CONV #( sy-msgv2 )
        text_attr3     = CONV #( sy-msgv3 )
        text_attr4     = CONV #( sy-msgv4 )
        node_attribute = node_attribute.

  ENDMETHOD.


ENDCLASS.
