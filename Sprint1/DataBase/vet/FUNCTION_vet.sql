USE db_clinicavet;

-- 1. Crie uma função que receba o id_cliente e retorne a quantidade de pets que esse cliente possui.
DELIMITER JACA

CREATE FUNCTION quantidadePets(p_id_cliente INT)
RETURNS INT
READS SQL DATA
BEGIN
  DECLARE pet_count INT;
  SELECT COUNT(*) INTO pet_count
  FROM tb_pets
  WHERE id_cliente = p_id_cliente;
  RETURN pet_count;
END JACA

DELIMITER ;

SELECT quantidadePets(1) AS 'Quantidade de Pets';

-- DROP FUNCTION quantidadePets;

-- 2. Crie uma função que recebe o id_pet e retorna a data da última consulta do pet.
DELIMITER ABACATE

CREATE FUNCTION ultimaConsulta(p_id_pet INT)
RETURNS DATE
READS SQL DATA
BEGIN
  DECLARE ultima_data DATE;
  SELECT MAX(data_atendimento) INTO ultima_data
  FROM tb_atendimentos
  WHERE id_pet = p_id_pet;
  RETURN ultima_data;
END ABACATE

DELIMITER ;

SELECT ultimaConsulta(3) AS 'Última Consulta';

DROP FUNCTION ultimaConsulta;

-- 3. Crie uma função que receba o id_veterinario e retorne o número total de atendimentos feitos por ele.
DELIMITER PERA

CREATE FUNCTION totalAtendimentos(p_id_veterinario INT)
RETURNS INT
READS SQL DATA
BEGIN
  DECLARE atendimento_count INT;
  SELECT COUNT(*) INTO atendimento_count
  FROM tb_atendimentos
  WHERE id_veterinario = p_id_veterinario;
  RETURN atendimento_count;
END PERA

SELECT totalAtendimentos(3) AS 'Quantidade de Atendimetnos';
