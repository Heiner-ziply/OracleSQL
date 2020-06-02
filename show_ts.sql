select tablespace_name, trunc(sum(bytes)/1024/1024) mb from dba_segments group by tablespace_name order by 1
/
