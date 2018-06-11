from database import Database
from models.dish import Dish

Database.initialize(user='postgres', password='7777777', database='menu_app', host='localhost')

my_dish = Dish.load_dish_from_db_by_id(2)
print(my_dish)

all_dishes = Dish.load_dishes_from_db()
