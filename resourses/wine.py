from models.wine import WineModel
from flask_restful import Resource


class Wine(Resource):
    @staticmethod
    def get(_id):
        wine = WineModel.load_wine_by_id(_id)
        return wine


class RandomWine(Resource):
    @staticmethod
    def get():
        return WineModel.load_random_wine()
