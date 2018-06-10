from restaurant import Restaurant
from database import Database

Database.initialize()

my_restaurant = Restaurant('Test_restaurant #4', 'DK 6 Fw', 'test restaurant description', '/static/img/c2.jpg',
                           'traditional', None, None)
my_restaurant.save_to_db()

my_restaurant2 = Restaurant.load_from_db_by_name('Test_restaurant')
print(my_restaurant2)
