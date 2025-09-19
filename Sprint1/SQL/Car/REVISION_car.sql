USE db_carro;

-- 2. Quais proprietários tem o carro da marca FIAT?
SELECT
  P.nome AS nome_proprietario
FROM tb_proprietario AS P
WHERE id_carro IN (SELECT id_carro FROM tb_carros WHERE marca = "Motorola");

-- Proprietários de carros acima da média de preço: Liste o nome dos proprietários que possuem carros com valor acima da média de todos os carros.
SELECT * 
FROM tb_carro 
WHERE valor > (
  SELECT AVG(valor) 
  FROM tb_carro
);

-- Carros vendidos mais que a média geral de vendas: Liste os modelos de carro cujo numero_vendas seja maior que a média de vendas de todos os carros.
SELECT * FROM tb_historico;

ALTER TABLE tb_carro ADD numero_vendas INT;
UPDATE tb_carro SET numero_vendas = 120 WHERE id_carro = 1; -- Peugeot 308
UPDATE tb_carro SET numero_vendas = 450 WHERE id_carro = 2; -- Renault Kwid
UPDATE tb_carro SET numero_vendas = 310 WHERE id_carro = 3; -- Toyota Corolla
UPDATE tb_carro SET numero_vendas = 280 WHERE id_carro = 4; -- VW T-Cross
UPDATE tb_carro SET numero_vendas = 500 WHERE id_carro = 5; -- Fiat Argo
UPDATE tb_carro SET numero_vendas = 600 WHERE id_carro = 6; -- Chevrolet Onix

SELECT * 
FROM tb_carro
WHERE numero_vendas > (
  SELECT AVG(numero_vendas)
  FROM tb_carro
);

-- Carros que já tiveram valor acima da média histórica: Mostre os carros cujo valor já foi maior que a média de todos os valores registrados no histórico.
SELECT *
FROM tb_carro AS C
INNER JOIN tb_historico AS H
ON C.id_carro = H.id_carro
WHERE C.valor > (
SELECT 
  AVG(H.valor_anterior + H.valor_novo) / 2 
FROM tb_historico);

-- Média dos dois valores
SELECT 
  AVG(valor_anterior + valor_novo) / 2 AS media_valor
FROM tb_historico;

-- Carros sem histórico de alteração de preço: Liste os modelos de carros que não aparecem na tabela historico_preco.
SELECT * 
FROM tb_carro 
WHERE id_carro NOT IN (
SELECT id_carro
FROM tb_historico
);
