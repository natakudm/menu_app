from models.index import IndexModel
from flask_restful import Resource


class IndexRepr(Resource):
    def get(self):
        index_page = IndexModel.load_index()
        return index_page, 200
