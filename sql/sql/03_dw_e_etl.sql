USE faculdade_NH_dw;

-- Dimensões
CREATE TABLE dim_aluno ( 
    sk_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nk_rgm INT NOT NULL,
    nome_aluno VARCHAR(120)
);

CREATE TABLE dim_tempo (
    sk_tempo INT AUTO_INCREMENT PRIMARY KEY,
    dia DATE NOT NULL
);

-- Fato Financeiro
CREATE TABLE fato_financeiro (
    sk_fato INT AUTO_INCREMENT PRIMARY KEY,
    fk_aluno INT NOT NULL,
    fk_tempo INT NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (fk_aluno) REFERENCES dim_aluno(sk_aluno),
    FOREIGN KEY (fk_tempo) REFERENCES dim_tempo(sk_tempo)
);

-- ETL
INSERT INTO dim_aluno (nk_rgm, nome_aluno) 
SELECT pk_rgm, nome_aluno FROM faculdade_nova_horizonte.tb_alunos;

INSERT INTO dim_tempo (dia) 
SELECT DISTINCT data_vencimento FROM faculdade_nova_horizonte.tb_parcelas_contrato;

INSERT INTO fato_financeiro (fk_aluno, fk_tempo, valor_pago)
SELECT 
    da.sk_aluno, 
    dt.sk_tempo, 
    p.valor_parcela
FROM faculdade_nova_horizonte.tb_parcelas_contrato p
JOIN dim_aluno da ON da.nk_rgm = (SELECT fk_rgm FROM faculdade_nova_horizonte.tb_contratos_educacionais WHERE pk_id_contrato = p.fk_id_contrato)
JOIN dim_tempo dt ON dt.dia = p.data_vencimento
WHERE p.data_pagamento IS NOT NULL;
