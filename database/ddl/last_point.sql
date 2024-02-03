-- result table
CREATE OR REPLACE TABLE odm.openweathermap_last_point
ENGINE=ReplacingMergeTree(last_ts)
ORDER BY (metric)
AS
SELECT toDateTime(argMax(record_timestamp, record_timestamp)) AS last_ts,
	   argMax(temp, record_timestamp) AS temp,
       round(argMax(pressure, record_timestamp), 2) AS pressure,
       argMax(humidity, record_timestamp) AS humidity,
       'last_point_weather' AS metric
FROM cdc.openweathermap o
;

CREATE MATERIALIZED VIEW odm.openweathermap_last_point_weather_mv
TO odm.openweathermap_last_point
AS
SELECT toDateTime(argMax(record_timestamp, record_timestamp)) AS last_ts,
	   argMax(temp, record_timestamp) AS temp,
       round(argMax(pressure, record_timestamp), 2) AS pressure,
       argMax(humidity, record_timestamp) AS humidity,
       'last_point_weather' AS metric
FROM cdc.openweathermap o
;