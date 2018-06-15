from database import CursorFromConnectionFromPool
from init import img_url


class WineModel:
    def __init__(self, _id, name, description, price_for_glass, price_for_bottle, picture):
        self.id = _id
        self.name = name
        self.description = description
        self.price_for_glass = str(price_for_glass)
        self.price_for_bottle = str(price_for_bottle)
        self.picture = img_url + picture

    def __repr__(self):
        return "<Wine: {}>".format(self.name)

    @classmethod
    def load_wine_by_id(cls, _id):
        with CursorFromConnectionFromPool() as cursor:
            try:
                cursor.execute('SELECT * FROM wine WHERE id=%s', (_id,))
                data = cursor.fetchone()
                return vars(cls(*data)), 200
            except:
                return {'message': 'wine not found'}, 404

    @classmethod
    def load_wines(cls):
        with CursorFromConnectionFromPool() as cursor:
            cursor.execute('SELECT * FROM wine')
            all_data = cursor.fetchall()
            wines = []
            for data in all_data:
                wines.append(cls(*data))
        return wines, 200

    @classmethod
    def load_random_wine(cls):
        with CursorFromConnectionFromPool() as cursor:
            try:
                cursor.execute('SELECT * FROM wine ORDER BY random()')
                data = cursor.fetchone()
                return vars(cls(*data)), 200
            except:
                return {'message': 'wine not found'}, 404


