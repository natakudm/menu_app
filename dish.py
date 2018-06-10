from database import CursorFromConnectionFromPool


class Dish:
    def __init__(self, _id, name, description, picture, category, id_meal, recomended_wine, id_day):
        self.id = _id
        self.name = name
        self.description = description
        self.picture = picture
        self.category = category
        self.id_meal = id_meal
        self.recomended_wine = recomended_wine
        self.id_day = id_day

    def __repr__(self):
        return "<Dish: {}>".format(self.name)

    @classmethod
    def load_dish_from_db_by_id(cls, _id):
        with CursorFromConnectionFromPool() as cursor:
            try:
                cursor.execute('SELECT * FROM dish WHERE id=%s', (_id,))
                data = cursor.fetchone()
                return cls(*data)
            except:
                return {'message': 'dish not found'}

    @classmethod
    def load_dishes_from_db(cls):
        with CursorFromConnectionFromPool() as cursor:
            cursor.execute('SELECT * FROM dish')
            all_data = cursor.fetchall()
            for data in all_data:
                print(cls(*data))
