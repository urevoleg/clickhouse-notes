# MV Schema

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
