from app import app
import init
from database import Database
import os

db_url = os.environ.get('DATABASE_URL', 'localhost')

Database.initialize(user='natalya', password='nat2012', database='natalya', host=db_url)
