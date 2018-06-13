from models.cocktail import CocktailModel
from flask_restful import Resource


class CocktailsOfTheDay(Resource):
    def get(self, id_day):
        cocktails = CocktailModel.load_cocktails_of_the_day(id_day)
        return cocktails
