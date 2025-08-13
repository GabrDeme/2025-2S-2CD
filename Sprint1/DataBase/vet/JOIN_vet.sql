USE db_clinicavet;

-- INNER JOIN
-- 1. Liste o nome do pet, o nome do cliente e o telefone do cliente para todos os pets cadastrados.
SELECT P.nome AS nome_pet, C.nome AS nome_cliente, C.telefone 
FROM tb_pets AS P
INNER JOIN tb_clientes AS C
ON P.id_cliente = C.id_cliente;

-- 2. Liste a data, a descrição do atendimento, o nome do pet e o nome do veterinário responsável.
SELECT 
  A.data_atendimento,
  A.descricao,
  P.nome AS nome_pet,
  V.nome AS nome_veterinario
FROM tb_atendimentos AS A
INNER JOIN tb_pets AS P ON P.id_pet = A.id_pet
INNER JOIN tb_veterinarios AS V ON V.id_veterinario = A.id_veterinario;

-- 3. Liste o nome do veterinário e todos os pets que ele já atendeu.
SELECT 

-- 4. Mostre o nome do cliente, o nome do pet e a especialidade do veterinário para cada atendimento realizado.

-- LEFT JOIN
-- 5. Liste todos os clientes e, caso existam, seus respectivos pets (mesmo que não tenham atendimento registrado).
-- 6. Liste todos os veterinários e, caso existam, os atendimentos realizados por eles.

-- RIGHT JOIN
-- 7. Liste todos os pets e, caso existam, seus respectivos donos (mesmo que alguns registros de clientes não existam).
-- 8. Liste todos os atendimentos, mesmo que algum veterinário não esteja cadastrado na tabela.