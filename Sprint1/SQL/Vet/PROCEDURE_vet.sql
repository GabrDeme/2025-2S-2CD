USE db_clinicavet;

-- 1. Crie uma stored procedure que adicione um novo veterinário na tabela Veterinarios.
DELIMITER CAJU

CREATE PROCEDURE NovoVeterinario (
  IN p_id_veterinario INT,
  IN p_nome VARCHAR(100),
  IN p_especialidade VARCHAR(50),
  IN p_telefone VARCHAR(20)
)
BEGIN
  INSERT INTO tb_veterinarios (id_veterinario, nome, especialidade, telefone)
  VALUES (p_id_veterinario, p_nome, p_especialidade, p_telefone);
END CAJU

DELIMITER ;

CALL NovoVeterinario ('5', 'Ajax', 'Clínico Geal', '999888325');

SELECT * FROM tb_veterinarios;

DROP PROCEDURE NovoVeterinario;

-- 2. Crie uma stored procedure para atualizar os dados de um cliente, como nome, endereço e telefone.
DELIMITER UVA

CREATE PROCEDURE ClienteAtualizado (
  IN p_id_cliente INT,
  IN p_nome VARCHAR(100),
  IN p_endereco VARCHAR(150),
  IN p_telefone VARCHAR(20)
)
BEGIN 
  UPDATE tb_clientes
  SET nome = p_nome,
	  endereco = p_endereco,
      telefone = p_telefone
  WHERE id_cliente = p_id_cliente;
END UVA

DELIMITER ;

CALL ClienteAtualizado ('1', 'Jorge', 'Rua A², 123', '917234567');

SELECT * FROM tb_clientes;


-- 3. Crie uma stored procedure que registre um novo atendimento de um pet, verificando se o veterinário e o pet existem.
DELIMITER MORANGO

CREATE PROCEDURE AtendimentoPet (
  IN p_id_atendimento INT,
  IN p_id_pet INT,
  IN p_id_veterinario INT,
  IN p_data_atendimento DATE,
  IN p_descricao VARCHAR(255)
)
BEGIN
   IF EXISTS (SELECT 1 FROM tb_veterinarios WHERE id_veterinario = p_id_veterinario) AND
     EXISTS (SELECT 1 FROM tb_pets WHERE id_pet = p_id_pet) THEN

    INSERT INTO tb_atendimentos(id_atendimento, id_pet, id_veterinario, data_atendimento, descricao)
    VALUES (p_id_atendimento, p_id_pet, p_id_veterinario, p_data_atendimento, p_descricao);

  ELSE
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'ID de pet ou veterinário inválido.';
  END IF;
END MORANGO

DELIMITER ;

CALL AtendimentoPet ('5', '1', '3', '2025-07-24', 'Assado');
CALL AtendimentoPet ('5', '10', '3', '2025-07-24', 'Assado');

SELECT * FROM tb_atendimentos;