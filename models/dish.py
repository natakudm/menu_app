from database import CursorFromConnectionFromPool
from init import img_url


class DishModel:
    def __init__(self, _id, category, name, description, picture, wine_id, wine_name, restaurant_name, meal_name):
        self.id = _id
        self.category = category
        self.name = name
        self.description = description
        self.picture = picture
        self.recomended_wine = wine_id
        self.wine_name = wine_name
        self.restaurant_name = restaurant_name
        self.meal_name = meal_name

    def __repr__(self):
        return "<Dish name: {}>".format(self.name)

    def json(self):
        json_obj = {'id': self.id, 'category': self.category,'name': self.name, 'description': self.description,
                    'picture': img_url + self.picture, 'wine_id': self.recomended_wine, 'wine_name': self.wine_name,
                    'restaurant_name': self.restaurant_name, 'meal_name': self.meal_name}
        return json_obj

    @classmethod
    def load_dish_by_id(cls, _id):
        with CursorFromConnectionFromPool() as cursor:
            # try:
                cursor.execute('SELECT * FROM dish_view WHERE id=%s', (_id,))
                data = cursor.fetchone()
                return cls(*data).json()
           # except:
                return {'message': 'dish not found'}

    @classmethod
    def load_dishes(cls):
        with CursorFromConnectionFromPool() as cursor:
            cursor.execute('SELECT dish.id, dish.category, dish.name, dish.description, dish.picture, wine.id, '
                           'wine.name AS wine_name, restaurant.name AS restaurant_name, meal.name AS meal_name '
                           'FROM public.dish LEFT JOIN public.wine ON dish.recomended_wine = wine.id '
                           'LEFT JOIN public.meal ON dish.id_meal = meal.id LEFT JOIN public.restaurant ON '
                           'meal.id_restaurant = restaurant.id;')
            all_data = cursor.fetchall()
            dishes = []
            for data in all_data:
                dish = cls(*data).json()
                dishes.append(dish)
            return dishes
