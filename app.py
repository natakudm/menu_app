from database import Database
from wine import Wine

Database.initialize(user='postgres', password='7777777', database='menu_app', host='localhost')

my_wine = Wine.load_wine_from_db_by_id(1)
print(my_wine)

all_wine = Wine.load_wine_from_db()
