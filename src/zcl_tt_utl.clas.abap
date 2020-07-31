"! <p class="shorttext synchronized" lang="en">Utilities</p>
CLASS zcl_tt_utl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    "! <p class="shorttext synchronized" lang="en">CLASS_CONSTRUCTOR</p>
    "!
    CLASS-METHODS class_constructor.

    "! <p class="shorttext synchronized" lang="en">Determine if task can be deleted</p>
    "! Only for special cases, normally use CANCEL status. <strong>Delete removes from database</strong>
    "! @parameter task | <p class="shorttext synchronized" lang="en">Task data</p>
    "! @parameter can | <p class="shorttext synchronized" lang="en">Can delete</p>
    CLASS-METHODS can_delete_task
      IMPORTING
        task       TYPE zstti_tasks OPTIONAL
      RETURNING
        VALUE(can) TYPE abap_bool.

  PROTECTED SECTION.

  PRIVATE SECTION.
    CLASS-DATA:
      settings TYPE REF TO zif_tt_settings.

    CLASS-METHODS generate_settings
      IMPORTING
        settings_class  TYPE seoclsname OPTIONAL
      RETURNING
        VALUE(instance) TYPE REF TO zif_tt_settings.

ENDCLASS.



CLASS ZCL_TT_UTL IMPLEMENTATION.


  METHOD can_delete_task.

    can = COND #( WHEN settings IS BOUND THEN settings->can_delete_task( task ) ELSE abap_false ).

  ENDMETHOD.


  METHOD class_constructor.

    TRY.
        DATA(settings_interface) = NEW cl_oo_interface( 'ZIF_TT_SETTINGS' ).
      CATCH cx_class_not_existent INTO DATA(lx_class).
        CLEAR: settings_interface.
    ENDTRY.

    DATA(settings_classes) = COND seo_relkeys( WHEN settings_interface IS BOUND
                                                   THEN settings_interface->get_implementing_classes( ) ).

    settings = COND #( WHEN line_exists( settings_classes[ 1 ] )
                           THEN generate_settings( settings_classes[ 1 ]-clsname ) ).

  ENDMETHOD.


  METHOD generate_settings.

    CREATE OBJECT instance TYPE (settings_class).

  ENDMETHOD.
ENDCLASS.
