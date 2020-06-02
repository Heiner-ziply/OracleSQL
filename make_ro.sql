
--usage:
--@make_ro "'CAMP','CAMP_HIST','SPOTLIGHT'"
 
set head off verify off feedback off
spool _make_ro.sql

select 'create role app_support;'||chr(10)|| 'grant create session to app_support;' 
--as app_support
from dual 
where not exists 
(select role from dba_roles where role='APP_SUPPORT');

select '--create role app_support;' from dba_roles where role='APP_SUPPORT';


select 'create role ' ||  username || '_R;' ||chr(10)
|| 'grant '|| username || '_R to app_support;'
from dba_users where username in
(&1) and not exists (select role from dba_roles where role=username || '_R');

select '--create role ' ||  username || '_R'  || 'grant '|| username || '_R to app_support;' 
from dba_users where username in
(&1) and exists (select role from dba_roles where role=username || '_R');


select 'grant select on   '||owner||'.'||table_name||'   to '||owner||'_r;' 
from dba_tables 
where owner in (&1);

select 'grant ' || role || ' to app_support;' 
from dba_roles where role like '%\_R' escape '\';

spool off 
set feedback on
prompt @_make_ro.sql


prompt Now grant the app_support role to the user(s).
--grant app_support to yzz9876 identified by foo#bar

