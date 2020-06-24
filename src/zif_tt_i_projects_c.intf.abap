interface ZIF_TT_I_PROJECTS_C
  public .


  interfaces /BOBF/IF_LIB_CONSTANTS .

  constants:
    BEGIN OF SC_ACTION,
      BEGIN OF ZTT_I_ISSUES,
 CREATE_TR                      TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAADC758666410A8C3',
 CREATE_ZTT_I_ISSUES            TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAA8BBE41D8B84A72C',
 DELETE_ZTT_I_ISSUES            TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAA8BBE41D8B85272C',
 SAVE_ZTT_I_ISSUES              TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAA8BBE41D8B85A72C',
 UPDATE_ZTT_I_ISSUES            TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAA8BBE41D8B84E72C',
 VALIDATE_ZTT_I_ISSUES          TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAA8BBE41D8B85672C',
      END OF ZTT_I_ISSUES,
      BEGIN OF ZTT_I_ISSUE_COMMENTS,
 CREATE_ZTT_I_ISSUE_COMMENTS    TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAAAFF09E0D18B5996',
 DELETE_ZTT_I_ISSUE_COMMENTS    TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAAAFF09E0D18BD996',
 SAVE_ZTT_I_ISSUE_COMMENTS      TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAAAFF09E0D18C5996',
 UPDATE_ZTT_I_ISSUE_COMMENTS    TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAAAFF09E0D18B9996',
 VALIDATE_ZTT_I_ISSUE_COMMENTS  TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAAAFF09E0D18C1996',
      END OF ZTT_I_ISSUE_COMMENTS,
      BEGIN OF ZTT_I_ISSUE_TRANSPORT_REQUESTS,
 CREATE_ZTT_I_ISSUE_TRANSPORT_R TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAB8FF08CEB626137',
 DELETE_ZTT_I_ISSUE_TRANSPORT_R TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAB8FF08CEB62E137',
 SAVE_ZTT_I_ISSUE_TRANSPORT_REQ TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAB8FF08CEB636137',
 UPDATE_ZTT_I_ISSUE_TRANSPORT_R TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAB8FF08CEB62A137',
 VALIDATE_ZTT_I_ISSUE_TRANSPORT TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EEAAB8FF08CEB632137',
      END OF ZTT_I_ISSUE_TRANSPORT_REQUESTS,
      BEGIN OF ZTT_I_PROJECTS,
 CREATE_ZTT_I_PROJECTS          TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAA8BBE41D8B7C472C',
 DELETE_ZTT_I_PROJECTS          TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAA8BBE41D8B7CC72C',
 LOCK_ZTT_I_PROJECTS            TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAA8BBE41D8B7B872C',
 SAVE_ZTT_I_PROJECTS            TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAA8BBE41D8B7D472C',
 START                          TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAA8E37167FE30793B',
 UNLOCK_ZTT_I_PROJECTS          TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAA8BBE41D8B7BC72C',
 UPDATE_ZTT_I_PROJECTS          TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAA8BBE41D8B7C872C',
 VALIDATE_ZTT_I_PROJECTS        TYPE /BOBF/ACT_KEY VALUE '0250E0674B721EDAA8BBE41D8B7D072C',
      END OF ZTT_I_PROJECTS,
    END OF SC_ACTION .
  constants:
    BEGIN OF SC_ACTION_ATTRIBUTE,
        BEGIN OF ZTT_I_ISSUES,
        BEGIN OF CREATE_TR,
 WORKBENCH                      TYPE STRING VALUE 'WORKBENCH',
 CUSTOMIZING                    TYPE STRING VALUE 'CUSTOMIZING',
        END OF CREATE_TR,
      END OF ZTT_I_ISSUES,
        BEGIN OF ZTT_I_PROJECTS,
        BEGIN OF LOCK_ZTT_I_PROJECTS,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
        END OF LOCK_ZTT_I_PROJECTS,
        BEGIN OF START,
 START_DATE                     TYPE STRING VALUE 'START_DATE',
 END_DATE                       TYPE STRING VALUE 'END_DATE',
 DEP_COMMENT                    TYPE STRING VALUE 'DEP_COMMENT',
        END OF START,
        BEGIN OF UNLOCK_ZTT_I_PROJECTS,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
        END OF UNLOCK_ZTT_I_PROJECTS,
      END OF ZTT_I_PROJECTS,
    END OF SC_ACTION_ATTRIBUTE .
  constants:
    BEGIN OF SC_ALTERNATIVE_KEY,
      BEGIN OF ZTT_I_ISSUES,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '0250E0674B721EDAA8BBE41D8B7EE72C',
 PARENT_KEY                     TYPE /BOBF/OBM_ALTKEY_KEY VALUE '0250E0674B721EDAA8BBE41D8B7F072C',
      END OF ZTT_I_ISSUES,
      BEGIN OF ZTT_I_ISSUE_COMMENTS,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '0250E0674B721EDAAAFF09E0D1871996',
 PARENT_KEY                     TYPE /BOBF/OBM_ALTKEY_KEY VALUE '0250E0674B721EDAAAFF09E0D1873996',
 ROOT_KEY                       TYPE /BOBF/OBM_ALTKEY_KEY VALUE '0250E0674B721EDAAAFF09E0D1875996',
      END OF ZTT_I_ISSUE_COMMENTS,
      BEGIN OF ZTT_I_ISSUE_TRANSPORT_REQUESTS,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '0250E0674B721EEAAB8FF08CEB5C4137',
 PARENT_KEY                     TYPE /BOBF/OBM_ALTKEY_KEY VALUE '0250E0674B721EEAAB8FF08CEB5C6137',
 ROOT_KEY                       TYPE /BOBF/OBM_ALTKEY_KEY VALUE '0250E0674B721EEAAB8FF08CEB5C8137',
      END OF ZTT_I_ISSUE_TRANSPORT_REQUESTS,
      BEGIN OF ZTT_I_PROJECTS,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '0250E0674B721EDAA8BBE41D8B7EC72C',
      END OF ZTT_I_PROJECTS,
    END OF SC_ALTERNATIVE_KEY .
  constants:
    BEGIN OF SC_ASSOCIATION,
      BEGIN OF ZTT_I_ISSUES,
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAA8BBE41D8B84472C',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAA8BBE41D8B84872C',
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAA8BBE41D8B85E72C',
 TO_ROOT                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAA8BBE41D8B86072C',
 _COMMENT                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAAAFF09E0D18A9996',
 _TRANSPORTREQUEST              TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAB8FF08CEB61A137',
      END OF ZTT_I_ISSUES,
      BEGIN OF ZTT_I_ISSUES_MESSAGE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAA8BBE41D8B86272C',
      END OF ZTT_I_ISSUES_MESSAGE,
      BEGIN OF ZTT_I_ISSUES_PROPERTY,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAA8BBE41D8B86472C',
      END OF ZTT_I_ISSUES_PROPERTY,
      BEGIN OF ZTT_I_ISSUE_COMMENTS,
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAAAFF09E0D18AF996',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAAAFF09E0D18B3996',
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAAAFF09E0D18C9996',
 TO_ROOT                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAAAFF09E0D18CB996',
      END OF ZTT_I_ISSUE_COMMENTS,
      BEGIN OF ZTT_I_ISSUE_COMMENTS_MESSAGE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAAAFF09E0D18CD996',
      END OF ZTT_I_ISSUE_COMMENTS_MESSAGE,
      BEGIN OF ZTT_I_ISSUE_COMMENTS_PROPERTY,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAAAFF09E0D18CF996',
      END OF ZTT_I_ISSUE_COMMENTS_PROPERTY,
      BEGIN OF ZTT_I_ISSUE_TRANSPORT_REQUESTS,
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAB8FF08CEB620137',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAB8FF08CEB624137',
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAB8FF08CEB63A137',
 TO_ROOT                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAB8FF08CEB63C137',
      END OF ZTT_I_ISSUE_TRANSPORT_REQUESTS,
      BEGIN OF ZTT_I_ISSUE_TRANSPORT_REQUES_M,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAB8FF08CEB63E137',
      END OF ZTT_I_ISSUE_TRANSPORT_REQUES_M,
      BEGIN OF ZTT_I_ISSUE_TRANSPORT_REQUES_P,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EEAAB8FF08CEB640137',
      END OF ZTT_I_ISSUE_TRANSPORT_REQUES_P,
      BEGIN OF ZTT_I_PROJECTS,
 LOCK                           TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAA8BBE41D8B7B672C',
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAA8BBE41D8B7B272C',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAA8BBE41D8B7C272C',
 _ISSUES                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAA8BBE41D8B83E72C',
      END OF ZTT_I_PROJECTS,
      BEGIN OF ZTT_I_PROJECTS_LOCK,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAA8BBE41D8B7DA72C',
      END OF ZTT_I_PROJECTS_LOCK,
      BEGIN OF ZTT_I_PROJECTS_MESSAGE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAA8BBE41D8B7D872C',
      END OF ZTT_I_PROJECTS_MESSAGE,
      BEGIN OF ZTT_I_PROJECTS_PROPERTY,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '0250E0674B721EDAA8BBE41D8B7DC72C',
      END OF ZTT_I_PROJECTS_PROPERTY,
    END OF SC_ASSOCIATION .
  constants:
    BEGIN OF SC_ASSOCIATION_ATTRIBUTE,
      BEGIN OF ZTT_I_ISSUES,
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
      END OF ZTT_I_ISSUES,
      BEGIN OF ZTT_I_ISSUE_COMMENTS,
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
      END OF ZTT_I_ISSUE_COMMENTS,
      BEGIN OF ZTT_I_ISSUE_TRANSPORT_REQUESTS,
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
      END OF ZTT_I_ISSUE_TRANSPORT_REQUESTS,
      BEGIN OF ZTT_I_PROJECTS,
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
      END OF ZTT_I_PROJECTS,
    END OF SC_ASSOCIATION_ATTRIBUTE .
  constants:
    SC_BO_KEY  TYPE /BOBF/OBM_BO_KEY VALUE '0250E0674B721EDAA8BBE41D8B7A872C' .
  constants:
    SC_BO_NAME TYPE /BOBF/OBM_NAME VALUE 'ZTT_I_PROJECTS' .
  constants:
    BEGIN OF SC_DETERMINATION,
      BEGIN OF ZTT_I_ISSUES,
 AT_CREATION                    TYPE /BOBF/DET_KEY VALUE '0250E0674B721EDAAAF9864E7A46D72A',
      END OF ZTT_I_ISSUES,
      BEGIN OF ZTT_I_ISSUE_COMMENTS,
 AT_CREATION                    TYPE /BOBF/DET_KEY VALUE '0250E0674B721EDAAB81BF223CBCBAC5',
      END OF ZTT_I_ISSUE_COMMENTS,
      BEGIN OF ZTT_I_PROJECTS,
 ACTION_AND_FIELD_CONTROL       TYPE /BOBF/DET_KEY VALUE '0250E0674B721EDAA8E5E72EBF387A59',
      END OF ZTT_I_PROJECTS,
    END OF SC_DETERMINATION .
  constants:
    SC_MODEL_VERSION TYPE /BOBF/CONF_VERSION VALUE '00000' .
  constants:
    BEGIN OF SC_NODE,
 ZTT_I_ISSUES                   TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EDAA8BBE41D8B7E272C',
 ZTT_I_ISSUES_MESSAGE           TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EDAA8BBE41D8B84272C',
 ZTT_I_ISSUES_PROPERTY          TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EDAA8BBE41D8B84672C',
 ZTT_I_ISSUE_COMMENTS           TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EDAAAFF09E0D1867996',
 ZTT_I_ISSUE_COMMENTS_MESSAGE   TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EDAAAFF09E0D18AD996',
 ZTT_I_ISSUE_COMMENTS_PROPERTY  TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EDAAAFF09E0D18B1996',
 ZTT_I_ISSUE_TRANSPORT_REQUESTS TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EEAAB8FF08CEB5BA137',
 ZTT_I_ISSUE_TRANSPORT_REQUES_M TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EEAAB8FF08CEB61E137',
 ZTT_I_ISSUE_TRANSPORT_REQUES_P TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EEAAB8FF08CEB622137',
 ZTT_I_PROJECTS                 TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EDAA8BBE41D8B7AC72C',
 ZTT_I_PROJECTS_LOCK            TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EDAA8BBE41D8B7B472C',
 ZTT_I_PROJECTS_MESSAGE         TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EDAA8BBE41D8B7B072C',
 ZTT_I_PROJECTS_PROPERTY        TYPE /BOBF/OBM_NODE_KEY VALUE '0250E0674B721EDAA8BBE41D8B7C072C',
    END OF SC_NODE .
  constants:
    BEGIN OF SC_NODE_ATTRIBUTE,
      BEGIN OF ZTT_I_ISSUES,
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
      END OF ZTT_I_ISSUES,
      BEGIN OF ZTT_I_ISSUE_COMMENTS,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  PROJECT_CODE                   TYPE STRING VALUE 'PROJECT_CODE',
  ISSUE_CODE                     TYPE STRING VALUE 'ISSUE_CODE',
  CODE                           TYPE STRING VALUE 'CODE',
  COMMENTARY                     TYPE STRING VALUE 'COMMENTARY',
  ADMIN_DATA                     TYPE STRING VALUE 'ADMIN_DATA',
  CREA_DATE_TIME                 TYPE STRING VALUE 'CREA_DATE_TIME',
  CREA_UNAME                     TYPE STRING VALUE 'CREA_UNAME',
  LCHG_DATE_TIME                 TYPE STRING VALUE 'LCHG_DATE_TIME',
  LCHG_UNAME                     TYPE STRING VALUE 'LCHG_UNAME',
      END OF ZTT_I_ISSUE_COMMENTS,
      BEGIN OF ZTT_I_ISSUE_TRANSPORT_REQUESTS,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  PROJECT_CODE                   TYPE STRING VALUE 'PROJECT_CODE',
  ISSUE_CODE                     TYPE STRING VALUE 'ISSUE_CODE',
  TRANSPORT_REQUEST              TYPE STRING VALUE 'TRANSPORT_REQUEST',
  COMMENTARY                     TYPE STRING VALUE 'COMMENTARY',
  ADMIN_DATA                     TYPE STRING VALUE 'ADMIN_DATA',
  CREA_DATE_TIME                 TYPE STRING VALUE 'CREA_DATE_TIME',
  CREA_UNAME                     TYPE STRING VALUE 'CREA_UNAME',
  LCHG_DATE_TIME                 TYPE STRING VALUE 'LCHG_DATE_TIME',
  LCHG_UNAME                     TYPE STRING VALUE 'LCHG_UNAME',
      END OF ZTT_I_ISSUE_TRANSPORT_REQUESTS,
      BEGIN OF ZTT_I_PROJECTS,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  CODE                           TYPE STRING VALUE 'CODE',
  NAME                           TYPE STRING VALUE 'NAME',
  DEFAULT_TIME_UNIT              TYPE STRING VALUE 'DEFAULT_TIME_UNIT',
  STARTED_ON                     TYPE STRING VALUE 'STARTED_ON',
  ENDED_ON                       TYPE STRING VALUE 'ENDED_ON',
  ADMIN_DATA                     TYPE STRING VALUE 'ADMIN_DATA',
  CREA_DATE_TIME                 TYPE STRING VALUE 'CREA_DATE_TIME',
  CREA_UNAME                     TYPE STRING VALUE 'CREA_UNAME',
  LCHG_DATE_TIME                 TYPE STRING VALUE 'LCHG_DATE_TIME',
  LCHG_UNAME                     TYPE STRING VALUE 'LCHG_UNAME',
      END OF ZTT_I_PROJECTS,
    END OF SC_NODE_ATTRIBUTE .
  constants:
    BEGIN OF SC_NODE_CATEGORY,
      BEGIN OF ZTT_I_ISSUES,
 ZTT_I_ISSUES                   TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '0250E0674B721EDAA8BBE41D8B83C72C',
      END OF ZTT_I_ISSUES,
      BEGIN OF ZTT_I_ISSUE_COMMENTS,
 ZTT_I_ISSUE_COMMENTS           TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '0250E0674B721EDAAAFF09E0D18A7996',
      END OF ZTT_I_ISSUE_COMMENTS,
      BEGIN OF ZTT_I_ISSUE_TRANSPORT_REQUESTS,
 ZTT_I_ISSUE_TRANSPORT_REQUESTS TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '0250E0674B721EEAAB8FF08CEB618137',
      END OF ZTT_I_ISSUE_TRANSPORT_REQUESTS,
      BEGIN OF ZTT_I_PROJECTS,
 ROOT                           TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '0250E0674B721EDAA8BBE41D8B7AE72C',
      END OF ZTT_I_PROJECTS,
    END OF SC_NODE_CATEGORY .
endinterface.
