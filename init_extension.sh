set -ex
echo "shared_preload_libraries = 'pg_stat_statements, pg_cron'" >> $PGDATA/postgresql.conf

echo "pg_stat_statements.max = 10000" >> $PGDATA/postgresql.conf
echo "pg_stat_statements.track = all" >> $PGDATA/postgresql.conf

if [ "$USE_REPLICATION" = 1 ];then \
echo "wal_level=logical" >> $PGDATA/postgresql.conf \
&& echo "max_replication_slots=5" >> $PGDATA/postgresql.conf; \
fi;

echo "default_text_search_config= 'chinese'" >> $PGDATA/postgresql.conf