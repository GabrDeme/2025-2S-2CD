USE db_clinicavet;

-- EXERCICIO 3. Inserir ao menos 3 valores em cada tabela

INSERT INTO tb_veterinarios(id_veterinario, nome, especialidade, telefone) VALUES
(1, 'Jorge', 'Cirurgia', '123456789'),
(2, 'Ana', 'Dermatologia', '987654321'),
(3, 'Carlos', 'Clínico Geral', '555123456'),
(4, 'Fernanda', 'Odontologia', '444987654');

SELECT * FROM tb_veterinarios;

INSERT INTO tb_clientes(id_cliente, nome, endereco, telefone) VALUES
(1, 'João Silva', 'Rua A, 123', '911234567'),
(2, 'Maria Souza', 'Av. B, 456', '922345678'),
(3, 'Pedro Oliveira', 'Rua C, 789', '933456789'),
(4, 'Lucia Costa', 'Rua D, 101', '944567890');

SELECT * FROM tb_clientes;

INSERT INTO tb_pets(id_pet, id_cliente, nome, tipo, raca, data_nascimento) VALUES
(1, 1, 'Rex', 'Cachorro', 'Labrador', '2020-03-10'),
(2, 2, 'Mia', 'Gato', 'Persa', '2021-06-20'),
(3, 3, 'Bingo', 'Cachorro', 'Pitbull', '2019-08-15'),
(4, 4, 'Luna', 'Gato', 'Siamês', '2022-02-28');

SELECT * FROM tb_pets;

INSERT INTO tb_atendimentos(id_atendimento, id_pet, id_veterinario, data_atendimento, descricao) VALUES
(1, 1, 1, '2023-08-01', 'Consulta de rotina'),
(2, 2, 2, '2023-08-02', 'Tratamento de alergia'),
(3, 3, 3, '2023-08-03', 'Vacinacao'),
(4, 4, 4, '2023-08-04', 'Exame odontológico');

SELECT * FROM tb_atendimentos;

-- EXERCICIO 4. Realize ao menos 5 alterações (UPDATES)

SELECT * FROM tb_atendimentos WHERE id_atendimento = 2;
UPDATE tb_atendimentos SET descricao = 'Vacinação' WHERE id_atendimento = 2;

SELECT * FROM tb_atendimentos WHERE id_atendimento = 3;
UPDATE tb_atendimentos SET descricao = 'Tratamento de alergia' WHERE id_atendimento = 3;

SELECT * FROM tb_pets WHERE id_pet = 2;
UPDATE tb_pets SET raca = 'Colorido' WHERE id_pet = 2;

SELECT * FROM  tb_clientes WHERE id_cliente = 1;
UPDATE tb_clientes SET nome = 'Gorge' WHERE id_cliente = 1;

SELECT * FROM tb_veterinarios WHERE id_veterinario = 4;
UPDATE tb_veterinarios SET telefone = '944987654' WHERE id_veterinario = 4;