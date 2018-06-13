from models.wine import WineModel
from flask_restful import Resource


class Wine(Resource):
    def get(self, _id):
        wine = WineModel.load_wine_by_id(_id)
        return wine
