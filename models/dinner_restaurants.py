from database import CursorFromConnectionFromPool


class DinnerRestaurantModel:
    def __init__(self, name, restaurant_type, location, price, time_open, time_close):
        self.name = name
        self.restaurant_type = restaurant_type
        self.location = location
        self.price = str(price)
        self.time_open = str(time_open)
        self.time_close = str(time_close)

    def __repr__(self):
        return "<Restaurants for dinner name: {}>".format(self.name)

    @classmethod
    def load_dinner_restaurants(cls, id_day):
        with CursorFromConnectionFromPool() as cursor:
            cursor.execute('SELECT * FROM dinner_restaurant_view')
            all_data = cursor.fetchall()
            dinner_restaurants = []
            for data in all_data:
                dinner_restaurants.append(vars(cls(*data)))
            dinner_restaurants.append({'id_day': id_day})
            return dinner_restaurants, 200
