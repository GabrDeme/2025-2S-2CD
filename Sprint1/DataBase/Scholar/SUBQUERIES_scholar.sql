USE db_scholar;

-- Exercício 1: Liste os cursos que possuem mais de 5 disciplinas associadas.
SELECT 
    C.nome AS curso,
    (
        SELECT COUNT(*)
        FROM tb_disciplinas AS D
        WHERE C.id_curso = D.id_curso
    ) AS quantidade_disciplinas
FROM tb_cursos AS C
WHERE (
    SELECT COUNT(*)
    FROM tb_disciplinas AS D
    WHERE C.id_curso = D.id_curso
) > 5;
	
-- Exercício 2: Liste os estudantes que estão matriculados em mais disciplinas do que a média de disciplinas por estudante.


-- Exercício 3: Encontre os professores que ministram disciplinas com a maior média de notas.
-- exercício 4: Liste os estudantes que possuem pelo menos uma nota abaixo da média geral de notas.
-- Exercício 5: Liste os professores que não possuem nenhuma disciplina com notas abaixo de 7.