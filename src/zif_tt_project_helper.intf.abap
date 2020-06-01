"! <p class="shorttext synchronized" lang="en">Projects Helper</p>
INTERFACE zif_tt_project_helper
  PUBLIC.

  METHODS check_start_project
    IMPORTING
      !dates   TYPE zstt_a_start_project
      !project TYPE zstti_projects
    RAISING
      zcx_project.

ENDINTERFACE.
