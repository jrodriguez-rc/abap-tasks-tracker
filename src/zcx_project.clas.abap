CLASS zcx_project DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .

    "! <p class="shorttext synchronized" lang="en">Text 1</p>
    DATA text1 TYPE sstring .
    "! <p class="shorttext synchronized" lang="en">Text 2</p>
    DATA text2 TYPE sstring .
    "! <p class="shorttext synchronized" lang="en">Text 3</p>
    DATA text3 TYPE sstring .
    "! <p class="shorttext synchronized" lang="en">Text 4</p>
    DATA text4 TYPE sstring .

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



CLASS zcx_project IMPLEMENTATION.


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


ENDCLASS.
