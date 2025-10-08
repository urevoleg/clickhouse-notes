# Сlickhouse-notes

Серия постов для канала [Where is data, Lebowski](https://t.me/double_data):
1. [Lifehack 0](https://t.me/double_data/113)
2. [🚛 Как грузить в клик](https://t.me/double_data/114)
3. [Предикат ORDER BY](https://t.me/double_data/115)
4. [Продолжаем грузить клик](https://t.me/double_data/117)
5. [Маленький, но крайне полезный](https://t.me/double_data/118)
6. [Про разрешение DateTime типа](https://t.me/double_data/120)
7. [Про ORDER BY (разбираемся на примере)](https://t.me/double_data/121)
8. [Оператор EXCHANGE](https://t.me/double_data/123)
9. [MATERIALIZED VIEW - 1](https://t.me/double_data/124) и [продолжение](https://t.me/double_data/125)
10. [url table function](https://t.me/double_data/126)
11. [MATERIALIZED VIEW - 2](https://t.me/double_data/128)
12. [O - Optimization](https://t.me/double_data/129)
13. [Последнее слово (но это не точно)](https://t.me/double_data/131) (RMT)
14. [Как выгрузить из клика: начало](https://t.me/double_data/149)
15. [Data Overview](https://t.me/double_data/151)
17. [Sort (partition) me, if you can]() 
18. [♻️ Я тебя сам обновлю]() 
19. 🧐 Потерянные данные и где их искать [soon]
20. Идемпотентность вставки [soon]
21. 🔍 Мониторинг (ProfileEvents) [soon]
22. 🤯 Ох уже этот memory-limit [soon]
23. Версионность, которую и не ждали [soon]
24. Clickhouse monitoring (от запросов до дашбордов) [soon]

## Pipeline OpenWeatherMap - v2

![clickhouse-notes-openweather-pipeline-v2.png](img%2Fclickhouse-notes-openweather-pipeline-v2.png)

## Pipeline OpenWeatherMap

![clickhouse-notes-openweather-pipeline.png](img%2Fclickhouse-notes-openweather-pipeline.png)

## Внутренний pipeline

![clickhouse-notes-openweather-mv-steps.png](img%2Fclickhouse-notes-openweather-mv-steps.png)


## Metabase + Clickhouse

[metabase-clickhouse-driver](https://github.com/ClickHouse/metabase-clickhouse-driver)

![clickhouse-notes-mb-dash.png](img%2Fclickhouse-notes-mb-dash.png)

## Links

Полезные материалы при изучении:
1. [materialized_views.pdf](docs%2Fmaterialized_views.pdf) - крайне полезная pdf со всеми лайфхаками
2. [Magic of materilized view and projection (Altinity)](https://youtu.be/j15dvPGzhyE?si=cKKvY7F05vaEYO-8)
3. [Tips and tricks](https://youtu.be/FsVrFbcyb84?si=9WK_IY2FkxJe9CjA)
4. [Materialized views (official docs)](https://clickhouse.com/docs/en/guides/developer/cascading-materialized-views)
5. [Deduplication (official docs)](https://clickhouse.com/docs/en/guides/developer/deduplication)
6. [MergeTree Family](https://clickhouse.com/docs/ru/engines/table-engines/mergetree-family/mergetree)
7. [A Practical Introduction to Primary Indexes in ClickHouse](https://clickhouse.com/docs/en/optimize/sparse-primary-indexes)
8. [Dictionary (official docs)](https://clickhouse.com/docs/en/sql-reference/dictionaries)
9. [Оптимизация инсертов в ClickHouse через Kafka Sink-коннекторы (habr)](https://habr.com/ru/companies/magnit/articles/926834/)

Также рекомендую [Clickhouse blog](https://clickhouse.com/blog?category=engineering):
1. [Using Materialized Views in ClickHouse](https://clickhouse.com/blog/using-materialized-views-in-clickhouse)
2. [Altinity Youtube Channel](https://www.youtube.com/@Altinity)
