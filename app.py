import init
from flask import Flask
from flask_restful import Api
from models.restaurant import RestaurantModel
from resourses.restaurant import RestaurantList


app = Flask(__name__)
api = Api(app)

restaurants = RestaurantModel.load_restaurants()

api.add_resource(RestaurantList, '/restaurants')

app.run(port=5000, debug=True)
