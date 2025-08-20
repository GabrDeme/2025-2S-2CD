USE db_carro;

SELECT @@autocommit; -- Verifica se o auto commit está ligado 

SET @@autocommit = OFF; -- Retira o auto commit

SELECT * FROM tb_carro;

INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor) VALUES (
  '7',
  'Macaco',
  '5',
  '2019',
  200000.00,
  'Prata'
);

ROLLBACK; -- Volta

START TRANSACTION;
	INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor) VALUES (
    '8',
	'Finn',
	'McMissil',
	'2011',
	200000.00,
	'Prata'
	);

COMMIT; 