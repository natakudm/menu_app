from flask import Flask
from flask_restful import Api
from resourses.restaurant import RestaurantList, Restaurant, TraditionalRestaurants
from resourses.index import IndexRepr
from resourses.dish import Dish, RandomDish


app = Flask(__name__)
api = Api(app)

api.add_resource(IndexRepr, '/')
api.add_resource(RestaurantList, '/restaurants')
api.add_resource(Restaurant, '/restaurant/<int:_id>')
api.add_resource(TraditionalRestaurants, '/traditional_restaurants')
api.add_resource(Dish, '/dish/<int:_id>')
api.add_resource(RandomDish, '/<int:id_day>/<string:meal_name>/<string:restaurant_type>')

if __name__ == '__main__':
    import init
    app.run(port=5000, debug=True)
