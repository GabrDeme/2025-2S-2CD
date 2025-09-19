USE db_clinicavet;

-- 1. Liste o nome do pet, o nome do cliente e telefone do cliente para todos os pets cadastrados
SELECT
  P.nome AS nome_pet,
  C.nome AS nome_cliente,
  C.telefone 
FROM tb_pets AS P
INNER JOIN tb_clientes AS C
ON P.id_cliente = C.id_cliente;
-------------------------------------------------------------------------------------------------------------------------
-- 				Muito interessanto notar que quando se usa o JOIN ele também da prioridade para os valores        	   --
-- Por exemplo se um id_cliente estiver presente em mais de um pet, esse id_cliente vai aparecer primeiro (INNER JOIN) --
-------------------------------------------------------------------------------------------------------------------------
SELECT
  P.nome AS nome_pet,
  C.nome AS nome_cliente,
  C.telefone 
FROM tb_pets AS P
LEFT JOIN tb_clientes AS C
ON P.id_cliente = C.id_cliente;


-- 2. Liste todos os clienes e, caso existam, seus respectivos pets (mesmo que não tenham atendimento registrado).
SELECT
  C.nome AS nome_cliente,
  P.nome AS nome_pet
FROM tb_clientes AS C
RIGHT JOIN tb_pets AS P
ON C.id_cliente = P.id_cliente;

-- 3. Liste todos os atendimentos, mesmo que algum veterinário não esteja cadastrado na tabela
SELECT * FROM tb_atendimentos AS A 
RIGHT JOIN tb_veterinarios AS V
ON A.id_veterinario = V.id_veterinario;
