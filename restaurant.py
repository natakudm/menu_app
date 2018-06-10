from database import ConnectionFromPool


class Restaurant:
    def __init__(self, name, location, description, picture, restaurant_type, price, _id):
        self.name = name
        self.location = location
        self.description = description
        self.picture = picture
        self.restaurant_type = restaurant_type
        self.price = price
        self.id = _id

    def __repr__(self):
        return "<Restaurant: {}>".format(self.name)

    def save_to_db(self):
        with ConnectionFromPool() as connection:
            with connection.cursor() as cursor:
                cursor.execute(
                    'INSERT INTO restaurant(name, location, description, picture, restaurant_type) VALUES (%s, %s, %s, %s, %s)',
                    (self.name, self.location, self.description, self.picture, self.restaurant_type))

    @classmethod
    def load_from_db_by_name(cls, name):
        with ConnectionFromPool() as connection:
            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM restaurant WHERE name=%s', (name,))
                data = cursor.fetchone()
                return cls(name=data[1], location=data[2], description=data[3], picture=data[4],
                           restaurant_type=data[5], price=data[6], _id=data[0])
