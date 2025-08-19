USE db_biblioteca;

-- EXERCÍCIO 5. Utilize subqueries para realizar as seguintes consultas:
-- a. Liste os autores que possuem livros com ano de publicação maior que a média de anos de publicação de todos os livros cadastrados.
SELECT 
  L.titulo,
  A.nome AS nome_autor,
  L.ano_publicacao
FROM tb_livros AS L
INNER JOIN tb_autores AS A ON L.id_autor = A.id_autor
WHERE ano_publicacao > (SELECT AVG(ano_publicacao) FROM tb_livros);

-- b. Liste os livros que foram emprestados ao menos uma vez.
SELECT 
  M.nome AS nome_caloteiro,
  L.titulo AS nome_livro,
  E.data_emprestimo,
  E.data_devolucao
FROM tb_emprestimos AS E
INNER JOIN tb_livros AS L ON E.id_livro = L.id_livro
INNER JOIN tb_membros AS M ON E.id_membro = M.id_membro
WHERE E.data_emprestimo IS NOT NULL;


-- c. Consulte os livros que ainda não foram emprestados.
SELECT 
  M.nome AS nome_caloteiro,
  L.titulo AS nome_livro,
  E.data_emprestimo,
  E.data_devolucao
FROM tb_emprestimos AS E
INNER JOIN tb_livros AS L ON E.id_livro = L.id_livro
INNER JOIN tb_membros AS M ON E.id_membro = M.id_membro
WHERE E.data_emprestimo IS NULL;