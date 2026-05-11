USE faculdade_nova_horizonte;

-- 1. Consulta Simples: Listar alunos e seus respectivos cursos (ADICIONADO FILTRO WHERE)
SELECT a.nome_aluno, c.nome_curso 
FROM tb_alunos a
JOIN tb_cursos c ON a.fk_id_curso = c.pk_id_curso
WHERE c.nome_curso = 'Análise e Desenvolvimento de Sistemas'; -- Filtro obrigatório [cite: 83]

-- 2. Subselect com Agregação: Alunos com contratos acima da média geral (Mantido)
SELECT a.nome_aluno, ce.valor_total
FROM tb_alunos a
JOIN tb_contratos_educacionais ce ON a.pk_rgm = ce.fk_rgm
WHERE ce.valor_total > (
    SELECT AVG(valor_total) FROM tb_contratos_educacionais
);

-- 3. Subselect Correlacionado (CORRIGIDO): 
-- Lista disciplinas cuja carga horária é maior ou igual à média da sua categoria (status)
SELECT d1.nome_disciplina, d1.carga_horaria, d1.status_disciplina
FROM tb_disciplinas d1
WHERE d1.carga_horaria >= (
    SELECT AVG(d2.carga_horaria) 
    FROM tb_disciplinas d2
    WHERE d2.status_disciplina = d1.status_disciplina -- Isso torna a query correlacionada
);
