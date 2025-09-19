USE db_carro;

SELECT * FROM tb_carro;
SELECT modelo, cor FROM tb_carro;

SELECT * FROM tb_carro WHERE cor = 'Preto';
SELECT * FROM tb_carro WHERE modelo = 'Argo';

SELECT MIN(valor) FROM  tb_carro;
SELECT MAX(ano) FROM tb_carro;

SELECT COUNT(id_carro) FROM tb_carro;

SELECT SUM(valor) FROM tb_carro;

SELECT * FROM tb_carro ORDER BY modelo ASC;
SELECT * FROM tb_carro ORDER BY modelo DESC;

SELECT marca, COUNT(marca) AS total_registros FROM tb_carro WHERE ano BETWEEN '2022' AND '2025' GROUP BY marca;
SELECT marca, COUNT(marca) AS total_registros FROM tb_carro WHERE ano LIKE '2023' GROUP BY marca;
-- SELECT marca, COUNT(marca) AS total_registros FROM tb_carro WHERE ano = '2023' GROUP BY marca;
