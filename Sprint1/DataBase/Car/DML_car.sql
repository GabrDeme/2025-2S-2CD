USE db_carro;

SELECT * FROM tb_carro;

INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor) VALUES (
  '1',
  'Peugeot',
  '308',
  '2020',
  300.00,
  'Prata'
);

INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor) VALUES (
	'2',
    'Renault',
    'Kwid',
    '2023',
    80000.00,
    '3'
);

INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor) VALUES
('2', 'Renault', 'Kwid', '2023', 80000.00, '3'),
('3', 'Toyota', 'Corolla', '2022', 125000.00, 'Preto'),
('4', 'Volkswagen', 'T-Cross', '2024', 145000.00, 'Branco'),
('5', 'Fiat', 'Argo', '2023', 78000.00, 'Vermelho'),
('6', 'Chevrolet', 'Onix', '2025', 88000.00, 'Azul');

SELECT * FROM tb_proprietario;

INSERT INTO tb_proprietario (id_propriedade, nome, id_carro, idade) VALUES (
'1',
'Jessica',
'1',
'25'
);

INSERT INTO tb_proprietario (id_propriedade, nome, id_carro, idade) VALUES 
('2','Will Smith','2','56'),
('3','Silvio Santos','3','93'),
('4','Jair Bolsonaro','4','70'),
('5','Lula','5','79'),
('6','Rodrigo Faro','6','51');


SELECT * FROM tb_proprietario WHERE id_propriedade = '7';
UPDATE tb_proprietario SET id_propriedade = '7' WHERE id_propriedade = '6';


SELECT * FROM tb_proprietario WHERE id_propriedade = '1';
UPDATE tb_proprietario SET nome = 'Celso Portiolli', idade = '58' WHERE id_propriedade = '1';


SELECT * FROM tb_carro WHERE id_carro = '2';
UPDATE tb_carro SET ano = 2024 WHERE id_carro = '2';


SELECT * FROM tb_carro WHERE id_carro = '6';
UPDATE tb_carro SET ano = 2025 WHERE id_carro = '6';