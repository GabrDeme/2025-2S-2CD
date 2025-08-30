-- 1: Liste todos os estudantes cadastrados na tabela estudantes que pertencem ao curso de Ciência de Dados e foram matriculados em 2024.
SELECT 
	E.nome,
	C.nome AS curso,
    YEAR(E.data_matricula) AS ano_matricula
FROM tb_estudantes AS E
INNER JOIN tb_cursos AS C ON E.id_curso = C.id_curso
WHERE C.nome = "Ciência de Dados" AND YEAR(E.data_matricula) = 2024;

-- 2: Liste todos os professores que pertencem ao departamento de Ciência da Computação e possuem mais de 5 anos de experiência.
SELECT  
	nome,
    departamento,
    data_admissao
FROM tb_professores
WHERE YEAR(CURDATE()) - data_admissao >= 5;
    
-- 3: Liste os nomes dos estudantes e suas notas nas disciplinas, ordenados pela nota em ordem decrescente e, em caso de empate, pelo nome do estudante em ordem alfabética.

SELECT
    e.nome AS nome_estudante,
    n.nota
FROM tb_notas AS n
INNER JOIN tb_matriculas AS m
  ON n.id_matricula = m.id_matricula
INNER JOIN tb_estudantes AS e
  ON m.id_estudante = e.id_estudante
ORDER BY
    n.nota DESC,
    e.nome ASC;
    
    

-- 4: Encontre a média das notas dos estudantes no curso de Engenharia de Software.
SELECT ROUND(AVG(tb_notas.nota), 2) AS media_notas
FROM tb_notas
INNER JOIN tb_matriculas
  ON tb_notas.id_matricula = tb_matriculas.id_matricula
INNER JOIN tb_estudantes
  ON tb_matriculas.id_estudante = tb_estudantes.id_estudante
INNER JOIN tb_cursos
  ON tb_estudantes.id_curso = tb_cursos.id_curso
WHERE tb_cursos.nome = 'Engenharia da Computação';



-- 5: Liste os cursos que possuem mais de 50 estudantes matriculados. Exiba o nome do curso e o total de estudantes matriculados.
SELECT c.nome, COUNT(e.id_estudante) AS total_estudantes
FROM tb_cursos AS c
JOIN tb_estudantes AS e
  ON c.id_curso = e.id_curso
GROUP BY c.nome
HAVING COUNT(e.id_estudante) > 5;
	
