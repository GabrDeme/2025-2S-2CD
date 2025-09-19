USE db_biblioteca;

-- 1. Crie uma stored procedure que insira um novo autor na tabela Autores.
DELIMITER BANANA

CREATE PROCEDURE NovoAutor (
  IN p_id_autor INT,
  IN p_nome VARCHAR(100),
  IN p_data_nascimento DATE
)
BEGIN 
  INSERT INTO tb_autores (id_autor, nome, data_nascimento)
  VALUES (p_id_autor, p_nome, p_data_nascimento);
END BANANA

DELIMITER ;
CALL NovoAutor ('10', 'Umberto Andrady', '1949-05-07');

SELECT * FROM tb_autores;

-- DROP PROCEDURE NovoAutor;

-- 2. Crie uma stored procedure para atualizar a data de devolução de um empréstimo já registrado.
DELIMITER MACA

CREATE PROCEDURE EmprestimoAtualizado (
  IN p_id_emprestimo INT,
  IN p_data_devolucao DATE 
)
BEGIN 
  UPDATE tb_emprestimos 
  SET data_devolucao = p_data_devolucao
  WHERE id_emprestimo = p_id_emprestimo;
END MACA

DELIMITER ;
CALL EmprestimoAtualizado ('4', '2025-08-25');

SELECT * FROM tb_emprestimos;

-- DROP PROCEDURE EmprestimoAtualizado;

-- 3. Crie uma stored procedure que consulte todos os livros emprestados por um determinado membro, retornando os títulos dos livros e as datas de empréstimo.
DELIMITER ABACAXI

CREATE PROCEDURE ConsultaMembro (
  IN p_id_membro INT
)
BEGIN
  SELECT 
    M.nome AS nome_membro,
    L.titulo,
    E.data_emprestimo
  FROM tb_emprestimos AS E
  INNER JOIN tb_membros AS M ON E.id_membro = M.id_membro
  INNER JOIN tb_livros AS L ON E.id_livro = L.id_livro
  WHERE p_id_membro = E.id_membro;
END ABACAXI

DELIMITER ;

CALL ConsultaMembro ('1');

-- DROP PROCEDURE ConsultaMembro;

