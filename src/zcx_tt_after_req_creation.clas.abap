CLASS zcx_tt_after_req_creation DEFINITION
  PUBLIC
  INHERITING FROM zcx_tt_management
  CREATE PUBLIC .

  PUBLIC SECTION.
    "! <p class="shorttext synchronized" lang="en">Raise exception from system variables</p>
    "!
    "! @raising zcx_tt_after_req_creation | <p class="shorttext synchronized" lang="en">After request creation exc.</p>
    CLASS-METHODS raise_syst_after_req_creation
      RAISING
        zcx_tt_after_req_creation.

    "! <p class="shorttext synchronized" lang="en">CONSTRUCTOR</p>
    "!
    "! @parameter textid   | <p class="shorttext synchronized" lang="en">Text ID</p>
    "! @parameter text1    | <p class="shorttext synchronized" lang="en">Message Text 1</p>
    "! @parameter text2    | <p class="shorttext synchronized" lang="en">Message Text 2</p>
    "! @parameter text3    | <p class="shorttext synchronized" lang="en">Message Text 3</p>
    "! @parameter text4    | <p class="shorttext synchronized" lang="en">Message Text 4</p>
    "! @parameter previous | <p class="shorttext synchronized" lang="en">Previous exception</p>
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



CLASS zcx_tt_after_req_creation IMPLEMENTATION.


  METHOD raise_syst_after_req_creation.

    RAISE EXCEPTION TYPE zcx_tt_after_req_creation
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


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        message_key   = message_key
        text_attr1    = text_attr1
        text_attr2    = text_attr2
        text_attr3    = text_attr3
        text_attr4    = text_attr4
        previous = previous.
  ENDMETHOD.


ENDCLASS.
