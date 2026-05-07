USE faculdade_nova_horizonte;

-- Limpeza antes da carga (Garante Idempotência)
DELETE FROM tb_parcelas_contrato;
DELETE FROM tb_contratos_educacionais;
DELETE FROM tb_matriculas;
DELETE FROM tb_alunos;
DELETE FROM tb_cursos;
DELETE FROM tb_unidades;
DELETE FROM tb_disciplinas;
DELETE FROM tb_funcionarios;

-- Inserção de Dados Operacionais
INSERT INTO tb_unidades (pk_id_unidade, nome_unidade) VALUES 
(1, 'Campus Central'), (2, 'Campus Norte');

INSERT INTO tb_cursos (pk_id_curso, nome_curso, fk_id_unidade) VALUES 
(1, 'Análise e Desenvolvimento de Sistemas', 1),
(2, 'Administração', 2);

INSERT INTO tb_alunos (pk_rgm, nome_aluno, data_nascimento, cpf, fk_id_curso) VALUES 
(1, 'Lucas Silva', '2000-05-15', '12345678901', 1),
(2, 'Ana Costa', '1998-10-20', '98765432100', 2);

INSERT INTO tb_disciplinas (pk_id_disciplina, nome_disciplina, carga_horaria) VALUES 
(1, 'Banco de Dados', 80),
(2, 'Programação', 80);

INSERT INTO tb_matriculas (pk_id_matricula, fk_rgm, fk_id_disciplina, data_matricula) VALUES 
(1, 1, 1, '2024-02-01'),
(2, 2, 2, '2024-02-01');

INSERT INTO tb_contratos_educacionais (pk_id_contrato, fk_rgm, valor_total) VALUES 
(1, 1, 1200.00),
(2, 2, 1500.00);

INSERT INTO tb_parcelas_contrato (fk_id_contrato, valor_parcela, data_vencimento, data_pagamento) VALUES 
(1, 600.00, '2024-03-10', '2024-03-05'),
(2, 750.00, '2024-03-10', '2024-03-10');

INSERT INTO tb_funcionarios (nome_funcionario, cargo, data_admissao) VALUES 
('Carlos Mendes', 'Secretário Acadêmico', '2020-01-15');

-- Evidência obrigatória: CONTAGEM DE TODAS AS TABELAS
SELECT 'tb_unidades' AS Tabela, COUNT(*) AS Total_Registros FROM tb_unidades
UNION ALL
SELECT 'tb_cursos', COUNT(*) FROM tb_cursos
UNION ALL
SELECT 'tb_alunos', COUNT(*) FROM tb_alunos
UNION ALL
SELECT 'tb_disciplinas', COUNT(*) FROM tb_disciplinas
UNION ALL
SELECT 'tb_matriculas', COUNT(*) FROM tb_matriculas
UNION ALL
SELECT 'tb_contratos_educacionais', COUNT(*) FROM tb_contratos_educacionais
UNION ALL
SELECT 'tb_parcelas_contrato', COUNT(*) FROM tb_parcelas_contrato
UNION ALL
SELECT 'tb_funcionarios', COUNT(*) FROM tb_funcionarios;
