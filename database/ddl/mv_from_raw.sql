DROP VIEW IF EXISTS cdc.openweathermap_mv;

CREATE MATERIALIZED VIEW cdc.openweathermap_mv
TO cdc.openweathermap
AS
SELECT record_timestamp ,
       FROM_UNIXTIME(toUInt64(JSONExtractString(record_value, 'dt'))) AS dt,
	   JSONExtractString(arrayElement(JSONExtractArrayRaw(record_value, 'weather'), 1), 'main') AS main,
	   JSONExtractString(arrayElement(JSONExtractArrayRaw(record_value, 'weather'), 1), 'description') AS description,
	   JSONExtractFloat(JSONExtractString(record_value, 'main'), 'temp') AS temp ,
	   JSONExtractFloat(JSONExtractString(record_value, 'main'), 'feels_like') AS feels_like,
	   0.750062 * JSONExtractUInt(JSONExtractString(record_value, 'main'), 'pressure') AS pressure,
	   JSONExtractUInt(JSONExtractString(record_value, 'main'), 'humidity') AS humidity
FROM cdc.openweathermap_raw
;