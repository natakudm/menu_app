from models.dinner_restaurants import DinnerRestaurantModel
from flask_restful import Resource


class DinnerRestaurant(Resource):
    @staticmethod
    def get(id_day):
        return DinnerRestaurantModel.load_dinner_restaurants(id_day)
