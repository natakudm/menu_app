from database import Database
from cocktail import Cocktail

Database.initialize(user='postgres', password='7777777', database='menu_app', host='localhost')

# my_restaurant = Restaurant.load_restaurant_from_db_by_name('Bernini')
# print(my_restaurant)

# all_restaurants = Restaurant.load_restaurants_from_db()

my_cocktail = Cocktail.load_cocktail_from_db_by_id(1)
print(my_cocktail)

all_cocktail = Cocktail.load_cocktails_from_db()
