from models.restaurant import RestaurantModel
from flask_restful import Resource


class RestaurantList(Resource):
    def get(self):
        restaurants = RestaurantModel.load_restaurants()
        return restaurants


class Restaurant(Resource):
    def get(self, _id):
        restaurant = RestaurantModel.load_restaurant_by_id(_id)
        return restaurant


class TraditionalRestaurants(Resource):
    def get(self):
        traditional_restaurants = RestaurantModel.load_traditional_restaurants()
        return traditional_restaurants
