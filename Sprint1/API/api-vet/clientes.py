from flask import Flask, Response, request
from flask_sqlalchemy import SQLAlchemy
import json

app = Flask('clientes')

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:Senai%40134@127.0.0.1/db_clinicavet'

mydb = SQLAlchemy(app)

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
        return Response(json.dumps({"error": "There was an issue updating the client", "details": str(e)}), status=400, mimetype='application/json')



app.run(port=5000, host="localhost", debug=True)