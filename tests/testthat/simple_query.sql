with tabs as (
	select count(1) as tables
	from pg_catalog.pg_tables
	)
select tables as tabs
from tabs
;