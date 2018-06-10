from restaurant import Restaurant
from meal import Meal
from database import Database

Database.initialize(user='postgres', password='7777777', database='menu_app', host='localhost')

# my_restaurant = Restaurant.load_restaurant_from_db_by_name('Bernini')
# print(my_restaurant)

# all_restaurants = Restaurant.load_restaurants_from_db()

# my_meal = Meal.load_meal_from_db_by_name('lunc')
# print(my_meal)

# all_meal = Meal.load_meals_from_db()
