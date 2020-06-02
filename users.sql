set pages 200 lines 250
col username for A25
col account_status for A20
col profile for A20
col INITIAL_RSRC_CONSUMER_GROUP for A30
col default_tablespace for A20
select username, created, profile, account_status, default_tablespace, INITIAL_RSRC_CONSUMER_GROUP
from dba_users 
where regexp_like (username,'^([[:alpha:]]{3}[[:digit:]]{4})$')
or regexp_like (username,'^([[:alpha:]]{3}[[:digit:]]{3})$')
or regexp_like (username,'^V_([[:alpha:]]{3}[[:digit:]]{3})$')
order by 1
/


set pages 200 lines 250
col username for A25
select username, created, profile, account_status, default_tablespace, INITIAL_RSRC_CONSUMER_GROUP
from dba_users 
where not regexp_like (username,'^([[:alpha:]]{3}[[:digit:]]{4})$')
and not regexp_like (username,'^([[:alpha:]]{3}[[:digit:]]{3})$')
and not regexp_like (username,'^V_([[:alpha:]]{3}[[:digit:]]{3})$')
--and nvl(password,'x') != 'EXTERNAL'
--and username not between 'M00000' and 'M99999'
and username not in (
'ANONYMOUS'
,'APPQOSSYS'
,'DBA_DBG'
,'DBA_MON'
,'DBSNMP'
,'DIP'
,'EXFSYS'
,'GGSUSER'
,'ORACLE_OCM'
,'OUTLN'
,'SYS'
,'SYSTEM'
,'WMSYS'
,'XDB'
,'XS$NULL'
)
order by 1
/
