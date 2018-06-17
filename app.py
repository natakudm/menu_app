from flask import Flask, render_template
from flask_restful import Api
from resourses.restaurant import RestaurantList, Restaurant, TraditionalRestaurants
from resourses.index import IndexRepr
from resourses.wine import Wine, RandomWine
from resourses.cocktail import CocktailsOfTheDay
from resourses.dish import Dish, RandomDishFromMeal, LunchDishes, DinnerDishes, RandomDishes
from resourses.dinner_restaurant import DinnerRestaurant
from resourses.breakfast import Breakfast


app = Flask(__name__, static_folder='site')
api = Api(app)


@app.route('/')
def home():
    return render_template('index.html')

api.add_resource(IndexRepr, '/main')
api.add_resource(RestaurantList, '/restaurants')
api.add_resource(Restaurant, '/restaurant/<int:_id>')
api.add_resource(TraditionalRestaurants, '/traditional_restaurants')
api.add_resource(Wine, '/wine/<int:_id>')
api.add_resource(RandomWine, '/wine')
api.add_resource(CocktailsOfTheDay, '/<int:id_day>/cocktails')
api.add_resource(Dish, '/dish/<int:_id>')
api.add_resource(RandomDishFromMeal, '/<int:id_day>/<string:meal_name>/<string:restaurant_type>')
api.add_resource(RandomDishes, '/<int:id_day>/dishes')
api.add_resource(DinnerRestaurant, '/<int:id_day>/dinner')
api.add_resource(Breakfast, '/<int:id_day>/breakfast')
api.add_resource(LunchDishes, '/<int:id_day>/lunch')
api.add_resource(DinnerDishes, '/<int:id_day>/dinner/<string:restaurant_type>')


@app.after_request
def add_cors_headers(response):
    response.headers.add('Access-Control-Allow-Origin', '*')
    # response.headers.add('Access-Control-Allow-Credentials', 'true')
    # response.headers.add('Access-Control-Allow-Headers', 'Content-Type')
    # response.headers.add('Access-Control-Allow-Headers', 'Cache-Control')
    # response.headers.add('Access-Control-Allow-Headers', 'X-Requested-With')
    # response.headers.add('Access-Control-Allow-Headers', 'Authorization')
    response.headers.add('Access-Control-Allow-Methods', 'GET')  # POST, OPTIONS, PUT, DELETE')
    return response

if __name__ == '__main__':
    import init
    app.run(port=5000, debug=True)
