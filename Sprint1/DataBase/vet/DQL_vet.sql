USE db_clinicavet;
-- EXERCICIO 5. Realize as seguintes consultas:

-- a. O pet com a data de nascimento mais antigo
SELECT MIN(data_nascimento) FROM  tb_pets;

-- b. O pet com a data de nascimento mais recente
SELECT MAX(data_nascimento) FROM tb_pets;

-- c. A quantidade de pets cadastrados no banco de dados
SELECT COUNT(id_pet) FROM tb_pets;

-- d. Ordene o nome dos pets em ordem crescente
SELECT * FROM tb_pets ORDER BY nome ASC;

-- e. Ordene o nome dos pets em ordem decrescente
SELECT * FROM tb_pets ORDER BY nome DESC;

-- f. Ordene o nome dos veterinários em ordem crescente
SELECT * FROM tb_veterinarios ORDER BY nome ASC;

-- g. Ordene o nome dos veterinários em ordem decrescente
SELECT * FROM tb_veterinarios ORDER BY nome DESC;

-- h. A data de atendimento mais antiga
SELECT MIN(data_atendimento) FROM tb_atendimentos;

-- i. A data de atendimento mais recente
SELECT MAX(data_atendimento) FROM tb_atendimentos;