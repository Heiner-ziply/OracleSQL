col link_name for a25
col source for a45
select owner, substr(DB_LINK,1,25) link_name,
USERNAME, substr(HOST,1,155) source
from dba_db_links
order by owner, DB_LINK
/
