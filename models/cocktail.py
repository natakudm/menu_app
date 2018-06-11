from database import CursorFromConnectionFromPool


class Cocktail:
    def __init__(self, _id, name, description, price, picture, id_day):
        self.id = _id
        self.name = name
        self.description = description
        self.price = price
        self.picture = picture
        self.id_day = id_day

    def __repr__(self):
        return "<Cocktail: {}>".format(self.name)

    @classmethod
    def load_cocktail_from_db_by_id(cls, _id):
        with CursorFromConnectionFromPool() as cursor:
            try:
                cursor.execute('SELECT * FROM cocktail WHERE id=%s', (_id,))
                data = cursor.fetchone()
                return cls(*data)
            except:
                return {'message': 'cocktail not found'}

    @classmethod
    def load_cocktails_from_db(cls):
        with CursorFromConnectionFromPool() as cursor:
            cursor.execute('SELECT * FROM cocktail')
            all_data = cursor.fetchall()
            for data in all_data:
                print(cls(*data))
