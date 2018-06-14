from models.restaurant import RestaurantModel
from flask_restful import Resource


class RestaurantList(Resource):
    @staticmethod
    def get():
        restaurants = RestaurantModel.load_restaurants()
        return restaurants


class Restaurant(Resource):
    @staticmethod
    def get(_id):
        restaurant = RestaurantModel.load_restaurant_by_id(_id)
        return restaurant


class TraditionalRestaurants(Resource):
    @staticmethod
    def get():
        traditional_restaurants = RestaurantModel.load_traditional_restaurants()
        return traditional_restaurants
