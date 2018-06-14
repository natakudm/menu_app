from models.dish import DishModel
from flask_restful import Resource


class Dish(Resource):
    @staticmethod
    def get(_id):
        dish = DishModel.load_dish_by_id(_id)
        return dish


class RandomDish(Resource):
    @staticmethod
    def get(id_day, meal_name, restaurant_type):
        random_dish = DishModel.load_random_dish(id_day, meal_name, restaurant_type)
        return random_dish


class LunchDishes(Resource):
    @staticmethod
    def get(id_day):
        return DishModel.load_lunch_dishes(id_day)


class DinnerDishes(Resource):
    @staticmethod
    def get(id_day, restaurant_type):
        return DishModel.load_dinner_dises(id_day, restaurant_type)
