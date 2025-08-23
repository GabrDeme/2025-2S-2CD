USE db_clinicavet;

-- 1. Crie um trigger que, sempre que um novo pet for inserido na tabela, calcule automaticamente a idade do pet com base em sua data de nascimento e armazene esse valor na coluna idade.

ALTER TABLE tb_pets ADD idade INT;

INSERT INTO tb_pets(id_pet, id_cliente, nome, tipo, raca, data_nascimento) VALUES
(6, 1, 'André Carlos Jr', 'Pássaro', 'Rolinha', '2024-07-08');

SELECT * FROM tb_pets WHERE id_pet = "6";

DELETE FROM tb_pets WHERE id_pet = "6";