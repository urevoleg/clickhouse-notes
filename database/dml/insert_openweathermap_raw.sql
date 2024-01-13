-- alternative get http
INSERT INTO cdc.openweathermap_raw (record_timestamp, record_value)
SELECT record_timestamp,
	   record_value
FROM (
SELECT toDateTime(now(), 'Europe/Moscow') AS record_timestamp, *
FROM url('https://api.openweathermap.org/data/2.5/weather?lat=%(lat)s&lon=%(lon)s&appid=%(appid)s&units=metric',
	JSONAsString, 'record_value String')
);