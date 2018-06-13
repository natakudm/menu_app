from models.restaurant import RestaurantModel
from flask_restful import Resource


class RestaurantList(Resource):
    def get(self):
        restaurants = RestaurantModel.load_restaurants()
        return {'restaurants': restaurants}, 200
