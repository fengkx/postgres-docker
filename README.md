# postgres-docker

> Self-use postgres docker image with following changes

## Extensions

1. postgresql-contrib `with pg_stat_statements enable`
1. [zhparser](https://github.com/amutu/zhparser/) `full-text search of Chinese`
1. [pg-safeupdate](https://github.com/eradman/pg-safeupdate) `require SQL Where Clause in update/delete`
1. [pg_cron](https://github.com/citusdata/pg_cron) `run cron job`

## Cofnig

1. `default_text_search_config` set to `'chinese'` to use zhparser
1. `pg_stat_statements`, `safeupdate` load by default
1. `max_replication_slots` if `USE_REPLICATION` env is set

more in [this file](https://github.com/fengkx/postgres-docker/blob/master/init_extension.sh)
