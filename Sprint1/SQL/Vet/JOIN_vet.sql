USE db_clinicavet;

-- INNER JOIN
-- 1. Liste o nome do pet, o nome do cliente e o telefone do cliente para todos os pets cadastrados.
SELECT 
  P.nome AS nome_pet, 
  C.nome AS nome_cliente, 
  C.telefone 
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
  V.nome AS nome_veterinario,
  P.nome AS nome_pet
FROM tb_atendimentos AS A 
INNER JOIN tb_pets AS P ON P.id_pet = A.id_pet
INNER JOIN tb_veterinarios AS V ON V.id_veterinario = A.id_veterinario
WHERE A.id_veterinario = 1;

-- 4. Mostre o nome do cliente, o nome do pet e a especialidade do veterinário para cada atendimento realizado.
SELECT 
	C.nome AS nome_cliente,
    P.nome AS nome_pet,
    V.especialidade 
FROM tb_atendimentos AS A
INNER JOIN tb_pets AS P ON P.id_pet = A.id_pet
INNER JOIN tb_clientes AS C ON C.id_cliente = P.id_cliente
INNER JOIN tb_veterinarios AS V ON V.id_veterinario = A.id_veterinario;

-- LEFT JOIN
-- 5. Liste todos os clientes e, caso existam, seus respectivos pets (mesmo que não tenham atendimento registrado).
SELECT 
  C.nome AS nome_cliente,
  P.nome AS nome_pet
FROM tb_clientes AS C
LEFT JOIN tb_pets AS P ON P.id_cliente = C.id_cliente;
  
-- 6. Liste todos os veterinários e, caso existam, os atendimentos realizados por eles.
SELECT 
  V.nome AS nome_veterinario,
  P.nome AS nome_pet,
  C.nome AS nome_cliente,
  A.data_atendimento,
  A.descricao
FROM tb_veterinarios AS V
LEFT JOIN tb_atendimentos AS A ON A.id_veterinario = V.id_veterinario -- Referencia o tb_veterinarios
LEFT JOIN tb_pets AS P ON P.id_pet = A.id_pet -- Referencia o tb_atendimentos
LEFT JOIN tb_clientes AS C ON C.id_cliente = P.id_cliente; -- Referenciao o tb_pets

-- RIGHT JOIN
-- 7. Liste todos os pets e, caso existam, seus respectivos donos (mesmo que alguns registros de clientes não existam).
SELECT 
	P.nome AS nome_pet,
    C.nome AS nome_cliente
FROM tb_pets AS P
RIGHT JOIN tb_clientes AS C ON C.id_cliente = P.id_cliente;

-- 8. Liste todos os atendimentos, mesmo que algum veterinário não esteja cadastrado na tabela.
SELECT 
  A.id_atendimento AS id,
  V.nome AS nome_veterinario,
  P.nome AS nome_pet,
  C.nome AS nome_cliente,
  A.data_atendimento,
  A.descricao
FROM tb_veterinarios AS V
RIGHT JOIN tb_atendimentos AS A ON A.id_veterinario = V.id_veterinario 
RIGHT JOIN tb_pets AS P ON P.id_pet = A.id_pet 
RIGHT JOIN tb_clientes AS C ON C.id_cliente = P.id_cliente;