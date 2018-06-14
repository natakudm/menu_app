from models.index import IndexModel
from flask_restful import Resource


class IndexRepr(Resource):
    @staticmethod
    def get():
        index_page = IndexModel.load_index()
        return index_page, 200
