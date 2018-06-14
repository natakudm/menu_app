from models.breakfast import BreakfastModel
from flask_restful import Resource


class Breakfast(Resource):
    @staticmethod
    def get(id_day):
        return BreakfastModel.load_breakfast(id_day)
