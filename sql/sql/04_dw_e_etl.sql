USE faculdade_NH_dw;

-- ==========================================
-- DIMENSÕES (Star Schema)
-- ==========================================
CREATE TABLE dim_aluno ( 
    sk_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nk_rgm INT NOT NULL,
    nome_aluno VARCHAR(120)
);

CREATE TABLE dim_curso (
    sk_curso INT AUTO_INCREMENT PRIMARY KEY,
    nk_id_curso INT NOT NULL,
    nome_curso VARCHAR(100)
);

CREATE TABLE dim_unidade (
    sk_unidade INT AUTO_INCREMENT PRIMARY KEY,
    nk_id_unidade INT NOT NULL,
    nome_unidade VARCHAR(100)
);

CREATE TABLE dim_tempo (
    sk_tempo INT AUTO_INCREMENT PRIMARY KEY,
    dia DATE NOT NULL
);

-- ==========================================
-- TABELA FATO
-- ==========================================
CREATE TABLE fato_financeiro (
    sk_fato INT AUTO_INCREMENT PRIMARY KEY,
    fk_aluno INT NOT NULL,
    fk_curso INT NOT NULL,
    fk_unidade INT NOT NULL,
    fk_tempo INT NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (fk_aluno) REFERENCES dim_aluno(sk_aluno),
    FOREIGN KEY (fk_curso) REFERENCES dim_curso(sk_curso),
    FOREIGN KEY (fk_unidade) REFERENCES dim_unidade(sk_unidade),
    FOREIGN KEY (fk_tempo) REFERENCES dim_tempo(sk_tempo)
);

-- ==========================================
-- PROCESSO ETL (Extração, Transformação e Carga)
-- ==========================================
INSERT INTO dim_aluno (nk_rgm, nome_aluno) 
SELECT pk_rgm, nome_aluno FROM faculdade_nova_horizonte.tb_alunos;

INSERT INTO dim_curso (nk_id_curso, nome_curso)
SELECT pk_id_curso, nome_curso FROM faculdade_nova_horizonte.tb_cursos;

INSERT INTO dim_unidade (nk_id_unidade, nome_unidade)
SELECT pk_id_unidade, nome_unidade FROM faculdade_nova_horizonte.tb_unidades;

INSERT INTO dim_tempo (dia) 
SELECT DISTINCT data_vencimento FROM faculdade_nova_horizonte.tb_parcelas_contrato;

-- Carga na Fato Financeiro relacionando todas as dimensões
INSERT INTO fato_financeiro (fk_aluno, fk_curso, fk_unidade, fk_tempo, valor_pago)
SELECT 
    da.sk_aluno,
    dc.sk_curso,
    du.sk_unidade,
    dt.sk_tempo, 
    p.valor_parcela
FROM faculdade_nova_horizonte.tb_parcelas_contrato p
JOIN faculdade_nova_horizonte.tb_contratos_educacionais ce ON p.fk_id_contrato = ce.pk_id_contrato
JOIN faculdade_nova_horizonte.tb_alunos a ON ce.fk_rgm = a.pk_rgm
JOIN faculdade_nova_horizonte.tb_cursos c ON a.fk_id_curso = c.pk_id_curso
JOIN dim_aluno da ON da.nk_rgm = a.pk_rgm
JOIN dim_curso dc ON dc.nk_id_curso = c.pk_id_curso
JOIN dim_unidade du ON du.nk_id_unidade = c.fk_id_unidade
JOIN dim_tempo dt ON dt.dia = p.data_vencimento
WHERE p.data_pagamento IS NOT NULL;
