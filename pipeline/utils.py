import os
from dataclasses import dataclass

from clickhouse_driver import Client

from dotenv import load_dotenv
load_dotenv()


@dataclass
class Connection:
    login: str
    password: str
    host: str
    port: str
    schema: str = None


class BaseHook:
    @staticmethod
    def get_connection(conn_id: str) -> Connection:
        return {
            'ch_local': Connection(login=os.getenv('CH_USER'),
                                            password=os.getenv('CH_PASSWORD'),
                                            host=os.getenv('CH_HOST'),
                                            port=os.getenv('CH_PORT')),
        }.get(conn_id)


def clickhouse_conn(conn_id:str='ch_local', **kwargs) -> Client:
    conn = BaseHook.get_connection(conn_id=conn_id)
    print(conn)
    return Client(host=conn.host,
                  port=conn.port,
                  user=conn.login,
                  password=conn.password,
                  settings={**kwargs}
                  )
