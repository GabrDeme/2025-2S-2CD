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

# =================================================================================== #
# send_response -> creates a common response for the API requests
# =================================================================================== #
def send_response(status, content_type, content, message=False):
    body = {}
    body[content_type] = content

    if(message):
        body['message'] = message
    # dumps: converts a created dictionary (body) into json (json.dumps)
    return Response(json.dumps(body), status=status, mimetype='application/json')

# ========= GET ========= #
@app.route('/cars', methods=['GET'])

def car_selection():
    selected_car = Carros.query.all()

    json_car =[car.to_json()
               for car in selected_car]
    return send_response(200, "Car's list", json_car, "Faiz u elly")

@app.route('/cars/<int:id_car_>', methods=['GET'])
def car_selection_by_id(id_car_):
    selected_car = Carros.query.filter_by(id_carro = id_car_).first()
    json_car = selected_car.to_json()

    return send_response(200, f"Car with id: {id_car_}", json_car, "We've found!")

# ========= POST ========= #
@app.route('/car', methods=['POST'])
def car_creation():
    payload = request.get_json()
    try:
        car = Carros(
            id_carro = payload['id_carro'],
            marca = payload['marca'],
            modelo = payload['modelo'],
            ano = payload['ano'],
            valor = payload['valor'],
            cor = payload['cor'],
            numero_vendas = payload['numero_vendas']
        )
        mydb.session.add(car)
        mydb.session.commit()
        return send_response(201, "Created car", car.to_json(), "lalulu")
    except Exception as e:
        print('Error', e)
        return send_response(400, "Error", {}, "Creation error")

# ========= DELETE ========= #
@app.route('/car/<int:id_car_>', methods=['DELETE'])
def car_deletion(id_car_):
    car = Carros.query.filter_by(id_carro = id_car_).first()

    try:
        mydb.session.delete(car)
        mydb.session.commit()
        return send_response(200, "Deleted car", car.to_json(), "Successful deleted")

    except Exception as e:
        print('Error', e)
        return send_response(400, "Error", {}, "Deleting error")

# ========= PUT ========= #
@app.route('/car/<int:id_car_>', methods=['PUT'])
def car_updation(id_car_):
    car = Carros.query.filter_by(id_carro = id_car_).first()

    payload = request.get_json()
    try:
        if ('marca' in payload):        
            car.marca = payload['marca']
        if ('modelo' in payload):
            car.modelo = payload['modelo']
        if ('ano' in payload):
            car.ano = payload['ano']
        if ('valor' in payload):
            car.valor = payload['valor']
        if ('cor' in payload):
            car.cor = payload['cor']
        if ('numero_vendas' in payload):
            car.numero_vendas = payload['numero_vendas']

        mydb.session.add(car)
        mydb.session.commit()
        return send_response(200, "Updated car", car.to_json(), "Successful updated")
    
    except Exception as e:
        print('Error', e)
        return send_response(400, "Error", {}, "Updating error")


app.run(port=5000, host="localhost", debug=True)