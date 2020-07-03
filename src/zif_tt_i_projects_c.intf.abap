"! <p class="shorttext synchronized" lang="en">Generated Constants Interface</p>
INTERFACE zif_tt_i_projects_c
  PUBLIC .


  INTERFACES /bobf/if_lib_constants .

  CONSTANTS:
    "! <p class="shorttext synchronized" lang="en">Actions</p>
    BEGIN OF sc_action,
      BEGIN OF ztt_i_projects,
        create_ztt_i_projects   TYPE /bobf/act_key VALUE '0250E0674B721EEAAF91101B9BA7FF3B',
        delete_ztt_i_projects   TYPE /bobf/act_key VALUE '0250E0674B721EEAAF91101B9BA87F3B',
        lock_ztt_i_projects     TYPE /bobf/act_key VALUE '0250E0674B721EEAAF91101B9BA73F3B',
        save_ztt_i_projects     TYPE /bobf/act_key VALUE '0250E0674B721EEAAF91101B9BA8FF3B',
        unlock_ztt_i_projects   TYPE /bobf/act_key VALUE '0250E0674B721EEAAF91101B9BA77F3B',
        update_ztt_i_projects   TYPE /bobf/act_key VALUE '0250E0674B721EEAAF91101B9BA83F3B',
        validate_ztt_i_projects TYPE /bobf/act_key VALUE '0250E0674B721EEAAF91101B9BA8BF3B',
      END OF ztt_i_projects,
    END OF sc_action .
  CONSTANTS:
    "! <p class="shorttext synchronized" lang="en">Action Parameter Attributes</p>
    BEGIN OF sc_action_attribute,
      BEGIN OF ztt_i_projects,
        BEGIN OF lock_ztt_i_projects,
          generic               TYPE string VALUE 'GENERIC',
          edit_mode             TYPE string VALUE 'EDIT_MODE',
          all_none              TYPE string VALUE 'ALL_NONE',
          scope                 TYPE string VALUE 'SCOPE',
          force_invalidation    TYPE string VALUE 'FORCE_INVALIDATION',
          lock_parameter_buffer TYPE string VALUE 'LOCK_PARAMETER_BUFFER',
        END OF lock_ztt_i_projects,
        BEGIN OF unlock_ztt_i_projects,
          generic               TYPE string VALUE 'GENERIC',
          edit_mode             TYPE string VALUE 'EDIT_MODE',
          all_none              TYPE string VALUE 'ALL_NONE',
          scope                 TYPE string VALUE 'SCOPE',
          force_invalidation    TYPE string VALUE 'FORCE_INVALIDATION',
          lock_parameter_buffer TYPE string VALUE 'LOCK_PARAMETER_BUFFER',
        END OF unlock_ztt_i_projects,
      END OF ztt_i_projects,
    END OF sc_action_attribute .
  CONSTANTS:
    "! <p class="shorttext synchronized" lang="en">Alternative Keys</p>
    BEGIN OF sc_alternative_key,
      BEGIN OF ztt_i_projects,
        db_key TYPE /bobf/obm_altkey_key VALUE '0250E0674B721EEAAF91101B9BA9DF3B',
      END OF ztt_i_projects,
    END OF sc_alternative_key .
  CONSTANTS:
    "! <p class="shorttext synchronized" lang="en">Associations</p>
    BEGIN OF sc_association,
      BEGIN OF ztt_i_projects,
        lock     TYPE /bobf/obm_assoc_key VALUE '0250E0674B721EEAAF91101B9BA71F3B',
        message  TYPE /bobf/obm_assoc_key VALUE '0250E0674B721EEAAF91101B9BA6DF3B',
        property TYPE /bobf/obm_assoc_key VALUE '0250E0674B721EEAAF91101B9BA7DF3B',
      END OF ztt_i_projects,
      BEGIN OF ztt_i_projects_lock,
        to_parent TYPE /bobf/obm_assoc_key VALUE '0250E0674B721EEAAF91101B9BA95F3B',
      END OF ztt_i_projects_lock,
      BEGIN OF ztt_i_projects_message,
        to_parent TYPE /bobf/obm_assoc_key VALUE '0250E0674B721EEAAF91101B9BA93F3B',
      END OF ztt_i_projects_message,
      BEGIN OF ztt_i_projects_property,
        to_parent TYPE /bobf/obm_assoc_key VALUE '0250E0674B721EEAAF91101B9BA97F3B',
      END OF ztt_i_projects_property,
    END OF sc_association .
  CONSTANTS:
    "! <p class="shorttext synchronized" lang="en">Association Parameter Attributes</p>
    BEGIN OF sc_association_attribute,
      BEGIN OF ztt_i_projects,
        BEGIN OF property,
          all_node_property              TYPE string VALUE 'ALL_NODE_PROPERTY',
          all_node_attribute_property    TYPE string VALUE 'ALL_NODE_ATTRIBUTE_PROPERTY',
          all_association_property       TYPE string VALUE 'ALL_ASSOCIATION_PROPERTY',
          all_association_attribute_prop TYPE string VALUE 'ALL_ASSOCIATION_ATTRIBUTE_PROP',
          all_action_property            TYPE string VALUE 'ALL_ACTION_PROPERTY',
          all_action_attribute_property  TYPE string VALUE 'ALL_ACTION_ATTRIBUTE_PROPERTY',
          all_query_property             TYPE string VALUE 'ALL_QUERY_PROPERTY',
          all_query_attribute_property   TYPE string VALUE 'ALL_QUERY_ATTRIBUTE_PROPERTY',
          all_subtree_property           TYPE string VALUE 'ALL_SUBTREE_PROPERTY',
        END OF property,
      END OF ztt_i_projects,
    END OF sc_association_attribute .
  CONSTANTS:
    "! <p class="shorttext synchronized" lang="en">#GENERATED#</p>
    sc_bo_key  TYPE /bobf/obm_bo_key VALUE '0250E0674B721EEAAF91101B9BA63F3B' .
  CONSTANTS:
    "! <p class="shorttext synchronized" lang="en">#GENERATED#</p>
    sc_bo_name TYPE /bobf/obm_name VALUE 'ZTT_I_PROJECTS' .
  CONSTANTS:
    "! <p class="shorttext synchronized" lang="en">Determinations</p>
    BEGIN OF sc_determination,
      BEGIN OF ztt_i_projects,
        action_and_field_control TYPE /bobf/det_key VALUE '0250E0674B721EEAAF91101B9BA9FF3B',
        admin_data               TYPE /bobf/det_key VALUE '0250E0674B721EEAAF9114FA8B261F3C',
      END OF ztt_i_projects,
    END OF sc_determination .
  CONSTANTS:
    "! <p class="shorttext synchronized" lang="en">Groups</p>
    BEGIN OF sc_group,
      ztt_i_projects TYPE /bobf/obm_group_key VALUE '0250E0674B721EEAAF911C180753DF40',
    END OF sc_group .
  CONSTANTS:
    sc_model_version TYPE /bobf/conf_version VALUE '00000' .
  CONSTANTS:
    "! <p class="shorttext synchronized" lang="en">Nodes</p>
    BEGIN OF sc_node,
      ztt_i_projects          TYPE /bobf/obm_node_key VALUE '0250E0674B721EEAAF91101B9BA67F3B',
      ztt_i_projects_lock     TYPE /bobf/obm_node_key VALUE '0250E0674B721EEAAF91101B9BA6FF3B',
      ztt_i_projects_message  TYPE /bobf/obm_node_key VALUE '0250E0674B721EEAAF91101B9BA6BF3B',
      ztt_i_projects_property TYPE /bobf/obm_node_key VALUE '0250E0674B721EEAAF91101B9BA7BF3B',
    END OF sc_node .
  CONSTANTS:
    "! <p class="shorttext synchronized" lang="en">Node Attributes</p>
    BEGIN OF sc_node_attribute,
      BEGIN OF ztt_i_projects,
        node_data      TYPE string VALUE 'NODE_DATA',
        code           TYPE string VALUE 'CODE',
        name           TYPE string VALUE 'NAME',
        started_on     TYPE string VALUE 'STARTED_ON',
        ended_on       TYPE string VALUE 'ENDED_ON',
        tr_target      TYPE string VALUE 'TR_TARGET',
        cts_project    TYPE string VALUE 'CTS_PROJECT',
        admin_data     TYPE string VALUE 'ADMIN_DATA',
        crea_date_time TYPE string VALUE 'CREA_DATE_TIME',
        crea_uname     TYPE string VALUE 'CREA_UNAME',
        lchg_date_time TYPE string VALUE 'LCHG_DATE_TIME',
        lchg_uname     TYPE string VALUE 'LCHG_UNAME',
      END OF ztt_i_projects,
    END OF sc_node_attribute .
  CONSTANTS:
    "! <p class="shorttext synchronized" lang="en">Node Categories</p>
    BEGIN OF sc_node_category,
      BEGIN OF ztt_i_projects,
        root TYPE /bobf/obm_node_cat_key VALUE '0250E0674B721EEAAF91101B9BA69F3B',
      END OF ztt_i_projects,
    END OF sc_node_category .
  CONSTANTS:
    "! <p class="shorttext synchronized" lang="en">Validations</p>
    BEGIN OF sc_validation,
      BEGIN OF ztt_i_projects,
        project_code TYPE /bobf/val_key VALUE '0250E0674B721EEAAF911BC1D8741F40',
      END OF ztt_i_projects,
    END OF sc_validation .
ENDINTERFACE.
