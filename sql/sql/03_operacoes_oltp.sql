USE faculdade_nova_horizonte;

-- ==========================================
-- CONSULTA 1
-- LISTAR ALUNOS E CURSOS
-- ==========================================

SELECT
    a.nome_aluno,
    c.nome_curso
FROM tb_alunos a
INNER JOIN tb_cursos c
    ON a.fk_id_curso = c.pk_id_curso;

-- ==========================================
-- CONSULTA 2
-- CONTRATOS ACIMA DA MÉDIA
-- ==========================================

SELECT
    a.nome_aluno,
    ce.valor_total
FROM tb_alunos a
INNER JOIN tb_contratos_educacionais ce
    ON a.pk_rgm = ce.fk_rgm
WHERE ce.valor_total > (
    SELECT AVG(valor_total)
    FROM tb_contratos_educacionais
);

-- ==========================================
-- CONSULTA 3
-- DISCIPLINAS COM CARGA HORÁRIA
-- ACIMA OU IGUAL À MÉDIA
-- ==========================================

SELECT
    d1.nome_disciplina,
    d1.carga_horaria
FROM tb_disciplinas d1
WHERE d1.carga_horaria >= (
    SELECT AVG(d2.carga_horaria)
    FROM tb_disciplinas d2
);
