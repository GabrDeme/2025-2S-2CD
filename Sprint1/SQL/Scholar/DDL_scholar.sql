-- Criação do Banco de Dados 
CREATE DATABASE db_scholar;

DROP DATABASE db_scholar;

USE db_scholar;

-- ------------------------------------------------------------------------------------- --
-- 									  TABELA CURSOS                                		 --
-- ------------------------------------------------------------------------------------- --
-- - id: INT, Chave Primária, Auto-incremento. Identificador único do curso.      		 --
-- - nome: VARCHAR(100). Nome do curso (Obrigatório).                            	     --
-- - duracao_anos: INT. Duração do curso em anos (Obrigatório).                   		 --
-- ------------------------------------------------------------------------------------- --
CREATE TABLE tb_cursos(
	id_curso INT NOT NULL,
	nome VARCHAR(100) NULL,
	duracao_anos INT NOT NULL,
	PRIMARY KEY(id_curso)
);

SELECT * FROM tb_cursos;

-- ------------------------------------------------------------------------------------- --
-- 								    TABELA PROFESSORES 							   		 --
-- ------------------------------------------------------------------------------------- --
-- - id: INT, Chave Primária, Auto-incremento. Identificador único do professor.   		 --
-- - nome: VARCHAR(100). Nome do professor (Obrigatório).						 	     --
-- - departamento: VARCHAR(100). Departamento ao qual o professor pertence(Obrigatório)  --
-- ------------------------------------------------------------------------------------- --
CREATE TABLE tb_professores(
	id_professor INT NOT NULL,
	nome VARCHAR(100) NOT NULL,
	departamento VARCHAR(100) NOT NULL,
	PRIMARY KEY(id_professor)
);

SELECT * FROM tb_professores;

ALTER TABLE tb_professores 
ADD data_admissao YEAR;

-- ------------------------------------------------------------------------------------- --
-- 									TABELA DISCIPLINAS								     --
-- ------------------------------------------------------------------------------------- --
-- - id: INT, Chave Primária, Auto-incremento. Identificador único da disciplina.        --
-- - nome: VARCHAR(100). Nome da disciplina (Obrigatório).								 --
-- - curso_id: INT. Identificador do curso associado 							     	 --
--   (Chave Estrangeira para a tabela cursos).											 --
-- - professor_id: INT. Identificador do professor que ministra a disciplina 		     --
--   (Chave Estrangeira para a tabela professores).										 --
-- ------------------------------------------------------------------------------------- --
CREATE TABLE tb_disciplinas(
	id_disciplina INT NOT NULL,
    id_curso INT NOT NULL,
    id_professor INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_disciplina),
    FOREIGN KEY(id_curso) REFERENCES tb_cursos(id_curso),
    FOREIGN KEY(id_professor)REFERENCES tb_professores(id_professor)
);

SELECT * FROM tb_disciplinas;

-- ------------------------------------------------------------------------------------- --
-- 								  	TABELA ESTUDANTES 									 --
-- ------------------------------------------------------------------------------------- --
-- - id: INT, Chave Primária, Auto-incremento. Identificador único do estudante.         --
-- - nome: VARCHAR(100). Nome completo do estudante (Obrigatório).                       --
-- - data_nascimento: DATE. Data de nascimento do estudante.                             --
-- - email: VARCHAR(100). E-mail único do estudante (Obrigatório).                       --
-- - curso_id: INT. Identificador do curso associado    								 --
--   (Chave Estrangeira para a tabela cursos).                							 --                                                                --
-- - data_matricula: DATE. Data em que o estudante foi matriculado no curso (Obrigatório)--
-- ------------------------------------------------------------------------------------- --
CREATE TABLE tb_estudantes(
	id_estudante INT NOT NULL,
    id_curso INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(100) NOT NULL,
    data_matricula DATE NOT NULL,
    PRIMARY KEY(id_estudante),
    FOREIGN KEY(id_curso) REFERENCES tb_cursos(id_curso)    
);

SELECT * FROM tb_estudantes;

-- ------------------------------------------------------------------------------------- --
-- 							    	 TABELA MATRICULAS 							         --
-- ------------------------------------------------------------------------------------- --
-- - id: INT, Chave Primária, Auto-incremento. Identificador único da matrícula.         --
-- - estudante_id: INT. Identificador do estudante       								 --
--   (Chave Estrangeira para a tabela estudantes).       								 --                                                                        --
-- - disciplina_id: INT. Identificador da disciplina    								 --
--   (Chave Estrangeira para a tabela disciplinas).         							 --                                                                  --
-- - data_matricula: DATE. Data da matrícula no curso/disciplina.                        --
-- ------------------------------------------------------------------------------------- --
CREATE TABLE tb_matriculas(
	id_matricula INT NOT NULL,
    id_estudante INT NOT NULL,
    id_disciplina INT NOT NULL,
    data_matricula date,
    PRIMARY KEY(id_matricula),
    FOREIGN KEY(id_estudante) REFERENCES tb_estudantes(id_estudante),
    FOREIGN KEY(id_disciplina) REFERENCES tb_disciplinas(id_disciplina)
);

SELECT * FROM tb_matriculas;

-- ------------------------------------------------------------------------------------- --
-- 								   		TABELA NOTAS 								     --
-- ------------------------------------------------------------------------------------- --
-- - id: INT, Chave Primária, Auto-incremento. Identificador único da nota.              --
-- - matricula_id: INT. Identificador da matrícula  							         --
--   (Chave Estrangeira para a tabela matriculas).                                       --                              --
-- - nota: DECIMAL(5,2). Valor da nota obtida pelo estudante 							 --
-- - data_lancamento: DATE. Data em que a nota foi registrada.                           --
-- ------------------------------------------------------------------------------------- --
CREATE TABLE tb_notas(
	id_nota INT NOT NULL,
    id_matricula INT NOT NULL,
    nota DECIMAL(5, 2),
    data_lancamento DATE,
    PRIMARY KEY(id_nota),
    FOREIGN KEY(id_matricula) REFERENCES tb_matriculas(id_matricula)
);

SELECT * FROM tb_notas;