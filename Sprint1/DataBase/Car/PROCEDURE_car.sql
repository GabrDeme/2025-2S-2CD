USE db_carro;

-- STORED PROCEDURE
-- Quando precisa armazenar um bloco de código que pode envolver multiplas operações (INSERT, UPDATE, DELETE)

DELIMITER BANANA

-- IN -> Parâmetro de entrada
-- OUT -> Parâmetro de saída

-- Procedure que adiciona um novo carro na tabela
CREATE PROCEDURE GOIABA (
IN p_id_carro INT,
IN p_marca VARCHAR(100),
IN p_modelo VARCHAR(100),
IN p_ano INT, 
IN p_valor DECIMAL(10, 2),
IN p_cor VARCHAR(100),
IN p_numero_vendas INT
)
BEGIN 
  INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor , numero_vendas) 
  VALUES (p_id_carro, p_marca, p_modelo, p_ano, p_valor, p_cor , p_numero_vendas);
END BANANA


CALL GOIABA ('9', 'Fiat', 'Fastback', '2025', '130000', 'Strato', '52000');

-- Apagar Procedure
-- DROP PROCEDURE GOIABA; 