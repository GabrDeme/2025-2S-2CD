USE db_biblioteca;

-- 1. Criar uma trigger que impeça a inserção de autores com menos de 18 anos.
INSERT INTO tb_autores(id_autor, nome, data_nascimento) VALUES
(6, 'Jerson', '2014-07-30');

SELECT * FROM tb_autores WHERE id_autor = "6";

DELETE FROM tb_autores WHERE id_autor = "6";

-- 2. Criar uma trigger que atualize automaticamente a data de devolução para 15 dias após a data de empréstimo.


-- 3. Criar uma trigger que impeça que um membro faça mais de 3 empréstimos ao mesmo tempo.
-- 4. Trigger de Atualização Automática da Data de Adesão
-- 5. Criar uma trigger que impeça a inserção de autores com nomes duplicados.