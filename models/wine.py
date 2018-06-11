from database import CursorFromConnectionFromPool


class Wine:
    def __init__(self, _id, name, description, price_for_glass, price_for_bottle, picture):
        self.id = _id
        self.name = name
        self.description = description
        self.price_for_glass = price_for_glass
        self.price_for_bottle = price_for_bottle
        self.picture = picture

    def __repr__(self):
        return "<Wine: {}>".format(self.name)

    @classmethod
    def load_wine_from_db_by_id(cls, _id):
        with CursorFromConnectionFromPool() as cursor:
            try:
                cursor.execute('SELECT * FROM wine WHERE id=%s', (_id,))
                data = cursor.fetchone()
                return cls(*data)
            except:
                return {'message': 'wine not found'}

    @classmethod
    def load_wine_from_db(cls):
        with CursorFromConnectionFromPool() as cursor:
            cursor.execute('SELECT * FROM wine')
            all_data = cursor.fetchall()
            for data in all_data:
                print(cls(*data))
