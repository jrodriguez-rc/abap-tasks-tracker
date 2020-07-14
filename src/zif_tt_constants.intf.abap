"! <p class="shorttext synchronized" lang="en">Tasks Tracker Constants</p>
INTERFACE zif_tt_constants
  PUBLIC.

  CONSTANTS:
    BEGIN OF gc_status,
      backlog          TYPE ztt_status VALUE '' ##NO_TEXT,
      open             TYPE ztt_status VALUE 'OPEN' ##NO_TEXT,
      work_in_progress TYPE ztt_status VALUE 'WIP' ##NO_TEXT,
      testing          TYPE ztt_status VALUE 'TESTING' ##NO_TEXT,
      ended            TYPE ztt_status VALUE 'ENDED' ##NO_TEXT,
      locked           TYPE ztt_status VALUE 'LOCKED' ##NO_TEXT,
      cancelled        TYPE ztt_status VALUE 'CANCEL' ##NO_TEXT,
    END OF gc_status.

ENDINTERFACE.
