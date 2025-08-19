CREATE DATABASE db_biblioteca;

DROP DATABASE db_biblioteca;

USE db_biblioteca;

CREATE TABLE tb_autores(
id_autor INT NOT NULL,
nome VARCHAR(100),
data_nascimento DATE,
PRIMARY KEY(id_autor)
);

CREATE TABLE tb_livros(
id_livro INT NOT NULL,
id_autor INT NOT NULL,
titulo VARCHAR(50),
ano_publicacao DATE,
PRIMARY KEY(id_livro),
FOREIGN KEY(id_autor) REFERENCES tb_autores(id_autor)
);

CREATE TABLE tb_membros(
id_membro INT NOT NULL,
nome VARCHAR(100),
data_adesao DATE,
PRIMARY KEY(id_membro)
);

CREATE TABLE tb_emprestimos(
id_emprestimo INT NOT NULL,
id_membro INT NOT NULL,
id_livro INT NOT NULL,
data_emprestimo DATE,
data_devolucao DATE, 
PRIMARY KEY(id_emprestimo),
FOREIGN KEY(id_membro) REFERENCES tb_membros(id_membro),
FOREIGN KEY(id_livro) REFERENCES tb_livros(id_livro)
);