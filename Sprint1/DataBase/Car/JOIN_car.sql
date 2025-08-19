USE db_carro;

-- INNER JOIN
SELECT * FROM tb_proprietario AS P
INNER JOIN tb_carro AS C
ON P.id_carro = C.id_carro;

-- LEFT JOIN
SELECT * FROM tb_proprietario AS P
LEFT JOIN tb_carro AS C
ON P.id_carro = C.id_carro;

-- RIGHT JOIN
SELECT * FROM tb_carro AS C
RIGHT JOIN tb_proprietario AS P
ON P.id_carro = C.id_carro; -- Esse daqui não muda nada