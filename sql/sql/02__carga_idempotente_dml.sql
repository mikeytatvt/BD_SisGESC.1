-- Limpeza antes da carga (Idempotência)

DELETE FROM tb_parcelas_contrato;
DELETE FROM tb_contratos_educacionais;
DELETE FROM tb_matriculas;
DELETE FROM tb_alunos;

INSERT INTO tb_alunos (pk_rgm, nome_aluno, data_nascimento, cpf) VALUES 
(1, 'Lucas Silva', '2000-05-15', '12345678901'),
(2, 'Ana Costa', '1998-10-20', '98765432100');

INSERT INTO tb_disciplinas (pk_id_disciplina, nome_disciplina, carga_horaria) VALUES 
(1, 'Banco de Dados', 80),
(2, 'Programação', 80);

INSERT INTO tb_matriculas (pk_id_matricula, fk_rgm, fk_id_disciplina, data_matricula) VALUES 
(1, 1, 1, '2024-02-01'),
(2, 2, 2, '2024-02-01');

INSERT INTO tb_contratos_educacionais (pk_id_contrato, fk_rgm, valor_total) VALUES 
(1, 1, 1200.00),
(2, 2, 1200.00);

INSERT INTO tb_parcelas_contrato (fk_id_contrato, valor_parcela, data_vencimento, data_pagamento) VALUES 
(1, 600.00, '2024-03-10', '2024-03-05'),
(2, 600.00, '2024-03-10', '2024-03-10');

-- Evidência obrigatória
SELECT 'CONTAGEM ALUNOS' AS Tabela, COUNT(*) FROM tb_alunos;
