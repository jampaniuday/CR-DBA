SELECT substr(owner,1,10)||'.'||substr(name,1,35) "Object Name", 
' Type: '||substr(type,1,12)|| 
' size: '||sharable_mem || 
' execs: '||executions|| 
' loads: '||loads|| 
' Kept: '||kept 
FROM v$db_object_cache 
WHERE type in ('TRIGGER','PROCEDURE','PACKAGE BODY','PACKAGE') 
AND executions > 100000
ORDER BY executions desc, 
loads desc, 
sharable_mem desc;
