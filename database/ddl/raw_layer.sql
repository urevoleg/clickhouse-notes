CREATE DATABASE cdc;

CREATE TABLE cdc.openweathermap_raw
(
record_timestamp DateTime64(6),
record_value String
)
ENGINE=MergeTree
ORDER BY (record_timestamp)
;

-- table for MV
CREATE OR REPLACE TABLE cdc.openweathermap
(
	record_timestamp DateTime64,
	dt DateTime,
	main String,
	description String,
	temp Float64,
	feels_like Float64,
	pressure Float64,
	humidity Float64
)
ENGINE=MergeTree
PARTITION BY toStartOfWeek(record_timestamp)
ORDER BY (main, description, record_timestamp)
;