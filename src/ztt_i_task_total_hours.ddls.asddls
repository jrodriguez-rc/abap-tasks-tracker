@AbapCatalog.sqlViewName: 'ZTTI_TASKHOURS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Total hours for tasks'

define view ZTT_I_TASK_TOTAL_HOURS
    as select from ZTT_I_TASK_TIME_LOG
{
    //ZTT_I_TIME_LOG
    key project_code as projectCode,
    
    key task_code as taskCode,
    
    sum (total_hours) as totalHours
    
} group by project_code, task_code