import psycopg2


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
        connection = psycopg2.connect(user='postgres', password='7777777', database='menu_app', host='localhost')
        with connection.cursor() as cursor:
            cursor.execute('INSERT INTO restaurant(name, location, description, picture, restaurant_type) '
                           'VALUES (%s, %s, %s, %s, %s)', (self.name, self.location, self.description, self.picture,
                                                           self.restaurant_type))
        connection.commit()
        connection.close()
