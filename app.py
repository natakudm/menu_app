from restaurant import Restaurant

my_restaurant = Restaurant('Test_restaurant #3', 'DK 6 Fw', 'test restaurant description', '/static/img/c2.jpg',
                           'traditional', None, None)
my_restaurant.save_to_db()

my_restaurant2 = Restaurant.load_from_db_by_name('Test_restaurant #2')
print(my_restaurant2)
