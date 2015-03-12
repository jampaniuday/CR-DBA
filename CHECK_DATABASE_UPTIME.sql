select
'Host Name : '||host_name||chr(10)||
'Instance Name : '||instance_name||chr(10)||
'Uptime : '||floor(xx)||'days '||floor((xx-floor(xx))*24)||'hours '||round(((xx-floor(xx
)*24)-floor((xx-floor(xx)*24)))*60)||'minutes' "Database Uptime"
from (select host_name,instance_name ,(sysdate-STARTUP_TIME) xx from v$instance);
