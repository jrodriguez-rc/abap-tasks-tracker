CLASS zcx_tt_management DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .

    CONSTANTS:
      BEGIN OF project_mandatory,
        msgid TYPE symsgid VALUE 'ZTT_TASK',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'TEXT1',
        attr2 TYPE scx_attrname VALUE 'TEXT2',
        attr3 TYPE scx_attrname VALUE 'TEXT3',
        attr4 TYPE scx_attrname VALUE 'TEXT4',
      END OF project_mandatory.

    "! <p class="shorttext synchronized" lang="en">Text 1</p>
    DATA text1 TYPE sstring .
    "! <p class="shorttext synchronized" lang="en">Text 2</p>
    DATA text2 TYPE sstring .
    "! <p class="shorttext synchronized" lang="en">Text 3</p>
    DATA text3 TYPE sstring .
    "! <p class="shorttext synchronized" lang="en">Text 4</p>
    DATA text4 TYPE sstring .

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

    CLASS-METHODS raise_syst
      RAISING
        zcx_tt_management.

    METHODS constructor
      IMPORTING
        !message_key LIKE if_t100_message=>t100key OPTIONAL
        !previous    LIKE previous OPTIONAL
        !text_attr1  TYPE sstring OPTIONAL
        !text_attr2  TYPE sstring OPTIONAL
        !text_attr3  TYPE sstring OPTIONAL
        !text_attr4  TYPE sstring OPTIONAL.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcx_tt_management IMPLEMENTATION.


  METHOD collect_bo_message.

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
                                  iv_attribute = attribute
                                  iv_lifetime  = lifetime ).

      CATCH cx_sy_move_cast_error.
        bo_messages->add_exception( io_exception = exception
                                    iv_node      = node
                                    iv_key       = key
                                    iv_attribute = CONV #( attribute ) ).
    ENDTRY.

  ENDMETHOD.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    text1 = text_attr1.
    text2 = text_attr2.
    text3 = text_attr3.
    text4 = text_attr4.
    CLEAR textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = message_key.
    ENDIF.
  ENDMETHOD.


  METHOD raise_syst.

    RAISE EXCEPTION TYPE zcx_tt_management
      EXPORTING
        message_key = VALUE scx_t100key( msgid = sy-msgid
                                    msgno = sy-msgno
                                    attr1 = 'TEXT1'
                                    attr2 = 'TEXT2'
                                    attr3 = 'TEXT3'
                                    attr4 = 'TEXT4' )
        text_attr1  = CONV #( sy-msgv1 )
        text_attr2  = CONV #( sy-msgv2 )
        text_attr3  = CONV #( sy-msgv3 )
        text_attr4  = CONV #( sy-msgv4 ).

  ENDMETHOD.


ENDCLASS.
