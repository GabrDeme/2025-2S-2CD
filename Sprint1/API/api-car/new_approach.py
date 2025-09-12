from flask import Flask
from flask_restful import Api, Resource
from flask_sqlalchemy import SQLAlchemy

# Inicializando o Flask
app = Flask(__name__)

# Configuração do banco de dados
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:Senai%40134@127.0.0.1/db_carro'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False  # Para evitar warning

# Inicializando o banco de dados e o Flask-Restful
db = SQLAlchemy(app)
api = Api(app)

# Modelo de Carro
class Carros(db.Model):
    __tablename__ = 'tb_carro'
    id_carro = db.Column(db.Integer, primary_key=True)
    marca = db.Column(db.String(100))
    modelo = db.Column(db.String(100))
    ano = db.Column(db.String(100))
    cor = db.Column(db.String(100))
    valor = db.Column(db.String(100))
    numero_vendas = db.Column(db.String(100))

    def to_json(self):
        return {
            "id_carro": self.id_carro,
            "marca": self.marca,
            "modelo": self.modelo,
            "ano": self.ano,
            "valor": float(self.valor),
            "cor": self.cor,
            "numero_vendas": self.numero_vendas
        }

# Recurso para API de Carros
class CarResource(Resource):
    def get(self, id_carro=None):
        if id_carro:
            car = Carros.query.filter_by(id_carro=id_carro).first()
            if car:
                return car.to_json(), 200
            return {"message": "Car not found"}, 404
        cars = Carros.query.all()
        return [car.to_json() for car in cars], 200

# Adicionando a rota ao API
api.add_resource(CarResource, '/cars', '/cars/<int:id_carro>')

# Inicializando o servidor Flask
if __name__ == '__main__':
    app.run(port=5000, host="localhost", debug=True)
