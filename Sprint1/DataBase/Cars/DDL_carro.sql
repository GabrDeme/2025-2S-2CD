CREATE DATABASE tb_carro;

USE tb_carro;

CREATE TABLE tb_carro (
id_carro INT(10) NOT NULL,
marca VARCHAR(100),
modelo VARCHAR(100),
ano INT(4), 
valor DECIMAL(10, 2),
cor VARCHAR(100),
PRIMARY KEY(id_carro)
);

CREATE TABLE tb_proprietario(
id_propriedade INT(10) NOT NULL,
nome VARCHAR(100),
id_carro INT(10) NOT NULL,
PRIMARY KEY(id_propriedade),
FOREIGN KEY(id_carro) REFERENCES tb_carro(id_carro)
);

ALTER TABLE tb_proprietario ADD idade INT(3);

CREATE TABLE tb_historico(
id_historico INT(10) NOT NULL,
data_modigicacao DATE,
id_carro INT(10) NOT NULL,
valor_anterior DECIMAL(10, 2),
valor_novo DECIMAL(10, 2),
PRIMARY KEY(id_historico),
FOREIGN KEY(id_carro) REFERENCES tb_carro(id_carro)
);

