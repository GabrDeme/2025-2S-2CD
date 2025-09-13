from flask import Flask, Response, request
from flask_sqlalchemy import SQLAlchemy
import json

app = Flask('clientes')

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:Senai%40134@127.0.0.1/db_clinicavet'

mydb = SQLAlchemy(app)

# =========== #
# CLIENTS TABLE
# =========== #

class Clients(mydb.Model):
    __tablename__ = 'tb_clientes'
    id_cliente = mydb.Column(mydb.Integer, primary_key=True)
    nome = mydb.Column(mydb.String(100))
    endereco = mydb.Column(mydb.String(100))
    telefone = mydb.Column(mydb.String(100))

    def to_json(self):
        return {
            "id_cliente": self.id_cliente,
            "nome": self.nome,
            "endereco": self.endereco,
            "telefone": self.telefone
        }
    
@app.route('/clients', methods=['GET'])

def list_clients():
    all_clients = Clients.query.all()

    json_client = [client.to_json()
                   for client in all_clients]
    return Response(json.dumps({"All client's list": json_client}), status=200, mimetype='application/json')

@app.route('/clients', methods=['POST'])

def insert_client():
    payload = request.get_json()
    try:
        client = Clients(
            id_cliente = payload['id_cliente'],
            nome = payload['nome'],
            endereco = payload['endereco'],
            telefone = payload['telefone']
        )

        mydb.session.add(client)
        mydb.session.commit()

        return Response(json.dumps({"This client was successfully added in the Database": client.to_json()}), status=201, mimetype='application/json')
    except Exception as e:
        print('Error', e)
        return Response(json.dumps({"The client couldn't be added in the Database": {}}), status=400, mimetype='application/json')

@app.route('/client/<int:id_client_>', methods=['DELETE'])
def remove_client(id_client_):
    client = Clients.query.filter_by(id_cliente = id_client_).first()

    try:
        mydb.session.delete(client)
        mydb.session.commit()

        return Response(json.dumps({"This client was successfully deleted from the Database": client.to_json()}), status=200, mimetype='application/json')
    except Exception as e:
        print("Error", e)
        return Response(json.dumps({"The client couldn't be deleted from the Database": {}}), status=400, mimetype='application/json')

@app.route('/client/<int:id_client_>', methods=['PUT'])
def update_client(id_client_):
    client = Clients.query.filter_by(id_cliente = id_client_).first()

    payload = request.get_json()
    try:
        if('nome' in payload):
            client.nome = payload['nome']
        if('endereco' in payload):
            client.endereco = payload['endereco']
        if('telefone' in payload):
            client.telefone = payload['telefone']

        mydb.session.add(client)
        mydb.session.commit()

        return Response(json.dumps({"This client was successfully updated in the Database": client.to_json()}), status=200, mimetype='application/json')
    except Exception as e:
        print('Error', e)
        return Response(json.dumps({"error": "The client couldn't be updated in the Database", "details": str(e)}), status=400, mimetype='application/json')



# =========== #
# PETS TABLE
# =========== #

class Pets(mydb.Model):
    __tablename__ = 'tb_pets'
    id_pet = mydb.Column(mydb.Integer, primary_key=True)
    id_cliente = mydb.Column(mydb.Integer, mydb.ForeignKey('tb_cliente.id_cliente'), nullable=False)
    nome = mydb.Column(mydb.String(100))
    tipo = mydb.Column(mydb.String(100))
    raca = mydb.Column(mydb.String(100))
    data_nascimento = mydb.Column(mydb.String(100))
    idade = mydb.Column(mydb.String(100))
    
    def to_json(self):
        return {
            "id_pet": self.id_cliente,
            "id_cliente": self.id_cliente,
            "nome": self.nome,
            "tipo": self.tipo,
            "raca": self.raca,
            "data_nascimento": str(self.data_nascimento),
            "idade": self.idade
        }


@app.route('/pets', methods=['GET'])

def list_pets():
    all_pets = Pets.query.all()

    json_pets = [pet.to_json()
                 for pet in all_pets]
    return Response(json.dumps({"All pets' list": json_pets}), status=200, mimetype='application/json')


@app.route('/pets', methods=['POST'])

def insert_pet():
    payload = request.get_json()
    try:
        pet = Pets(
            id_pet = payload['id_pet'],
            id_cliente = payload['id_cliente'],
            nome = payload['nome'],
            tipo = payload['tipo'],
            raca = payload['raca'],
            data_nascimento = payload['data_nascimento'],
            idade = payload['idade']
        )
        mydb.session.add(pet)
        mydb.session.commit()
        
        return Response(json.dumps({"The pet was succefully inserted in the Database": pet.to_json()}), status=201, mimetype='application/json')
    except Exception as e:
        print('Error', e)
        return Response(json.dumps({"The pet couldn't be inserted in the Database": {}}), status=400, mimetype='application/json')
    
@app.route('/pets/<int:id_pet_>', methods=['DELETE'])
def remove_pet(id_pet_):
    pet = Pets.query.filter_by(id_pet = id_pet_).first()
    
    try:
        mydb.session.delete(pet)
        mydb.session.commit()

        return Response(json.dumps({"This pet was succefully deleted from the Database": pet.to_json()}), status=200, mimetype='application/json')
    except Exception as e:
        print('Error', e)
        return Response(json.dumps({"The pet was succefully deleted form the Database": pet.to_json()}), status=400, mimetype='application/json')

@app.route('/pets/<int:id_pet_>', methods=['PUT'])
def update_pet(id_pet_):
    pet = Pets.query.filter_by(id_pet = id_pet_).first()

    payload = request.get_json()
    try:
        if ("nome" in payload):
            pet.nome = payload['nome']
            pet.tipo = payload['tipo']
            pet.raca = payload['raca']
            pet.data_nascimento = payload['data_nascimento']
            pet.idade = payload['idade']
    except Exception as e:
        print('Error', e)
        return Response(json.dumps({"This pet was succefully deleted in teh Database": pet.to_json}), status=200, mimetype='application/json')


# =========== #
# VETERINARIAN TABLE
# =========== #








app.run(port=5000, host="localhost", debug=True)