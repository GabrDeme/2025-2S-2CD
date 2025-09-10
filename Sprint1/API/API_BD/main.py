# SQL_ALCHEMY - pip install flask_sqlalchemy
# Allows SQL connection
from flask import Flask, Response, request
from flask_sqlalchemy import SQLAlchemy
import json

app = Flask('carros')


# =================================================================================== #
# Database connection
# @ can't be used, so we use %40
# When the db is MySQL, must use this structure:
#
# 'mysql://{user}:{password}@{localhost}/{database}'
# =================================================================================== #
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:Senai%40134@127.0.0.1/db_carro'

mydb = SQLAlchemy(app)

# Data model which matchs to the db table 
class Carros(mydb.Model):
    __tablename__ = 'tb_carro'
    id_carro = mydb.Column(mydb.Integer, primary_key=True)
    marca = mydb.Column(mydb.String(100))
    modelo = mydb.Column(mydb.String(100))
    ano = mydb.Column(mydb.String(100))
    cor = mydb.Column(mydb.String(100))
    valor = mydb.Column(mydb.String(100))
    numero_vendas = mydb.Column(mydb.String(100))

    # Converts object to json 
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

# ========= GET ========= #
@app.route('/cars', methods=['GET'])

def car_selection():
    select_car = Carros.query.all()

    json_car =[car.to_json()
               for car in select_car]
    return send_response(200, "Car's list", json_car, "Faiz u elly")


def send_response(status, content_type, content, message=False):
    body = {}
    body[content_type] = content

    if(message):
        body['message'] = message
    # dumps: converts a created dictionary (body) into json (json.dumps)
    return Response(json.dumps(body), status=status, mimetype='application/json')

app.run(port=5000, host="localhost", debug=True)