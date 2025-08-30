USE db_biblioteca;

-- 1. Crie uma função que recebe o id_autor e retorna a idade do autor com base na data de nascimento.
DELIMITER PITAIA

CREATE FUNCTION idadeAutor(p_id_autor INT)
RETURNS INT
READS SQL DATA
BEGIN
  DECLARE v_idade INT;
  SELECT TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())
  INTO v_idade
  FROM tb_autores
  WHERE id_autor = p_id_autor;
  RETURN v_idade;
END PITAIA

DELIMITER ;

SELECT idadeAutor(3) AS 'Idade do Autor';

DROP FUNCTION idadeAutor;

-- 2. Crie uma função que recebe o id_autor e retorna a quantidade de livros escritos por esse autor.
DELIMITER MAMAO

CREATE FUNCTION quantidadeLivros(p_id_autor INT)
RETURNS INT
READS SQL DATA
BEGIN
  DECLARE livros_count INT;
  SELECT COUNT(*) INTO livros_count
  FROM tb_livros
  WHERE id_autor = p_id_autor

-- 3. Crie uma função que recebe duas datas e retorna o total de empréstimos realizados nesse período.
DELIMITER GUARARA

CREATE FUNCTION emprestimoPorPeriodo(emprestimo DATE, devolucao DATE)
RETURNS INT
READS SQL DATA
BEGIN
	RETURN (SELECT COUNT(id_emprestimo) FROM tb_emprestimos
			WHERE data_emprestimo BETWEEN emprestimo AND devolucao);
END GUARARA

DELIMITER ;

SELECT emprestimoPorPeriodo('2020-01-05', '2024-12-12');

-- Exercicio 4. Crie uma função que retorna a média de dias em que os livros foram emprestados.
DELIMITER CIDRA
CREATE FUNCTION mediaDiasEmprestimos()
RETURNS DECIMAL(10,2)
READS SQL DATA 
BEGIN
	RETURN ( SELECT AVG(TIMESTAMPDIFF(DAY, data_emprestimo, data_devolucao)) FROM tb_emprestimos);
END GUARARA

DELIMITER ;

SELECT mediaDiasEmprestimos();