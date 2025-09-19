USE db_scholar;

INSERT INTO tb_cursos (id_curso, nome, duracao_anos) VALUES
(1, 'Engenharia da Computação', 5),
(2, 'Administração de Empresas', 4),
(3, 'Ciências da Nutrição', 4),
(4, 'Arquitetura e Urbanismo', 5),
(5, 'Medicina', 6),
(6, 'Física', 4),
(7, 'Jornalismo', 4),
(8, 'Direito', 5),
(9, 'Artes Visuais', 4),
(10, 'Letras', 4);

SELECT * FROM tb_cursos;

INSERT INTO tb_professores (id_professor, nome, departamento) VALUES
(1, 'Maria Silva', 'Tecnologia'),
(2, 'João Santos', 'Negócios'),
(3, 'Ana Pereira', 'Saúde'),
(4, 'Pedro Almeida', 'Engenharia'),
(5, 'Sofia Rodrigues', 'Artes'),
(6, 'Carlos Oliveira', 'Ciências Exatas'),
(7, 'Juliana Costa', 'Comunicação'),
(8, 'Ricardo Lima', 'Humanas'),
(9, 'Gabriela Fernandes', 'Educação'),
(10, 'Fernando Souza', 'Arquitetura');

UPDATE tb_professores
SET data_admissao = 2005
WHERE id_professor = 3;

SELECT * FROM tb_professores;

INSERT INTO tb_disciplinas (id_disciplina, id_curso, id_professor, nome) VALUES
(1, 10, 5, 'Introdução à Programação'),
(2, 8, 3, 'Cálculo Avançado'),
(3, 1, 9, 'Anatomia Humana'),
(4, 9, 1, 'Marketing Digital'),
(5, 7, 10, 'Desenho Técnico'),
(6, 2, 7, 'Química Orgânica'),
(7, 4, 8, 'Teoria do Estado'),
(8, 3, 2, 'História da Arte Moderna'),
(9, 6, 6, 'Língua Portuguesa e Gramática'),
(10, 5, 4, 'Física Quântica');

SELECT * FROM tb_disciplinas;

INSERT INTO tb_estudantes (id_estudante, id_curso, nome, data_nascimento, email, data_matricula) VALUES
(1, 1, 'Alice Costa', '2000-05-15', 'alice.c@email.com', '2022-01-20'),
(2, 7, 'Bruno Martins', '1999-11-23', 'bruno.m@email.com', '2022-02-10'),
(3, 4, 'Carla Oliveira', '2001-08-01', 'carla.o@email.com', '2022-03-05'),
(4, 10, 'Daniel Ferreira', '2000-02-10', 'daniel.f@email.com', '2022-01-18'),
(5, 2, 'Eduarda Santos', '2002-04-30', 'eduarda.s@email.com', '2022-02-25'),
(6, 9, 'Felipe Gomes', '2003-09-19', 'felipe.g@email.com', '2022-03-12'),
(7, 5, 'Mariana Lima', '2001-01-05', 'mariana.l@email.com', '2022-01-28'),
(8, 3, 'Gustavo Souza', '2000-07-28', 'gustavo.s@email.com', '2022-02-15'),
(9, 6, 'Patrícia Rocha', '2002-12-11', 'patricia.r@email.com', '2022-03-01'),
(10, 8, 'Rafaela Borges', '1999-03-08', 'rafaela.b@email.com', '2022-02-20');

SELECT * FROM tb_estudantes;

INSERT INTO tb_matriculas (id_matricula, id_estudante, id_disciplina, data_matricula) VALUES
(1, 5, 2, '2023-08-01'),
(2, 10, 8, '2023-08-05'),
(3, 2, 4, '2023-08-02'),
(4, 7, 1, '2023-08-03'),
(5, 3, 9, '2023-08-07'),
(6, 8, 5, '2023-08-04'),
(7, 1, 10, '2023-08-06'),
(8, 6, 3, '2023-08-09'),
(9, 4, 6, '2023-08-11'),
(10, 9, 7, '2023-08-10');

SELECT * FROM tb_matriculas;

INSERT INTO tb_notas (id_nota, id_matricula, nota, data_lancamento) VALUES
(1, 5, 7.50, '2023-09-01'),
(2, 8, 9.25, '2023-09-03'),
(3, 1, 6.80, '2023-09-05'),
(4, 10, 8.90, '2023-09-02'),
(5, 3, 5.50, '2023-09-07'),
(6, 6, 7.90, '2023-09-04'),
(7, 2, 9.80, '2023-09-09'),
(8, 9, 6.10, '2023-09-06'),
(9, 4, 8.00, '2023-09-11'),
(10, 7, 4.30, '2023-09-10');

SELECT * FROM tb_notas;
