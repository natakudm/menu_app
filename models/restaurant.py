from database import CursorFromConnectionFromPool
from init import img_url


class RestaurantModel:
    def __init__(self, _id, name, location, description, picture, restaurant_type, price):
        self.id = _id
        self.name = name
        self.location = location
        self.description = description
        self.picture = picture
        self.restaurant_type = restaurant_type
        self.price = price

    def __repr__(self):
        return "<Restaurant: {}>".format(self.name)

    def json(self):
        json_obj = {'id': self.id, 'name': self.name, 'location': self.location, 'description': self.description,
                    'picture': img_url+self.picture, 'restaurant_type': self.restaurant_type, 'price': str(self.price)}
        return json_obj

    @classmethod
    def load_restaurant_by_id(cls, _id):
        with CursorFromConnectionFromPool() as cursor:
            try:
                cursor.execute('SELECT * FROM restaurant WHERE id=%s', (_id,))
                data = cursor.fetchone()
                return cls(*data).json(), 200
            except:
                return {'message': 'restaurant not found'}, 404

    @classmethod
    def load_restaurants(cls):
        with CursorFromConnectionFromPool() as cursor:
            cursor.execute('SELECT * FROM restaurant')
            all_data = cursor.fetchall()
            restaurants = []
            for data in all_data:
                restaurant = cls(*data).json()
                restaurants.append(restaurant)
        return restaurants, 200

    @classmethod
    def load_traditional_restaurants(cls):
        with CursorFromConnectionFromPool() as cursor:
            cursor.execute('SELECT * FROM restaurant WHERE restaurant_type=%s', ('traditional',))
            all_data = cursor.fetchall()
            restaurants = []
            for data in all_data:
                restaurant = cls(*data).json()
                restaurants.append(restaurant)
        return restaurants, 200



# Load restaurant by name
    # @classmethod
    # def load_restaurant_by_name(cls, name):
    #     with CursorFromConnectionFromPool() as cursor:
    #         try:
    #             cursor.execute('SELECT * FROM restaurant WHERE name=%s', (name,))
    #             data = cursor.fetchone()
    #             return cls(*data).json(), 200
    #         except:
    #             return {'message': 'restaurant not found'}, 404

# Post restaurant to database (for version 1.3)
    # def save_to_db(self):
    #     with CursorFromConnectionFromPool() as cursor:
    #         cursor.execute(
    #             'INSERT INTO restaurant(name, location, description, picture, restaurant_type) '
    #             'VALUES (%s, %s, %s, %s, %s)',
    #             (self.name, self.location, self.description, self.picture, self.restaurant_type))
