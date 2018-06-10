from database import CursorFromConnectionFromPool


class Restaurant:
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

    @classmethod
    def load_restaurant_from_db_by_name(cls, name):
        with CursorFromConnectionFromPool() as cursor:
            cursor.execute('SELECT * FROM restaurant WHERE name=%s', (name,))
            data = cursor.fetchone()
            if data:
                return cls(*data)
            else:
                return {'message': 'Restaurant not found'}

    @classmethod
    def load_restaurants_from_db(cls):
        with CursorFromConnectionFromPool() as cursor:
            cursor.execute('SELECT * FROM restaurant')
            all_data = cursor.fetchall()

            for data in all_data:
                print(cls(*data))


# Post restaurant to database (for version 1.3)
    # def save_to_db(self):
    #     with CursorFromConnectionFromPool() as cursor:
    #         cursor.execute(
    #             'INSERT INTO restaurant(name, location, description, picture, restaurant_type) '
    #             'VALUES (%s, %s, %s, %s, %s)',
    #             (self.name, self.location, self.description, self.picture, self.restaurant_type))
