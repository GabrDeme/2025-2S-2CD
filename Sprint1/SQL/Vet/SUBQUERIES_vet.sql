USE db_clinicavet;

-- VETERINARIA - SUBQUERIE

-- 1. Pet mais velho: Liste o nome e a data de nascimento do pet mais antigo da clínica usando uma subquery.
SELECT
  nome,
  data_nascimento
FROM tb_pets
WHERE data_nascimento = (SELECT MIN(data_nascimento) FROM tb_pets);
  
-- 2. Pet mais novo: Liste o nome e a data de nascimento do pet mais novo da clínica usando uma subquery.
SELECT 
  nome,
  data_nascimento
FROM tb_pets
WHERE data_nascimento = (SELECT MAX(data_nascimento) FROM tb_pets);

-- 3. Veterinários do último atendimento: Liste o nome de todos os veterinários que realizaram atendimentos na data mais recente registrada.
SELECT 
  V.nome,
  A.data_atendimento
FROM tb_atendimentos AS A
INNER JOIN tb_veterinarios AS V ON A.id_veterinario = V.id_veterinario
WHERE data_atendimento = (SELECT MAX(data_atendimento) FROM tb_atendimentos);

-- 4. Clientes com mais de um pet: Liste os nomes dos clientes que possuem mais de um pet, utilizando uma subquery para contar a quantidade.
SELECT
  C.nome AS nome_cliente
FROM tb_clientes AS C
WHERE C.id_cliente IN (
  SELECT P.id_cliente
  FROM tb_pets AS P
  GROUP BY P.id_cliente
  HAVING COUNT(*) > 1
);

-- 5. Pets nunca atendidos: Liste o nome de todos os pets que ainda não passaram por atendimento, utilizando uma subquery para verificar.
SELECT 
  P.nome AS nome_pet
FROM tb_pets AS P
WHERE P.id_pet NOT IN (
  SELECT A.id_pet 
  FROM tb_atendimentos AS A
  GROUP BY A.id_pet
  HAVING COUNT(*) != 0
);

-- 6. Quantidade de pets por cliente: Para cada cliente, mostre o nome e a quantidade de pets cadastrados, utilizando uma subquery no SELECT.
SELECT
  C.nome AS nome_cliente,
  (
    SELECT COUNT(*)
    FROM tb_pets AS P
    WHERE P.id_cliente = C.id_cliente
  ) AS quantidade_pets
FROM tb_clientes AS C;

-- 7. Último veterinário cadastrado: Liste todos os atendimentos realizados pelo veterinário mais recentemente cadastrado no sistema.
SELECT 
  A.id_atendimento,
  A.data_atendimento,
  A.descricao,
  P.nome AS nome_pet,
  V.nome AS nome_veterinario
FROM tb_atendimentos AS A
INNER JOIN tb_pets AS P ON P.id_pet = A.id_pet
INNER JOIN tb_veterinarios AS V ON V.id_veterinario = A.id_veterinario
WHERE V.id_veterinario = (
  SELECT id_veterinario
  FROM tb_veterinarios
  ORDER BY id_veterinario DESC
  LIMIT 1
);


-- 8. Atendimento mais antigo – dados completos: Liste todas as informações do atendimento mais antigo registrado, usando uma subquery para identificar a data.
SELECT 
  A.id_atendimento,
  A.data_atendimento,
  A.descricao,
  P.nome AS nome_pet,
  V.nome AS nome_veterinario
FROM tb_atendimentos AS A
INNER JOIN tb_pets AS P ON P.id_pet = A.id_pet
INNER JOIN tb_veterinarios AS V ON V.id_veterinario = A.id_veterinario
WHERE V.id_veterinario = (
  SELECT id_veterinario
  FROM tb_veterinarios
  ORDER BY id_veterinario ASC
  LIMIT 1
);

-- 9. Clientes que já foram atendidos por mais de um veterinário diferente: Liste os nomes dos clientes que já tiveram atendimentos com pelo menos dois veterinários distintos, usando subquery.
SELECT nome
FROM tb_clientes
WHERE id_cliente IN (
    SELECT P.id_cliente
    FROM tb_atendimentos A
    JOIN tb_pets p ON A.id_pet = P.id_pet
    GROUP BY P.id_cliente
    HAVING COUNT(DISTINCT A.id_veterinario) >= 2
);

  

-- 10. Pets atendidos pelo veterinário mais solicitado: Liste os nomes dos pets que foram atendidos pelo veterinário que mais realizou atendimentos na clínica, usando subquery para identificar esse veterinário.
SELECT P.nome
FROM tb_pets P
JOIN tb_atendimentos A ON P.id_pet = A.id_pet
WHERE A.id_veterinario = (
    SELECT id_veterinario
    FROM tb_atendimentos
    GROUP BY id_veterinario
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

