# MV Парсинг данных

Процесс преобразования данных выглядит так:

![clickhouse-notes-openweather-mv-process.png](..%2Fimg%2Fclickhouse-notes-openweather-mv-process.png)

Сырьё выглядит так:

![clickhouse-notes-openweather-raw.png](..%2Fimg%2Fclickhouse-notes-openweather-raw.png)

После MV данные готовы к использованию:

![clickhouse-notes-openweather-after-mv.png](..%2Fimg%2Fclickhouse-notes-openweather-after-mv.png)

# MV Daily Stats

Начнём с результата =)

Дневная статистика во всей красе:

![clickhouse-notes-openweather-mv-daily.png](..%2Fimg%2Fclickhouse-notes-openweather-mv-daily.png)

Внутренняя таблица (где хранятся предагрегаты):

![clickhouse-notes-openweather-mv-innertable.png](..%2Fimg%2Fclickhouse-notes-openweather-mv-innertable.png)


# MV Last point

В какой-то момент времени можно видеть дубли:

```sql
SELECT *
FROM odm.openweathermap_last_point
```

![clickhouse-notes-openweather-duplicate-replacingmergetree.png](..%2Fimg%2Fclickhouse-notes-openweather-duplicate-replacingmergetree.png)

Нативный способ при помощи `FINAL`:

 ```sql
SELECT *
FROM odm.openweathermap_last_point
FINAL
 ```

![clickhouse-notes-openweather-final.png](..%2Fimg%2Fclickhouse-notes-openweather-final.png)

## Другие способы устранения дублей 

### ORDER BY + LIMIT 1

```sql
SELECT *
FROM odm.openweathermap_last_point
ORDER BY last_ts DESC
LIMIT 1
```

### argMax

```sql
SELECT argMax(last_ts, last_ts) AS ts ,
       argMax(temp, last_ts) AS temp,
       argMax(pressure , last_ts) AS pressure ,
       argMax(humidity, last_ts) AS humidity 
FROM odm.openweathermap_last_point
```