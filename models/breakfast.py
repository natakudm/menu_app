from database import CursorFromConnectionFromPool
from init import img_url


class BreakfastModel:
    def __init__(self, name, description, restaurant_name, time_open, time_close, picture):
        self.name = name
        self.description = description
        self.restaurant_name = restaurant_name
        self.time_open = str(time_open)
        self.time_close = str(time_close)
        if picture is not None:
            self.picture = img_url + picture
        else:
            self.picture = None

    @classmethod
    def load_breakfast(cls, id_day):
        with CursorFromConnectionFromPool() as cursor:
            category = 'breakfast'
            cursor.execute('SELECT dish.name, dish.description, restaurant.name AS restaurant_name, '
                           'meal.time_open, meal.time_close,  dish.picture FROM public.dish '
                           'LEFT JOIN public.meal ON dish.id_meal = meal.id '
                           'LEFT JOIN public.restaurant ON meal.id_restaurant = restaurant.id '
                           'WHERE (dish.id_day = 0 or dish.id_day = %s) AND dish.category = \'breakfast\';', (id_day,))
            all_data = cursor.fetchall()
            dishes = []
            for data in all_data:
                dishes.append(cls(*data).__dict__)
        return dishes
