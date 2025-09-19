USE db_biblioteca;

-- INNER JOIN
-- 1. Liste o título do livro e o nome do autor.
SELECT 
  L.titulo,
  A.nome AS nome_autor
FROM tb_livros AS L
INNER JOIN tb_autores AS A ON A.id_autor = L.id_autor;

-- 2. Liste o título do livro, o nome do autor e o ano de publicação.
SELECT
  L.titulo,
  A.nome AS nome_autor,
  L.ano_publicacao
FROM tb_livros AS L
INNER JOIN tb_autores AS A ON A.id_autor = L.id_autor;

-- 3. Liste o nome do membro, o título do livro e a data de empréstimo.
SELECT
  M.nome AS nome_membro,
  L.titulo,
  E.data_emprestimo
FROM tb_emprestimos AS E
INNER JOIN tb_livros AS L ON E.id_livro = L.id_livro
INNER JOIN tb_membros AS M ON M.id_membro = E.id_emprestimo;

-- 4. Liste todos os empréstimos com o nome do membro, título do livro, nome do autor e data de devolução.
SELECT 
  M.nome AS nome_membro,
  L.titulo,
  A.nome AS nome_autor,
  E.data_devolucao
FROM tb_emprestimos AS E
INNER JOIN tb_membros AS M ON E.id_membro = M.id_membro 
INNER JOIN tb_livros AS L ON E.id_livro = L.id_livro
INNER JOIN tb_autores AS A ON L.id_autor = A.id_autor;

-- LEFT JOIN
-- 5. Liste todos os membros e, caso existam, os livros que eles já epegaram emprestado.
SELECT 
  E.id_emprestimo AS id,
  M.nome AS nome_membro,
  L.titulo
FROM tb_emprestimos AS E
LEFT JOIN tb_membros AS M ON M.id_membro = E.id_membro
LEFT JOIN tb_livros AS L ON L.id_livro = E.id_livro;

-- 6. Liste todos os autores e os livros que eles escreveram (mesmo que algum autor ainda não tenha livros cadastrados).
SELECT 
  A.nome AS nome_autor,
  L.titulo
FROM tb_livros AS L
LEFT JOIN tb_autores AS A ON L.id_autor = A.id_autor;
  

-- RIGHT JOIN
-- 7. Liste todos os livros e, caso tenham, o nome do autor correspondente.
SELECT 
  L.titulo,
  A.nome AS nome_autor
FROM tb_livros AS L
RIGHT JOIN tb_autores AS A ON L.id_autor = A.id_autor;

-- 8. Liste todos os livros e, caso tenham, os membros que os pegaram emprestado.
SELECT 
  E.id_emprestimo AS id,
  L.titulo,
  M.nome AS nome_membro
FROM tb_emprestimos AS E
RIGHT JOIN tb_membros AS M ON M.id_membro = E.id_membro
RIGHT JOIN tb_livros AS L ON L.id_livro = E.id_livro;
  
