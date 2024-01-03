CREATE DATABASE cdc;

CREATE TABLE cdc.openweathermap_raw
(
record_timestamp DateTime64(6),
record_value String
)
ENGINE=MergeTree
ORDER BY (record_timestamp)
;