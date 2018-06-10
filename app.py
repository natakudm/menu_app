from restaurant import Restaurant

my_restaurant = Restaurant('Test_restaurant #2', 'DK 6 Fw', 'test restaurant description', '/static/img/c1.jpg',
                           'traditional', None, None)
my_restaurant.save_to_db()

my_restaurant = Restaurant.load_from_db_by_name('Test_restaurant')
print(my_restaurant)
