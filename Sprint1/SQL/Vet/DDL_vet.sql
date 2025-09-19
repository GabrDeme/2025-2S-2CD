CREATE DATABASE db_clinicavet;

DROP DATABASE db_clinicavet;

USE db_clinicavet;

CREATE TABLE tb_veterinarios(
id_veterinario INT NOT NULL,
nome VARCHAR(100),
especialidade VARCHAR(50),
telefone VARCHAR(20),
PRIMARY KEY(id_veterinario)
);

SELECT * FROM tb_veterinarios;

CREATE TABLE tb_clientes(
id_cliente INT NOT NULL,
nome VARCHAR(100),
endereco VARCHAR(150),
telefone VARCHAR(20),
PRIMARY KEY(id_cliente)
);

SELECT * FROM tb_clientes;

CREATE TABLE tb_pets(
id_pet INT NOT NULL,
id_cliente INT,
nome VARCHAR(100),
tipo VARCHAR(50),
raca VARCHAR(50),
data_nascimento DATE,
PRIMARY KEY(id_pet),
FOREIGN KEY(id_cliente) REFERENCES tb_clientes(id_cliente)
);

SELECT * FROM tb_pets;

CREATE TABLE tb_atendimentos(
id_atendimento INT NOT NULL,
id_pet INT,
id_veterinario INT,
data_atendimento DATE,
descricao VARCHAR(255),
PRIMARY KEY(id_atendimento),
FOREIGN KEY(id_pet) REFERENCES tb_pets(id_pet),
FOREIGN KEY(id_veterinario) REFERENCES tb_veterinarios(id_veterinario)
);

SELECT * FROM tb_atendimentos;