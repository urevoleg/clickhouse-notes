CREATE MATERIALIZED VIEW odm.openweathermap_daily_stats_mv
ENGINE = SummingMergeTree
PARTITION BY toStartOfWeek(dated_at)
ORDER BY (dated_at)
POPULATE
AS
SELECT toDate(record_timestamp) AS dated_at,
 	   countState(1) AS record_counts,
       minState(temp) AS min_temp,
       maxState(temp) AS max_temp,
       avgState(temp) AS avg_temp,
       minState(pressure) AS min_pressure,
       maxState(pressure) AS max_pressure,
       avgState(pressure) AS avg_pressure,
       minState(humidity) AS min_humidity,
       maxState(humidity) AS max_humidity,
       avgState(humidity) AS avg_humidity
FROM cdc.openweathermap o
GROUP BY dated_at
;

CREATE VIEW odm.openweathermap_daily_stats_v
AS
SELECT dated_at,
 	   countMerge(record_counts) AS record_counts,
       minMerge(min_temp) AS min_temp,
       maxMerge(max_temp) AS max_temp,
       avgMerge(avg_temp) AS avg_temp,
       minMerge(min_pressure) AS min_pressure,
       maxMerge(max_pressure) AS max_pressure,
       avgMerge(avg_pressure) AS avg_pressure,
       minMerge(min_humidity) AS min_humidity,
       maxMerge(max_humidity) AS max_humidity,
       avgMerge(avg_humidity) AS avg_humidity
FROM odm.openweathermap_daily_stats_mv
GROUP BY dated_at
;