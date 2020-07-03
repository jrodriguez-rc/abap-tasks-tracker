"! <p class="shorttext synchronized" lang="en">Generated Constants Interface</p>
interface ZIF_TT_I_TASKS_C
  public .


  interfaces /BOBF/IF_LIB_CONSTANTS .

  constants:
    "! <p class="shorttext synchronized" lang="en">Actions</p>
    BEGIN OF SC_ACTION,
      BEGIN OF ZTT_I_TASKS,
 CREATE_TR_CU                   TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF78D636AE37442',
 CREATE_TR_WB                   TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF78D636AE35442',
 CREATE_ZTT_I_TASKS             TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF65901B032B3C9',
 DELETE_ZTT_I_TASKS             TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF65901B03333C9',
 LOCK_ZTT_I_TASKS               TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF65901B031F3C9',
 SAVE_ZTT_I_TASKS               TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF65901B033B3C9',
 UNLOCK_ZTT_I_TASKS             TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF65901B03233C9',
 UPDATE_ZTT_I_TASKS             TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF65901B032F3C9',
 VALIDATE_ZTT_I_TASKS           TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF65901B03373C9',
      END OF ZTT_I_TASKS,
      BEGIN OF ZTT_I_TASK_COMMENTS,
 CREATE_ZTT_I_TASK_COMMENTS     TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF66F0E66A153D1',
 DELETE_ZTT_I_TASK_COMMENTS     TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF66F0E66A1D3D1',
 SAVE_ZTT_I_TASK_COMMENTS       TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF66F0E66A253D1',
 UPDATE_ZTT_I_TASK_COMMENTS     TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF66F0E66A193D1',
 VALIDATE_ZTT_I_TASK_COMMENTS   TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF66F0E66A213D1',
      END OF ZTT_I_TASK_COMMENTS,
      BEGIN OF ZTT_I_TASK_TIME_LOG,
 CREATE_ZTT_I_TASK_TIME_LOG     TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF6611C0E51F3CB',
 DELETE_ZTT_I_TASK_TIME_LOG     TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF6611C0E5273CB',
 SAVE_ZTT_I_TASK_TIME_LOG       TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF6611C0E52F3CB',
 UPDATE_ZTT_I_TASK_TIME_LOG     TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF6611C0E5233CB',
 VALIDATE_ZTT_I_TASK_TIME_LOG   TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF6611C0E52B3CB',
      END OF ZTT_I_TASK_TIME_LOG,
      BEGIN OF ZTT_I_TASK_TRANSPORT_REQUEST,
 CREATE_ZTT_I_TASK_TRANSPORT_RE TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF67E42345FD3DA',
 DELETE_ZTT_I_TASK_TRANSPORT_RE TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF67E42346053DA',
 SAVE_ZTT_I_TASK_TRANSPORT_REQU TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF67E423460D3DA',
 UPDATE_ZTT_I_TASK_TRANSPORT_RE TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF67E42346013DA',
 VALIDATE_ZTT_I_TASK_TRANSPORT_ TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAEF67E42346093DA',
      END OF ZTT_I_TASK_TRANSPORT_REQUEST,
    END OF SC_ACTION .
  constants:
    "! <p class="shorttext synchronized" lang="en">Action Parameter Attributes</p>
    BEGIN OF SC_ACTION_ATTRIBUTE,
        BEGIN OF ZTT_I_TASKS,
        BEGIN OF LOCK_ZTT_I_TASKS,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
        END OF LOCK_ZTT_I_TASKS,
        BEGIN OF UNLOCK_ZTT_I_TASKS,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
        END OF UNLOCK_ZTT_I_TASKS,
      END OF ZTT_I_TASKS,
    END OF SC_ACTION_ATTRIBUTE .
  constants:
    "! <p class="shorttext synchronized" lang="en">Alternative Keys</p>
    BEGIN OF SC_ALTERNATIVE_KEY,
      BEGIN OF ZTT_I_TASKS,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '0250E0674B721EEAAEF65901B03493C9',
 PROJECT_CODE                   TYPE /BOBF/OBM_ALTKEY_KEY VALUE '0250E0674B721EEAAEF7093300351410',
      END OF ZTT_I_TASKS,
      BEGIN OF ZTT_I_TASK_COMMENTS,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '0250E0674B721EEAAEF66F0E669BD3D1',
 PARENT_KEY                     TYPE /BOBF/OBM_ALTKEY_KEY VALUE '0250E0674B721EEAAEF66F0E669BF3D1',
      END OF ZTT_I_TASK_COMMENTS,
      BEGIN OF ZTT_I_TASK_TIME_LOG,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '0250E0674B721EEAAEF6611C0E4BB3CB',
 PARENT_KEY                     TYPE /BOBF/OBM_ALTKEY_KEY VALUE '0250E0674B721EEAAEF6611C0E4BD3CB',
      END OF ZTT_I_TASK_TIME_LOG,
      BEGIN OF ZTT_I_TASK_TRANSPORT_REQUEST,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '0250E0674B721EEAAEF67E423459F3DA',
 PARENT_KEY                     TYPE /BOBF/OBM_ALTKEY_KEY VALUE '0250E0674B721EEAAEF67E42345A13DA',
      END OF ZTT_I_TASK_TRANSPORT_REQUEST,
    END OF SC_ALTERNATIVE_KEY .
  constants:
    "! <p class="shorttext synchronized" lang="en">Associations</p>
    BEGIN OF SC_ASSOCIATION,
      BEGIN OF ZTT_I_TASKS,
 LOCK                           TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF65901B031D3C9',
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF65901B03193C9',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF65901B03293C9',
 _COMMENTS                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF66F0E66A093D1',
 _TIMELOG                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF6611C0E5133CB',
 _TRANSPORTREQUESTS             TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF67E42345F13DA',
      END OF ZTT_I_TASKS,
      BEGIN OF ZTT_I_TASKS_LOCK,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF65901B03413C9',
      END OF ZTT_I_TASKS_LOCK,
      BEGIN OF ZTT_I_TASKS_MESSAGE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF65901B033F3C9',
      END OF ZTT_I_TASKS_MESSAGE,
      BEGIN OF ZTT_I_TASKS_PROPERTY,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF65901B03433C9',
      END OF ZTT_I_TASKS_PROPERTY,
      BEGIN OF ZTT_I_TASK_COMMENTS,
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF66F0E66A0F3D1',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF66F0E66A133D1',
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF66F0E66A293D1',
 TO_ROOT                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF66F0E66A2B3D1',
      END OF ZTT_I_TASK_COMMENTS,
      BEGIN OF ZTT_I_TASK_COMMENTS_MESSAGE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF66F0E66A2D3D1',
      END OF ZTT_I_TASK_COMMENTS_MESSAGE,
      BEGIN OF ZTT_I_TASK_COMMENTS_PROPERTY,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF66F0E66A2F3D1',
      END OF ZTT_I_TASK_COMMENTS_PROPERTY,
      BEGIN OF ZTT_I_TASK_TIME_LOG,
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF6611C0E5193CB',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF6611C0E51D3CB',
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF6611C0E5333CB',
 TO_ROOT                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF6611C0E5353CB',
      END OF ZTT_I_TASK_TIME_LOG,
      BEGIN OF ZTT_I_TASK_TIME_LOG_MESSAGE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF6611C0E5373CB',
      END OF ZTT_I_TASK_TIME_LOG_MESSAGE,
      BEGIN OF ZTT_I_TASK_TIME_LOG_PROPERTY,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF6611C0E5393CB',
      END OF ZTT_I_TASK_TIME_LOG_PROPERTY,
      BEGIN OF ZTT_I_TASK_TRANSPORT_REQUEST,
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF67E42345F73DA',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF67E42345FB3DA',
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF67E42346113DA',
 TO_ROOT                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF67E42346133DA',
      END OF ZTT_I_TASK_TRANSPORT_REQUEST,
      BEGIN OF ZTT_I_TASK_TRANSPORT_REQUEST_M,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF67E42346153DA',
      END OF ZTT_I_TASK_TRANSPORT_REQUEST_M,
      BEGIN OF ZTT_I_TASK_TRANSPORT_REQUEST_P,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAEF67E42346173DA',
      END OF ZTT_I_TASK_TRANSPORT_REQUEST_P,
    END OF SC_ASSOCIATION .
  constants:
    "! <p class="shorttext synchronized" lang="en">Association Parameter Attributes</p>
    BEGIN OF SC_ASSOCIATION_ATTRIBUTE,
      BEGIN OF ZTT_I_TASKS,
        BEGIN OF PROPERTY,
 ALL_NODE_PROPERTY              TYPE STRING VALUE 'ALL_NODE_PROPERTY',
 ALL_NODE_ATTRIBUTE_PROPERTY    TYPE STRING VALUE 'ALL_NODE_ATTRIBUTE_PROPERTY',
 ALL_ASSOCIATION_PROPERTY       TYPE STRING VALUE 'ALL_ASSOCIATION_PROPERTY',
 ALL_ASSOCIATION_ATTRIBUTE_PROP TYPE STRING VALUE 'ALL_ASSOCIATION_ATTRIBUTE_PROP',
 ALL_ACTION_PROPERTY            TYPE STRING VALUE 'ALL_ACTION_PROPERTY',
 ALL_ACTION_ATTRIBUTE_PROPERTY  TYPE STRING VALUE 'ALL_ACTION_ATTRIBUTE_PROPERTY',
 ALL_QUERY_PROPERTY             TYPE STRING VALUE 'ALL_QUERY_PROPERTY',
 ALL_QUERY_ATTRIBUTE_PROPERTY   TYPE STRING VALUE 'ALL_QUERY_ATTRIBUTE_PROPERTY',
 ALL_SUBTREE_PROPERTY           TYPE STRING VALUE 'ALL_SUBTREE_PROPERTY',
        END OF PROPERTY,
      END OF ZTT_I_TASKS,
      BEGIN OF ZTT_I_TASK_COMMENTS,
        BEGIN OF PROPERTY,
 ALL_NODE_PROPERTY              TYPE STRING VALUE 'ALL_NODE_PROPERTY',
 ALL_NODE_ATTRIBUTE_PROPERTY    TYPE STRING VALUE 'ALL_NODE_ATTRIBUTE_PROPERTY',
 ALL_ASSOCIATION_PROPERTY       TYPE STRING VALUE 'ALL_ASSOCIATION_PROPERTY',
 ALL_ASSOCIATION_ATTRIBUTE_PROP TYPE STRING VALUE 'ALL_ASSOCIATION_ATTRIBUTE_PROP',
 ALL_ACTION_PROPERTY            TYPE STRING VALUE 'ALL_ACTION_PROPERTY',
 ALL_ACTION_ATTRIBUTE_PROPERTY  TYPE STRING VALUE 'ALL_ACTION_ATTRIBUTE_PROPERTY',
 ALL_QUERY_PROPERTY             TYPE STRING VALUE 'ALL_QUERY_PROPERTY',
 ALL_QUERY_ATTRIBUTE_PROPERTY   TYPE STRING VALUE 'ALL_QUERY_ATTRIBUTE_PROPERTY',
 ALL_SUBTREE_PROPERTY           TYPE STRING VALUE 'ALL_SUBTREE_PROPERTY',
        END OF PROPERTY,
      END OF ZTT_I_TASK_COMMENTS,
      BEGIN OF ZTT_I_TASK_TIME_LOG,
        BEGIN OF PROPERTY,
 ALL_NODE_PROPERTY              TYPE STRING VALUE 'ALL_NODE_PROPERTY',
 ALL_NODE_ATTRIBUTE_PROPERTY    TYPE STRING VALUE 'ALL_NODE_ATTRIBUTE_PROPERTY',
 ALL_ASSOCIATION_PROPERTY       TYPE STRING VALUE 'ALL_ASSOCIATION_PROPERTY',
 ALL_ASSOCIATION_ATTRIBUTE_PROP TYPE STRING VALUE 'ALL_ASSOCIATION_ATTRIBUTE_PROP',
 ALL_ACTION_PROPERTY            TYPE STRING VALUE 'ALL_ACTION_PROPERTY',
 ALL_ACTION_ATTRIBUTE_PROPERTY  TYPE STRING VALUE 'ALL_ACTION_ATTRIBUTE_PROPERTY',
 ALL_QUERY_PROPERTY             TYPE STRING VALUE 'ALL_QUERY_PROPERTY',
 ALL_QUERY_ATTRIBUTE_PROPERTY   TYPE STRING VALUE 'ALL_QUERY_ATTRIBUTE_PROPERTY',
 ALL_SUBTREE_PROPERTY           TYPE STRING VALUE 'ALL_SUBTREE_PROPERTY',
        END OF PROPERTY,
      END OF ZTT_I_TASK_TIME_LOG,
      BEGIN OF ZTT_I_TASK_TRANSPORT_REQUEST,
        BEGIN OF PROPERTY,
 ALL_NODE_PROPERTY              TYPE STRING VALUE 'ALL_NODE_PROPERTY',
 ALL_NODE_ATTRIBUTE_PROPERTY    TYPE STRING VALUE 'ALL_NODE_ATTRIBUTE_PROPERTY',
 ALL_ASSOCIATION_PROPERTY       TYPE STRING VALUE 'ALL_ASSOCIATION_PROPERTY',
 ALL_ASSOCIATION_ATTRIBUTE_PROP TYPE STRING VALUE 'ALL_ASSOCIATION_ATTRIBUTE_PROP',
 ALL_ACTION_PROPERTY            TYPE STRING VALUE 'ALL_ACTION_PROPERTY',
 ALL_ACTION_ATTRIBUTE_PROPERTY  TYPE STRING VALUE 'ALL_ACTION_ATTRIBUTE_PROPERTY',
 ALL_QUERY_PROPERTY             TYPE STRING VALUE 'ALL_QUERY_PROPERTY',
 ALL_QUERY_ATTRIBUTE_PROPERTY   TYPE STRING VALUE 'ALL_QUERY_ATTRIBUTE_PROPERTY',
 ALL_SUBTREE_PROPERTY           TYPE STRING VALUE 'ALL_SUBTREE_PROPERTY',
        END OF PROPERTY,
      END OF ZTT_I_TASK_TRANSPORT_REQUEST,
    END OF SC_ASSOCIATION_ATTRIBUTE .
  constants:
    "! <p class="shorttext synchronized" lang="en">#GENERATED#</p>
    SC_BO_KEY  TYPE /BOBF/OBM_BO_KEY VALUE '0250E0674B721EEAAEF65901B030F3C9' .
  constants:
    "! <p class="shorttext synchronized" lang="en">#GENERATED#</p>
    SC_BO_NAME TYPE /BOBF/OBM_NAME VALUE 'ZTT_I_TASKS' .
  constants:
    "! <p class="shorttext synchronized" lang="en">Determinations</p>
    BEGIN OF SC_DETERMINATION,
      BEGIN OF ZTT_I_TASKS,
 ACTION_AND_FIELD_CONTROL       TYPE /BOBF/DET_KEY VALUE '0250E0674B721EEAAF8DC7727689FDD4',
 ADMIN_DATA                     TYPE /BOBF/DET_KEY VALUE '0250E0674B721EEAAEF7920D8297B443',
 AT_CREATION                    TYPE /BOBF/DET_KEY VALUE '0250E0674B721EEAAEF7920D82979443',
      END OF ZTT_I_TASKS,
      BEGIN OF ZTT_I_TASK_COMMENTS,
 ADMIN_DATA                     TYPE /BOBF/DET_KEY VALUE '0250E0674B721EEAAEF798B0BEC5B445',
 AT_CREATION                    TYPE /BOBF/DET_KEY VALUE '0250E0674B721EEAAEF798B0BEC59445',
      END OF ZTT_I_TASK_COMMENTS,
      BEGIN OF ZTT_I_TASK_TIME_LOG,
 ADMIN_DATA                     TYPE /BOBF/DET_KEY VALUE '0250E0674B721EEAAEF79F492241F447',
 AT_CREATION                    TYPE /BOBF/DET_KEY VALUE '0250E0674B721EEAAEF79F492241D447',
 TOTAL_HOURS                    TYPE /BOBF/DET_KEY VALUE '0250E0674B721EEAAF8F8A5833DF7E95',
      END OF ZTT_I_TASK_TIME_LOG,
      BEGIN OF ZTT_I_TASK_TRANSPORT_REQUEST,
 ACTION_AND_FIELD_CONTROL       TYPE /BOBF/DET_KEY VALUE '0250E0674B721EDAAFA5830976AE07F7',
 ADMIN_DATA                     TYPE /BOBF/DET_KEY VALUE '0250E0674B721EEAAEF79F4922421447',
 AT_CREATION                    TYPE /BOBF/DET_KEY VALUE '0250E0674B721EEAAEF79F4922423447',
      END OF ZTT_I_TASK_TRANSPORT_REQUEST,
    END OF SC_DETERMINATION .
  constants:
    "! <p class="shorttext synchronized" lang="en">Groups</p>
    BEGIN OF SC_GROUP,
 ZTT_I_TASKS                    TYPE /BOBF/OBM_GROUP_KEY VALUE '0250E0674B721EEAAEF7A4B3D4EEB44C',
    END OF SC_GROUP .
  constants:
    SC_MODEL_VERSION TYPE /BOBF/CONF_VERSION VALUE '00000' .
  constants:
    "! <p class="shorttext synchronized" lang="en">Nodes</p>
    BEGIN OF SC_NODE,
 ZTT_I_TASKS                    TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EEAAEF65901B03133C9',
 ZTT_I_TASKS_LOCK               TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EEAAEF65901B031B3C9',
 ZTT_I_TASKS_MESSAGE            TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EEAAEF65901B03173C9',
 ZTT_I_TASKS_PROPERTY           TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EEAAEF65901B03273C9',
 ZTT_I_TASK_COMMENTS            TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EEAAEF66F0E669B33D1',
 ZTT_I_TASK_COMMENTS_MESSAGE    TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EEAAEF66F0E66A0D3D1',
 ZTT_I_TASK_COMMENTS_PROPERTY   TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EEAAEF66F0E66A113D1',
 ZTT_I_TASK_TIME_LOG            TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EEAAEF6611C0E4B13CB',
 ZTT_I_TASK_TIME_LOG_MESSAGE    TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EEAAEF6611C0E5173CB',
 ZTT_I_TASK_TIME_LOG_PROPERTY   TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EEAAEF6611C0E51B3CB',
 ZTT_I_TASK_TRANSPORT_REQUEST   TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EEAAEF67E42345953DA',
 ZTT_I_TASK_TRANSPORT_REQUEST_M TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EEAAEF67E42345F53DA',
 ZTT_I_TASK_TRANSPORT_REQUEST_P TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EEAAEF67E42345F93DA',
    END OF SC_NODE .
  constants:
    "! <p class="shorttext synchronized" lang="en">Node Attributes</p>
    BEGIN OF SC_NODE_ATTRIBUTE,
      BEGIN OF ZTT_I_TASKS,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  PROJECT_CODE                   TYPE STRING VALUE 'PROJECT_CODE',
  CODE                           TYPE STRING VALUE 'CODE',
  DESCRIPTION                    TYPE STRING VALUE 'DESCRIPTION',
  STATUS                         TYPE STRING VALUE 'STATUS',
  ESTIMATION                     TYPE STRING VALUE 'ESTIMATION',
  TIME_UNIT                      TYPE STRING VALUE 'TIME_UNIT',
  ENDED_ON                       TYPE STRING VALUE 'ENDED_ON',
  FUNCTIONAL_RESPONSIBLE         TYPE STRING VALUE 'FUNCTIONAL_RESPONSIBLE',
  TECHNICAL_RESPONSIBLE          TYPE STRING VALUE 'TECHNICAL_RESPONSIBLE',
  ADMIN_DATA                     TYPE STRING VALUE 'ADMIN_DATA',
  CREA_DATE_TIME                 TYPE STRING VALUE 'CREA_DATE_TIME',
  CREA_UNAME                     TYPE STRING VALUE 'CREA_UNAME',
  LCHG_DATE_TIME                 TYPE STRING VALUE 'LCHG_DATE_TIME',
  LCHG_UNAME                     TYPE STRING VALUE 'LCHG_UNAME',
      END OF ZTT_I_TASKS,
      BEGIN OF ZTT_I_TASK_COMMENTS,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  PROJECT_CODE                   TYPE STRING VALUE 'PROJECT_CODE',
  TASK_CODE                      TYPE STRING VALUE 'TASK_CODE',
  CODE                           TYPE STRING VALUE 'CODE',
  COMMENTARY                     TYPE STRING VALUE 'COMMENTARY',
  ADMIN_DATA                     TYPE STRING VALUE 'ADMIN_DATA',
  CREA_DATE_TIME                 TYPE STRING VALUE 'CREA_DATE_TIME',
  CREA_UNAME                     TYPE STRING VALUE 'CREA_UNAME',
  LCHG_DATE_TIME                 TYPE STRING VALUE 'LCHG_DATE_TIME',
  LCHG_UNAME                     TYPE STRING VALUE 'LCHG_UNAME',
      END OF ZTT_I_TASK_COMMENTS,
      BEGIN OF ZTT_I_TASK_TIME_LOG,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  PROJECT_CODE                   TYPE STRING VALUE 'PROJECT_CODE',
  TASK_CODE                      TYPE STRING VALUE 'TASK_CODE',
  CODE                           TYPE STRING VALUE 'CODE',
  ACTIVITY_TYPE                  TYPE STRING VALUE 'ACTIVITY_TYPE',
  START_TS                       TYPE STRING VALUE 'START_TS',
  END_TS                         TYPE STRING VALUE 'END_TS',
  TOTAL_HOURS                    TYPE STRING VALUE 'TOTAL_HOURS',
  ADMIN_DATA                     TYPE STRING VALUE 'ADMIN_DATA',
  CREA_DATE_TIME                 TYPE STRING VALUE 'CREA_DATE_TIME',
  CREA_UNAME                     TYPE STRING VALUE 'CREA_UNAME',
  LCHG_DATE_TIME                 TYPE STRING VALUE 'LCHG_DATE_TIME',
  LCHG_UNAME                     TYPE STRING VALUE 'LCHG_UNAME',
      END OF ZTT_I_TASK_TIME_LOG,
      BEGIN OF ZTT_I_TASK_TRANSPORT_REQUEST,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  PROJECT_CODE                   TYPE STRING VALUE 'PROJECT_CODE',
  TASK_CODE                      TYPE STRING VALUE 'TASK_CODE',
  TRANSPORT_REQUEST              TYPE STRING VALUE 'TRANSPORT_REQUEST',
  COMMENTARY                     TYPE STRING VALUE 'COMMENTARY',
  ADMIN_DATA                     TYPE STRING VALUE 'ADMIN_DATA',
  CREA_DATE_TIME                 TYPE STRING VALUE 'CREA_DATE_TIME',
  CREA_UNAME                     TYPE STRING VALUE 'CREA_UNAME',
  LCHG_DATE_TIME                 TYPE STRING VALUE 'LCHG_DATE_TIME',
  LCHG_UNAME                     TYPE STRING VALUE 'LCHG_UNAME',
      END OF ZTT_I_TASK_TRANSPORT_REQUEST,
    END OF SC_NODE_ATTRIBUTE .
  constants:
    "! <p class="shorttext synchronized" lang="en">Node Categories</p>
    BEGIN OF SC_NODE_CATEGORY,
      BEGIN OF ZTT_I_TASKS,
 ROOT                           TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '0250E0674B721EEAAEF65901B03153C9',
      END OF ZTT_I_TASKS,
      BEGIN OF ZTT_I_TASK_COMMENTS,
 ZTT_I_TASK_COMMENTS            TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '0250E0674B721EEAAEF66F0E66A073D1',
      END OF ZTT_I_TASK_COMMENTS,
      BEGIN OF ZTT_I_TASK_TIME_LOG,
 ZTT_I_TASK_TIME_LOG            TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '0250E0674B721EEAAEF6611C0E5113CB',
      END OF ZTT_I_TASK_TIME_LOG,
      BEGIN OF ZTT_I_TASK_TRANSPORT_REQUEST,
 ZTT_I_TASK_TRANSPORT_REQUEST   TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '0250E0674B721EEAAEF67E42345EF3DA',
      END OF ZTT_I_TASK_TRANSPORT_REQUEST,
    END OF SC_NODE_CATEGORY .
  constants:
    "! <p class="shorttext synchronized" lang="en">Validations</p>
    BEGIN OF SC_VALIDATION,
      BEGIN OF ZTT_I_TASKS,
 PROJECT_CODE                   TYPE /BOBF/VAL_KEY VALUE '0250E0674B721EEAAEF7A4B3D4EE544C',
      END OF ZTT_I_TASKS,
    END OF SC_VALIDATION .
endinterface.
