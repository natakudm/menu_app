from database import Database
from flask import Flask
from flask_restful import Resource, Api
from models.restaurant import Restaurant

# Database.initialize(user='postgres', password='7777777', database='menu_app', host='localhost')
img_url = 'http://127.0.0.1:5000/static/img/'

app = Flask(__name__)
api = Api(app)


class Restaurant(Resource):
    def get(self, name):
        return {'restaurant': name}


api.add_resource(Restaurant, '/restaurant/<string:name>')

app.run(port=5000)
