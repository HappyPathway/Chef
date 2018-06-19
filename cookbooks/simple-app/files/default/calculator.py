from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

class Add(Resource):

    def post(self, operand1, operand2):
        return {'sum': int(operand1+operand2)}

class Multiply(Resource):

    def post(self, operand1, operand2):
        return {'product': int(operand1*operand2)}

api.add_resource(Add, '/add/<int:operand1>/<int:operand2>')
api.add_resource(Multiply, '/multi/<int:operand1>/<int:operand2>')

if __name__ == '__main__':
    from optparse import OptionParser

    parser = OptionParser()
    parser.add_option('--port')
    parser.add_option('--host')
    parser.add_option('--debug', dest='debug', action='store_true', default=False)
    opt, args = parser.parse_args()
    app.run(debug=opt.debug, host=opt.host, port=opt.port)