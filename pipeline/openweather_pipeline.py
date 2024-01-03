import datetime as dt
import os
import json
import requests

import typing as t

from dotenv import load_dotenv
load_dotenv()

from utils import clickhouse_conn

OPEN_WEATHER_MAP_URL = "https://api.openweathermap.org/data/2.5/weather"


def extract() -> t.Dict:
    """Extract data from API.
    {'coord': {'lon': 38.225, 'lat': 55.5676},
     'weather': [{'id': 600,
       'main': 'Snow',
       'description': 'light snow',
       'icon': '13n'}],
     'base': 'stations',
     'main': {'temp': -4.29,
      'feels_like': -7.45,
      'temp_min': -4.95,
      'temp_max': -3.77,
      'pressure': 1005,
      'humidity': 86},
     'visibility': 10000,
     'wind': {'speed': 2, 'deg': 170},
     'snow': {'1h': 0.26},
     'clouds': {'all': 75},
     'dt': 1703824339,
     'sys': {'type': 1,
      'id': 9020,
      'country': 'RU',
      'sunrise': 1703829354,
      'sunset': 1703854895},
     'timezone': 10800,
     'id': 502965,
     'name': 'Ramenskoye',
     'cod': 200}
    """
    params = {
        # Координаты для Раменского
        "lat": 55.567586,
        "lon": 38.225004,
        "appid": os.getenv("OPEN_WEATHER_MAP_API_KEY"),
        "units": "metric"
    }

    response = requests.get(OPEN_WEATHER_MAP_URL, params=params)
    response.raise_for_status()
    return response.json()


def transform(json_obj: t.Dict) -> t.Dict:
    return {
        "record_timestamp": dt.datetime.now(),
        "record_value": json.dumps(json_obj),
    }


def load(json_obj: t.Dict) -> None:
    client = clickhouse_conn(conn_id="ch_local")
    client.execute("INSERT INTO cdc.openweathermap_raw VALUES", [json_obj])


def etl() -> None:
    json_obj = extract()
    transformed_obj = transform(json_obj)
    load(transformed_obj)


if __name__ == "__main__":
    etl()