from models.cocktail import CocktailModel
from flask_restful import Resource


class CocktailsOfTheDay(Resource):
    @staticmethod
    def get(id_day):
        cocktails = CocktailModel.load_cocktails_of_the_day(id_day)
        return cocktails
