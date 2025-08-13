USE db_biblioteca;

-- Realize as seguintes consultas:
-- a. O livro com a data de publicação mais antigo
SELECT MIN(YEAR(ano_publicacao)) FROM tb_livros;

-- b. O livro com a data de publicação mais recente
SELECT MAX(YEAR(ano_publicacao)) FROM tb_livros;

-- c. A quantidade de livros cadastrados no banco de dados
SELECT COUNT(id_livro) from tb_livros;

-- d. Consulte apenas os livros que possuam a data de devolução em 18-07-2024
SELECT id_livro, data_devolucao FROM tb_emprestimos LEFT JOIN tb_membros ON tb_emprestimos.id_membro = tb_membros.id_membro WHERE data_devolucao = '2025-08-07';

-- e. Ordene o nome dos autores em ordem crescente
SELECT * FROM tb_autores ORDER BY nome ASC;

-- f. Ordene o nome dos lvros em ordem descrescente
SELECT * FROM tb_autores ORDER BY nome DESC;