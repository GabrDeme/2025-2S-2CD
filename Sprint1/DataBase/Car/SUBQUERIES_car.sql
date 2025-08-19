USE db_carro;

-- Subqueries - Carro

-- 1. Quais carros tem um preço acima da média

	-- 1º Passo: Calcular a média
SELECT AVG(valor) FROM tb_carro;

	-- 2º Passo: Verificar carros
SELECT * FROM tb_carro WHERE valor > 86050.000000;

-- RESULTADO 
SELECT * FROM tb_carro 
WHERE valor > (SELECT AVG(valor) FROM tb_carro);
