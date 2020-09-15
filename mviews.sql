col owner for A30
col mview_name for A30
select owner, mview_name, last_refresh_date , stale_since
from dba_mviews;