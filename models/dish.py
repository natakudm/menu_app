from database import CursorFromConnectionFromPool
from init import img_url


class DishModel:
    def __init__(self, _id, id_day, category, name, description, picture, wine_id, wine_name, restaurant_name,
                 meal_name, restaurant_type):
        self.id = _id
        self.id_day = id_day
        self.category = category
        self.name = name
        self.description = description
        self.picture = img_url + picture
        self.recomended_wine = wine_id
        self.wine_name = wine_name
        self.restaurant_name = restaurant_name
        self.restaurant_type = restaurant_type
        self.meal_name = meal_name

    def __repr__(self):
        return "<Dish name: {}>".format(self.name)

    # def json(self):
    #     json_obj = {'id': self.id, 'category': self.category,'name': self.name, 'description': self.description,
    #                 'picture': img_url + self.picture, 'wine_id': self.recomended_wine, 'wine_name': self.wine_name,
    #                 'restaurant_name': self.restaurant_name, 'restaurant_type': self.restaurant_type,
    #                 'meal_name': self.meal_name}
    #     return json_obj

    @classmethod
    def load_dish_by_id(cls, _id):
        with CursorFromConnectionFromPool() as cursor:
            try:
                cursor.execute('SELECT * FROM dish_view WHERE id=%s', (_id,))
                data = cursor.fetchone()
                return cls(*data).__dict__, 200
            except:
                return {'message': 'dish not found'}, 404

    @classmethod
    def load_dishes(cls):
        with CursorFromConnectionFromPool() as cursor:
            cursor.execute('SELECT * FROM dish_view')
            all_data = cursor.fetchall()
            dishes = []
            for data in all_data:
                dish = cls(*data).__dict__
                dishes.append(dish)
            return dishes, 200

    @classmethod
    def load_random_dish(cls, day, meal_name, restaurant_type):
        with CursorFromConnectionFromPool() as cursor:
            try:
                cursor.execute('SELECT * FROM dish_view '
                               'WHERE id_day = %s AND meal_name=%s AND restaurant_type=%s ORDER BY random();',
                               (day, meal_name, restaurant_type))
                data = cursor.fetchone()
                return vars(cls(*data)), 200
            except:
                return {'message': 'dish for {0} day {1} meal time and {2} restaurant type not found'.
                        format(day, meal_name, restaurant_type)}, 404
