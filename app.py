from restaurant import Restaurant

my_restaurant = Restaurant('Test_restaurant', 'DK 6 Fw', 'test restaurant description', '/static/img/c1.jpg',
                           'traditional', None, None)

my_restaurant.save_to_db()
