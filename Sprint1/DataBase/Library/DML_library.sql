USE db_biblioteca;

SELECT * FROM tb_autores;

INSERT INTO tb_autores (id_autor, nome, data_nascimento) VALUES
(1, 'Christian Figueiredo', '1994-06-06'),
(2, 'Julia Tolezano', '1991-03-29'),
(3, 'Felix Kjellberg', '1989-10-24'),
(4, 'Maria Venture', '2000-06-08'),
(5, 'Felipe Castanhari', '1989-12-20');

SELECT * FROM tb_livros;

INSERT INTO tb_livros (id_livro, id_autor, titulo, ano_publicacao) VALUES
(1, 1, 'Tá Gravando. E Agora?', '2015-10-01'),
(2, 2, 'Manual de Sobrevivência do Jovem Moderno', '2016-05-15'),
(3, 3, 'Este Livro Ama Você', '2015-10-20'),
(4, 4, 'Caderno Sem Rimas da Maria', '2017-08-10'),
(5, 5, 'A Fantástica Fábrica de Cadáver', '2020-09-01');

SELECT * FROM tb_membros;

INSERT INTO tb_membros (id_membro, nome, data_adesao) VALUES
(1, 'Ana Beatriz Souza', '2023-01-10'),
(2, 'Lucas Fernandes', '2023-02-20'),
(3, 'Mariana Lima', '2023-03-15'),
(4, 'Rafael Torres', '2023-04-05'),
(5, 'Camila Oliveira', '2023-05-12');

SELECT * FROM tb_emprestimos;

INSERT INTO tb_emprestimos (id_emprestimo, id_membro, id_livro, data_emprestimo, data_devolucao) VALUES
(1, 1, 1, '2025-08-01', '2025-08-08'),
(2, 2, 3, '2025-08-02', NULL),
(3, 3, 2, '2025-07-25', '2025-08-05'),
(4, 4, 4, '2025-08-03', NULL),
(5, 5, 5, '2025-08-04', '2025-08-07');


SELECT * FROM tb_membros WHERE id_membro = '1';
UPDATE tb_membros SET nome = 'Anna Beatriz de Souza' WHERE id_membro = '1';

SELECT * FROM tb_emprestimos WHERE id_emprestimo = '3';
UPDATE tb_emprestimos SET data_devolucao = '2025-08-06' WHERE id_emprestimo = '3';

SELECT * FROM tb_livros WHERE id_livro = '4';
UPDATE tb_livros SET titulo = 'Não Faz Sentido!: Por Trás da Câmera', ano_publicacao = '2013-08-17' WHERE id_livro = '4';

SELECT * FROM tb_autores WHERE id_autor = '4';
UPDATE tb_autores SET nome = 'Felipe Neto', data_nascimento = '1988-01-21' WHERE id_autor = '4';