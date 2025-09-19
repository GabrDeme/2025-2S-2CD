USE db_carro;

-- FUNCTIONs são usadas para SELECTs e cálculos

DELIMITER MELANCIA 

CREATE FUNCTION calcularDesconto(valor DECIMAL(10, 2), desconto DECIMAL(5, 2))
RETURNS DECIMAL (10, 2)
READS SQL DATA
BEGIN
  RETURN valor - (valor * desconto / 100);
END MELANCIA

DELIMITER ;

SELECT marca, modelo, valor, calcularDesconto(valor, 20) AS 'Valor Com Desconto'
FROM tb_carro;

DROP FUNCTION calcularDesconto;