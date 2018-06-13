from models.dinner_restaurants import DinnerRestaurantModel
from flask_restful import Resource


class DinnerRestaurant(Resource):
    def get(self, id_day):
        return DinnerRestaurantModel.load_dinner_restaurants(id_day)
