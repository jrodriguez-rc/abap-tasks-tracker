"! <p class="shorttext synchronized" lang="en">Project Exception</p>
CLASS zcx_tt_management DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cm_frw
  CREATE PUBLIC.

  PUBLIC SECTION.

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
      END OF transport_request_open,
      "! <p class="shorttext synchronized" lang="en">Maximum progress is 100%</p>
      BEGIN OF progress_over_100,
        msgid TYPE symsgid VALUE 'ZTT_TASK',
        msgno TYPE symsgno VALUE '006',
        attr1 TYPE scx_attrname VALUE 'TEXT1',
        attr2 TYPE scx_attrname VALUE 'TEXT2',
        attr3 TYPE scx_attrname VALUE 'TEXT3',
        attr4 TYPE scx_attrname VALUE 'TEXT4',
      END OF progress_over_100,
      "! <p class="shorttext synchronized" lang="en">Set 100% progress for an ended task</p>
      BEGIN OF ended_task_progress_not_100,
        msgid TYPE symsgid VALUE 'ZTT_TASK',
        msgno TYPE symsgno VALUE '007',
        attr1 TYPE scx_attrname VALUE 'TEXT1',
        attr2 TYPE scx_attrname VALUE 'TEXT2',
        attr3 TYPE scx_attrname VALUE 'TEXT3',
        attr4 TYPE scx_attrname VALUE 'TEXT4',
      END OF ended_task_progress_not_100,
      "! <p class="shorttext synchronized" lang="en">Task is at 100% progress, please set end status</p>
      BEGIN OF progress_100_non_ended_task,
        msgid TYPE symsgid VALUE 'ZTT_TASK',
        msgno TYPE symsgno VALUE '008',
        attr1 TYPE scx_attrname VALUE 'TEXT1',
        attr2 TYPE scx_attrname VALUE 'TEXT2',
        attr3 TYPE scx_attrname VALUE 'TEXT3',
        attr4 TYPE scx_attrname VALUE 'TEXT4',
      END OF progress_100_non_ended_task,
      "! <p class="shorttext synchronized" lang="en">Task has been changed by another process, please refresh</p>
      BEGIN OF task_changed,
        msgid TYPE symsgid VALUE 'ZTT_TASK',
        msgno TYPE symsgno VALUE '009',
        attr1 TYPE scx_attrname VALUE 'TEXT1',
        attr2 TYPE scx_attrname VALUE 'TEXT2',
        attr3 TYPE scx_attrname VALUE 'TEXT3',
        attr4 TYPE scx_attrname VALUE 'TEXT4',
      END OF task_changed.

    "! <p class="shorttext synchronized" lang="en">Text 1</p>
    DATA text1 TYPE string .
    "! <p class="shorttext synchronized" lang="en">Text 2</p>
    DATA text2 TYPE string .
    "! <p class="shorttext synchronized" lang="en">Text 3</p>
    DATA text3 TYPE string .
    "! <p class="shorttext synchronized" lang="en">Text 4</p>
    DATA text4 TYPE string .

    "! <p class="shorttext synchronized" lang="en">Collect exception to BOPF messages</p>
    "!
    "! @parameter exception | <p class="shorttext synchronized" lang="en">Exception</p>
    "! @parameter message_type | <p class="shorttext synchronized" lang="en">Message type</p>
    "! @parameter bo_key | <p class="shorttext synchronized" lang="en">Business Object Key</p>
    "! @parameter node | <p class="shorttext synchronized" lang="en">Node</p>
    "! @parameter key | <p class="shorttext synchronized" lang="en">Key</p>
    "! @parameter attribute | <p class="shorttext synchronized" lang="en">Attribute</p>
    "! @parameter bo_messages | <p class="shorttext synchronized" lang="en">BOPF Messages</p>
    CLASS-METHODS collect_bo_message
      IMPORTING
        !textid       TYPE scx_t100key OPTIONAL
        !text1        TYPE string OPTIONAL
        !text2        TYPE string OPTIONAL
        !text3        TYPE string OPTIONAL
        !text4        TYPE string OPTIONAL
        !previous     TYPE REF TO cx_root OPTIONAL
        !message_type TYPE symsgty DEFAULT 'E'
        !symptom TYPE ty_message_symptom OPTIONAL
        !bo_key       TYPE /bobf/obm_bo_key OPTIONAL
        !node         TYPE /bobf/obm_node_key OPTIONAL
        !key          TYPE /bobf/conf_key OPTIONAL
        !act_key      TYPE /bobf/act_key OPTIONAL
        !val_key      TYPE /bobf/val_key OPTIONAL
        !attribute    TYPE string OPTIONAL
      CHANGING
        !bo_messages  TYPE REF TO /bobf/if_frw_message.

    "! <p class="shorttext synchronized" lang="en">Raise exception from system variables</p>
    "!
    "! @raising zcx_tt_after_req_creation | <p class="shorttext synchronized" lang="en">Tasks Tracker management exc</p>
    CLASS-METHODS raise_syst
      IMPORTING
        !node_attribute  TYPE string OPTIONAL
        !origin_location TYPE /bobf/s_frw_location OPTIONAL
      RAISING
        zcx_tt_management.

    "! <p class="shorttext synchronized" lang="en">CONSTRUCTOR</p>
    "!
    "! @parameter textid | <p class="shorttext synchronized" lang="en">Message Key</p>
    "! @parameter text1 | <p class="shorttext synchronized" lang="en">Text attribute 1</p>
    "! @parameter text2 | <p class="shorttext synchronized" lang="en">Text attribute 2</p>
    "! @parameter text3 | <p class="shorttext synchronized" lang="en">Text attribute 3</p>
    "! @parameter text4 | <p class="shorttext synchronized" lang="en">Text attribute 4</p>
    "! @parameter previous | <p class="shorttext synchronized" lang="en">Previous exception</p>
    "! @parameter severity | <p class="shorttext synchronized" lang="en">Severity</p>
    "! @parameter symptom | <p class="shorttext synchronized" lang="en">Symptom</p>
    "! @parameter lifetime | <p class="shorttext synchronized" lang="en">Lifetime</p>
    "! @parameter ms_origin_location | <p class="shorttext synchronized" lang="en">Origin location</p>
    "! @parameter mt_environment_location | <p class="shorttext synchronized" lang="en">Environment location</p>
    "! @parameter mv_act_key | <p class="shorttext synchronized" lang="en">Actual key</p>
    "! @parameter mv_assoc_key | <p class="shorttext synchronized" lang="en">Association key</p>
    "! @parameter mv_bopf_location | <p class="shorttext synchronized" lang="en">BOPF Location</p>
    "! @parameter mv_det_key | <p class="shorttext synchronized" lang="en">Det. Key</p>
    "! @parameter mv_query_key | <p class="shorttext synchronized" lang="en">Query Key</p>
    "! @parameter mv_val_key | <p class="shorttext synchronized" lang="en">Value key</p>
    METHODS constructor
      IMPORTING
        !textid                  LIKE if_t100_message=>t100key OPTIONAL
        !text1                   TYPE string OPTIONAL
        !text2                   TYPE string OPTIONAL
        !text3                   TYPE string OPTIONAL
        !text4                   TYPE string OPTIONAL
        !previous                LIKE previous OPTIONAL
        !severity                TYPE ty_message_severity OPTIONAL
        !symptom                 TYPE ty_message_symptom OPTIONAL
        !lifetime                TYPE ty_message_lifetime DEFAULT co_lifetime_state
        !ms_origin_location      TYPE /bobf/s_frw_location OPTIONAL
        !mt_environment_location TYPE /bobf/t_frw_location OPTIONAL
        !mv_act_key              TYPE /bobf/act_key OPTIONAL
        !mv_assoc_key            TYPE /bobf/obm_assoc_key OPTIONAL
        !mv_bopf_location        TYPE /bobf/conf_key OPTIONAL
        !mv_det_key              TYPE /bobf/det_key OPTIONAL
        !mv_query_key            TYPE /bobf/obm_query_key OPTIONAL
        !mv_val_key              TYPE /bobf/val_key OPTIONAL.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcx_tt_management IMPLEMENTATION.


  METHOD collect_bo_message.

    DATA(exception) = NEW zcx_tt_management( textid              = textid
                                              text1              = text1
                                              text2              = text2
                                              text3              = text3
                                              text4              = text4
                                              previous           = previous
                                              severity           = message_type
                                              symptom            = symptom
                                              ms_origin_location =
                                                    VALUE #( bo_key     = bo_key
                                                             node_key   = node
                                                             key        = key
                                                             attributes = COND #( WHEN attribute IS NOT INITIAL
                                                                                      THEN VALUE #( ( attribute ) ) ) )
                                              mv_act_key         = act_key
                                              mv_assoc_key       = val_key
                                              mv_val_key         = val_key ).

    IF bo_messages IS NOT BOUND.
      bo_messages = /bobf/cl_frw_factory=>get_message( ).
    ENDIF.
    bo_messages->add_cm( exception ).

  ENDMETHOD.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( textid                  = textid
                        previous                = previous
                        severity                = severity
                        symptom                 = symptom
                        lifetime                = lifetime
                        ms_origin_location      = ms_origin_location
                        mt_environment_location = mt_environment_location
                        mv_act_key              = mv_act_key
                        mv_assoc_key            = mv_assoc_key
                        mv_bopf_location        = mv_bopf_location
                        mv_det_key              = mv_det_key
                        mv_query_key            = mv_query_key
                        mv_val_key              = mv_val_key ).

    me->text1 = text1.
    me->text2 = text2.
    me->text3 = text3.
    me->text4 = text4.

  ENDMETHOD.


  METHOD raise_syst.

    RAISE EXCEPTION TYPE zcx_tt_management
      EXPORTING
        textid             = VALUE scx_t100key( msgid = sy-msgid
                                                msgno = sy-msgno
                                                attr1 = 'TEXT1'
                                                attr2 = 'TEXT2'
                                                attr3 = 'TEXT3'
                                                attr4 = 'TEXT4' )
        text1              = CONV #( sy-msgv1 )
        text2              = CONV #( sy-msgv2 )
        text3              = CONV #( sy-msgv3 )
        text4              = CONV #( sy-msgv4 )
        ms_origin_location = origin_location.

  ENDMETHOD.


ENDCLASS.
