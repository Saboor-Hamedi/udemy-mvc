TYPE=VIEW
query=select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,\'/\',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,format_pico_time(cast(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) as unsigned)) AS `total_latency`,format_pico_time(min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,format_pico_time(ifnull(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0),0)) AS `avg_latency`,format_pico_time(cast(max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) as unsigned)) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where `performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0 and `performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> \'idle\' group by substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,\'/\',3) order by ifnull(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0),0) desc
md5=96242bee6930a9ebab75b6776220c644
updatable=0
algorithm=2
definer_user=mariadb.sys
definer_host=localhost
suid=0
with_check_option=0
timestamp=0001694479762505108
create-version=2
source=SELECT SUBSTRING_INDEX(event_name,\'/\', 3) AS event_class,\n       SUM(COUNT_STAR) AS total,\n       format_pico_time(CAST(SUM(sum_timer_wait) AS UNSIGNED)) AS total_latency,\n       format_pico_time(MIN(min_timer_wait)) AS min_latency,\n       format_pico_time(IFNULL(SUM(sum_timer_wait) / NULLIF(SUM(COUNT_STAR), 0), 0)) AS avg_latency,\n       format_pico_time(CAST(MAX(max_timer_wait) AS UNSIGNED)) AS max_latency\n  FROM performance_schema.events_waits_summary_global_by_event_name\n WHERE sum_timer_wait > 0\n   AND event_name != \'idle\'\n GROUP BY event_class\n ORDER BY IFNULL(SUM(sum_timer_wait) / NULLIF(SUM(COUNT_STAR), 0), 0) DESC;
client_cs_name=utf8mb3
connection_cl_name=utf8mb3_general_ci
view_body_utf8=select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,\'/\',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,format_pico_time(cast(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) as unsigned)) AS `total_latency`,format_pico_time(min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,format_pico_time(ifnull(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0),0)) AS `avg_latency`,format_pico_time(cast(max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) as unsigned)) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where `performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0 and `performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> \'idle\' group by substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,\'/\',3) order by ifnull(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0),0) desc
mariadb-version=110002
