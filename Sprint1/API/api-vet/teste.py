from flask import Flask, Response, request
from flask_sqlalchemy import SQLAlchemy
import json
from flask_restx import Api, Resource, fields  # Alterado de flask_restplus para flask_restx

app = Flask('clientes')

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:Senai%40134@127.0.0.1/db_clinicavet'
mydb = SQLAlchemy(app)

# Criação da API com Swagger
api = Api(app, version='1.0', title='Clientes e Pets API',
          description='Uma API para gerenciar clientes e pets com Swagger')

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

# Definindo o modelo de dados para o Swagger (para POST e PUT)
client_model = api.model('Client', {
    'id_cliente': fields.Integer(required=False, description='ID do cliente'),
    'nome': fields.String(required=True, description='Nome do cliente'),
    'endereco': fields.String(required=True, description='Endereço do cliente'),
    'telefone': fields.String(required=True, description='Telefone do cliente'),
})

# Rota de listagem de clientes
@api.route('/clients')
class ClientsList(Resource):
    def get(self):
        """Retorna todos os clientes"""
        all_clients = Clients.query.all()
        json_client = [client.to_json() for client in all_clients]
        return {"All client's list": json_client}, 200

    @api.expect(client_model)
    def post(self):
        """Adiciona um novo cliente"""
        payload = request.get_json()
        try:
            client = Clients(
                nome=payload['nome'],
                endereco=payload['endereco'],
                telefone=payload['telefone']
            )
            mydb.session.add(client)
            mydb.session.commit()
            return {"message": "Cliente adicionado", "client": client.to_json()}, 201
        except Exception as e:
            return {"message": "Erro ao adicionar cliente", "error": str(e)}, 400

# Rota de clientes específicos (PUT, DELETE)
@api.route('/client/<int:id_cliente>')
class ClientResource(Resource):
    def get(self, id_cliente):
        """Retorna um cliente específico pelo ID"""
        client = Clients.query.get_or_404(id_cliente)
        return client.to_json(), 200

    @api.expect(client_model)
    def put(self, id_cliente):
        """Atualiza os dados de um cliente"""
        client = Clients.query.get_or_404(id_cliente)
        payload = request.get_json()
        if 'nome' in payload:
            client.nome = payload['nome']
        if 'endereco' in payload:
            client.endereco = payload['endereco']
        if 'telefone' in payload:
            client.telefone = payload['telefone']
        mydb.session.commit()
        return {"message": "Cliente atualizado", "client": client.to_json()}, 200

    def delete(self, id_cliente):
        """Deleta um cliente"""
        client = Clients.query.get_or_404(id_cliente)
        mydb.session.delete(client)
        mydb.session.commit()
        return {"message": "Cliente deletado", "client": client.to_json()}, 200


# =========== #
# PETS TABLE
# =========== #

class Pets(mydb.Model):
    __tablename__ = 'tb_pets'
    id_pet = mydb.Column(mydb.Integer, primary_key=True)
    id_cliente = mydb.Column(mydb.Integer, mydb.ForeignKey('tb_clientes.id_cliente'), nullable=False)
    nome = mydb.Column(mydb.String(100))
    tipo = mydb.Column(mydb.String(100))
    raca = mydb.Column(mydb.String(100))
    data_nascimento = mydb.Column(mydb.String(100))
    idade = mydb.Column(mydb.String(100))

    def to_json(self):
        return {
            "id_pet": self.id_pet,
            "id_cliente": self.id_cliente,
            "nome": self.nome,
            "tipo": self.tipo,
            "raca": self.raca,
            "data_nascimento": str(self.data_nascimento),
            "idade": self.idade
        }

# Definindo o modelo de dados para Pets (para POST e PUT)
pet_model = api.model('Pet', {
    'id_pet': fields.Integer(required=False, description='ID do pet'),
    'id_cliente': fields.Integer(required=True, description='ID do cliente do pet'),
    'nome': fields.String(required=True, description='Nome do pet'),
    'tipo': fields.String(required=True, description='Tipo do pet'),
    'raca': fields.String(required=True, description='Raça do pet'),
    'data_nascimento': fields.String(required=True, description='Data de nascimento do pet'),
    'idade': fields.String(required=True, description='Idade do pet'),
})

# Rota de listagem de pets
@api.route('/pets')
class PetsList(Resource):
    def get(self):
        """Retorna todos os pets"""
        all_pets = Pets.query.all()
        json_pets = [pet.to_json() for pet in all_pets]
        return {"All pets' list": json_pets}, 200

    @api.expect(pet_model)
    def post(self):
        """Adiciona um novo pet"""
        payload = request.get_json()
        try:
            pet = Pets(
                id_cliente=payload['id_cliente'],
                nome=payload['nome'],
                tipo=payload['tipo'],
                raca=payload['raca'],
                data_nascimento=payload['data_nascimento'],
                idade=payload['idade']
            )
            mydb.session.add(pet)
            mydb.session.commit()
            return {"message": "Pet adicionado", "pet": pet.to_json()}, 201
        except Exception as e:
            return {"message": "Erro ao adicionar pet", "error": str(e)}, 400

# Rota de pets específicos (PUT, DELETE)
@api.route('/pet/<int:id_pet>')
class PetResource(Resource):
    def get(self, id_pet):
        """Retorna um pet específico pelo ID"""
        pet = Pets.query.get_or_404(id_pet)
        return pet.to_json(), 200

    @api.expect(pet_model)
    def put(self, id_pet):
        """Atualiza os dados de um pet"""
        pet = Pets.query.get_or_404(id_pet)
        payload = request.get_json()
        if 'nome' in payload:
            pet.nome = payload['nome']
        if 'tipo' in payload:
            pet.tipo = payload['tipo']
        if 'raca' in payload:
            pet.raca = payload['raca']
        if 'data_nascimento' in payload:
            pet.data_nascimento = payload['data_nascimento']
        if 'idade' in payload:
            pet.idade = payload['idade']
        mydb.session.commit()
        return {"message": "Pet atualizado", "pet": pet.to_json()}, 200

    def delete(self, id_pet):
        """Deleta um pet"""
        pet = Pets.query.get_or_404(id_pet)
        mydb.session.delete(pet)
        mydb.session.commit()
        return {"message": "Pet deletado", "pet": pet.to_json()}, 200


if __name__ == '__main__':
    app.run(port=5000, host="localhost", debug=True)
