from flask import Flask, request, make_response, jsonify
from bd import cars

app = Flask('cars')

# ========= GET ========= #
@app.route('/car', methods=['GET'])

def getCars():
    return cars

@app.route('/car/<int:id_>', methods=['GET'])

def getCarsByID(id_):
    for car in cars:
        if car.get('id') == id_:
            return jsonify(car)

# ========= POST ========= #
@app.route('/car', methods=['POST'])
def postCar():
    car = request.json
    cars.append(car)
    return make_response(
        jsonify(
            message = "Make the L!!",
            car = car
        )
    )

# ========= DELETE ========= #
@app.route('/car/<int:id_>', methods=['DELETE'])
    
def deleteCarByID(id_):
    for index, car in enumerate(cars):
        if car.get('id') == id_:
            del cars[index]
            return jsonify({'message': f'Car with id {id_} deleted'})

# ========= UPDATE ========= #
@app.route('/car/<int:id_>', methods=['PUT'])

def updateCarByID(id_):
    new_car = request.get_json()
    for index, car in enumerate(cars):
        if car.get('id') == id_:
            cars[index].update(new_car)
            return jsonify(cars[index])

app.run(port=5000, host='localhost', debug=True)