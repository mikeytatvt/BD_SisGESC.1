USE faculdade_nova_horizonte;

-- ==========================================
-- 1. LIMPEZA (Garante a Idempotência)
-- Ordem inversa das FKs para evitar erros
-- ==========================================
DELETE FROM tb_faltas;
DELETE FROM tb_notas;
DELETE FROM tb_inadimplencia;
DELETE FROM tb_parcelas_contrato;
DELETE FROM tb_contratos_educacionais;
DELETE FROM tb_matriculas;
DELETE FROM tb_grade_horaria;
DELETE FROM tb_alunos;
DELETE FROM tb_turmas;
DELETE FROM tb_professores;
DELETE FROM tb_cursos;
DELETE FROM tb_unidades;
DELETE FROM tb_disciplinas;
DELETE FROM tb_funcionarios;

-- ==========================================
-- 2. INSERÇÃO DE DADOS (DML)
-- ==========================================

-- Acadêmico Base
INSERT INTO tb_unidades (pk_id_unidade, nome_unidade) VALUES 
(1, 'Campus Central'), (2, 'Campus Norte'); [cite: 10]

INSERT INTO tb_cursos (pk_id_curso, nome_curso, fk_id_unidade) VALUES 
(1, 'Análise e Desenvolvimento de Sistemas', 1),
(2, 'Administração', 2);

INSERT INTO tb_professores (pk_id_professor, nome_professor, especialidade) VALUES
(1, 'Dr. Roberto Mendes', 'Banco de Dados'),
(2, 'Mestre Carla Souza', 'Programação');

INSERT INTO tb_turmas (pk_id_turma, nome_turma, ano, semestre, fk_id_curso) VALUES
(1, 'ADS-2024-1A', 2024, 1, 1),
(2, 'ADM-2024-1B', 2024, 1, 2);

INSERT INTO tb_alunos (pk_rgm, nome_aluno, data_nascimento, cpf, fk_id_curso) VALUES 
(1, 'Lucas Silva', '2000-05-15', '12345678901', 1),
(2, 'Ana Costa', '1998-10-20', '98765432100', 2); [cite: 10]

INSERT INTO tb_disciplinas (pk_id_disciplina, nome_disciplina, carga_horaria) VALUES 
(1, 'Banco de Dados', 80),
(2, 'Programação', 80); [cite: 10]

-- Pedagógico
INSERT INTO tb_grade_horaria (fk_id_turma, fk_id_disciplina, fk_id_professor, dia_semana) VALUES
(1, 1, 1, 'Segunda-feira'),
(2, 2, 2, 'Quarta-feira');

INSERT INTO tb_matriculas (pk_id_matricula, fk_rgm, fk_id_disciplina, data_matricula) VALUES 
(1, 1, 1, '2024-02-01'),
(2, 2, 2, '2024-02-01'); [cite: 10]

INSERT INTO tb_notas (fk_rgm, fk_id_disciplina, nota) VALUES 
(1, 1, 8.5), (2, 2, 9.0);

INSERT INTO tb_faltas (fk_rgm, fk_id_disciplina, quantidade_faltas) VALUES 
(1, 1, 2), (2, 2, 0);

-- Financeiro
INSERT INTO tb_contratos_educacionais (pk_id_contrato, fk_rgm, valor_total) VALUES 
(1, 1, 1200.00),
(2, 2, 1500.00); [cite: 10]

INSERT INTO tb_parcelas_contrato (fk_id_contrato, valor_parcela, data_vencimento, data_pagamento) VALUES 
(1, 600.00, '2024-03-10', '2024-03-05'),
(2, 750.00, '2024-03-10', '2024-03-10'); [cite: 10]

-- RH
INSERT INTO tb_funcionarios (nome_funcionario, cargo, data_admissao) VALUES 
('Carlos Mendes', 'Secretário Acadêmico', '2020-01-15'); [cite: 10]

-- ==========================================
-- 3. EVIDÊNCIA DE IDEMPOTÊNCIA
-- Executar este bloco após cada carga
-- ==========================================
SELECT 'tb_unidades' AS Tabela, COUNT(*) AS Total FROM tb_unidades
UNION ALL
SELECT 'tb_cursos', COUNT(*) FROM tb_cursos
UNION ALL
SELECT 'tb_professores', COUNT(*) FROM tb_professores
UNION ALL
SELECT 'tb_turmas', COUNT(*) FROM tb_turmas
UNION ALL
SELECT 'tb_alunos', COUNT(*) FROM tb_alunos
UNION ALL
SELECT 'tb_disciplinas', COUNT(*) FROM tb_disciplinas
UNION ALL
SELECT 'tb_grade_horaria', COUNT(*) FROM tb_grade_horaria
UNION ALL
SELECT 'tb_matriculas', COUNT(*) FROM tb_matriculas
UNION ALL
SELECT 'tb_notas', COUNT(*) FROM tb_notas
UNION ALL
SELECT 'tb_faltas', COUNT(*) FROM tb_faltas
UNION ALL
SELECT 'tb_contratos_educacionais', COUNT(*) FROM tb_contratos_educacionais
UNION ALL
SELECT 'tb_parcelas_contrato', COUNT(*) FROM tb_parcelas_contrato
UNION ALL
SELECT 'tb_funcionarios', COUNT(*) FROM tb_funcionarios; [cite: 13, 71]
