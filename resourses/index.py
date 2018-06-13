from models.index import IndexModel
from flask_restful import Resource

index_page = IndexModel.load_index()


class IndexRepr(Resource):
    def get(self):
        return index_page, 200
