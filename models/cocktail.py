from database import CursorFromConnectionFromPool
from init import img_url


class CocktailModel:
    def __init__(self, _id, name, description, price, picture, id_day):
        self.id = _id
        self.name = name
        self.description = description
        self.price = str(price)
        self.picture = img_url + picture
        self.id_day = id_day

    def __repr__(self):
        return "<Cocktail: {}>".format(self.name)

    @classmethod
    def load_cocktail_by_id(cls, _id):
        with CursorFromConnectionFromPool() as cursor:
            try:
                cursor.execute('SELECT * FROM cocktail WHERE id=%s', (_id,))
                data = cursor.fetchone()
                return vars(cls(*data))
            except:
                return {'message': 'cocktail not found'}, 404

    @classmethod
    def load_cocktails_of_the_day(cls, id_day):
        with CursorFromConnectionFromPool() as cursor:
            try:
                cursor.execute('SELECT * FROM cocktail WHERE id_day=%s', (id_day,))
                all_data = cursor.fetchall()
                cocktails = []
                for data in all_data:
                    cocktails.append(vars(cls(*data)))
                return cocktails
            except:
                return {'message': 'cocktails of the day not found'}, 404

