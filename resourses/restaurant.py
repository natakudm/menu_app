from models.restaurant import RestaurantModel
from flask_restful import Resource

restaurants = RestaurantModel.load_restaurants()


class RestaurantList(Resource):
    def get(self):
        return {'restaurants': restaurants}, 200
