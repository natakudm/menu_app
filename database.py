from psycopg2 import pool

connection_pool = pool.SimpleConnectionPool(1, 10,
                                            user='postgres', password='7777777', database='menu_app', host='localhost')

