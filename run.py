from app import app
import init
from database import Database
import os

db_url = os.environ.get('DATABASE_URL', 'localhost')

Database.initialize(user='postgres', password='7777777', database='menu_app', host=db_url)
