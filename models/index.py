from database import CursorFromConnectionFromPool
from init import img_url


class IndexModel:
    def __init__(self, _id, restaurant_name, restaurant_type, location, picture, meal_name, time_open, time_close):
        self.id = _id
        self.restaurant_name = restaurant_name
        self.restaurant_type = restaurant_type
        self.location = location
        self.picture = picture
        self.meal_name = meal_name
        self.time_open = time_open
        self.time_close = time_close

    def __repr__(self):
        return "<Index representation: {}>".format(self.meal_name)

    def json(self):
        json_obj = {'id': self.id, 'restaurant_name': self.restaurant_name, 'restaurant_type': self.restaurant_type,
                    'location': self.location, 'picture': img_url+self.picture, 'meal_name': self.meal_name,
                    'time_open': str(self.time_open), 'time_close': str(self.time_close)}
        return json_obj

    @classmethod
    def load_index(cls):
        with CursorFromConnectionFromPool() as cursor:
            cursor.execute('SELECT restaurant.id, restaurant.name AS restaurant_name, restaurant.restaurant_type,'
                           ' restaurant.location, restaurant.picture, meal.name AS meal_name, meal.time_open, '
                           'meal.time_close '
                           'FROM restaurant INNER JOIN meal ON meal.id_restaurant = restaurant.id ORDER BY meal.name;')
            all_data = cursor.fetchall()
            indexes = []
            for data in all_data:
                index = cls(*data).json()
                indexes.append(index)
        return indexes
