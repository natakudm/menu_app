from flask import Flask
from flask_restful import Api
from resourses.restaurant import RestaurantList
from resourses.index import IndexRepr
from resourses.dish import Dish


app = Flask(__name__)
api = Api(app)

# api.add_resource(RestaurantList, '/')
api.add_resource(RestaurantList, '/restaurants')
api.add_resource(IndexRepr, '/')
api.add_resource(Dish, '/dish/<int:_id>')

if __name__ == '__main__':
    import init
    app.run(port=5000, debug=True)
