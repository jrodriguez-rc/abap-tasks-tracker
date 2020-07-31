"! <p class="shorttext synchronized" lang="en">Settings</p>
INTERFACE zif_tt_settings
  PUBLIC.

  "! <p class="shorttext synchronized" lang="en">Determine if task can be deleted</p>
  "! Only for special cases, normally use CANCEL status. <strong>Delete removes from database</strong>
  "! @parameter task | <p class="shorttext synchronized" lang="en">Task data</p>
  "! @parameter can | <p class="shorttext synchronized" lang="en">Can delete</p>
  METHODS can_delete_task
    IMPORTING
      task       TYPE zstti_tasks
    RETURNING
      VALUE(can) TYPE abap_bool.

ENDINTERFACE.
