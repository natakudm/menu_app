from database import CursorFromConnectionFromPool


class Meal:
    def __init__(self, _id, id_restaurant, name, time_open, time_close):
        self.id = _id
        self.id_restaurant = id_restaurant
        self.name = name
        self.time_open = time_open
        self.time_close = time_close

    def __repr__(self):
        return "<Meal: {}>".format(self.name)

    @classmethod
    def load_meal_from_db_by_name(cls, name):
        with CursorFromConnectionFromPool() as cursor:
            try:
                cursor.execute('SELECT * FROM meal WHERE name=%s', (name,))
                data = cursor.fetchone()
                return cls(*data)
            except:
                return {'message': 'meal not found'}

    @classmethod
    def load_meals_from_db(cls):
        with CursorFromConnectionFromPool() as cursor:
            cursor.execute('SELECT * FROM meal')
            all_data = cursor.fetchall()
            for data in all_data:
                print(cls(*data))
