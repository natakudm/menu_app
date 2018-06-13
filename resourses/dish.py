from models.dish import DishModel
from flask_restful import Resource


class Dish(Resource):
    def get(self, _id):
        dish = DishModel.load_dish_by_id(_id)
        return {'dish': dish}, 200
