col owner for a30
select owner, count(*) from dba_objects
group by owner order by 1
/