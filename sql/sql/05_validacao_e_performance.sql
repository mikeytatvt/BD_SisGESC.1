USE faculdade_NH_dw;

-- 1. Validação Crucial de Soma (OLTP x OLAP)
SELECT 
    (SELECT SUM(valor_parcela) FROM faculdade_nova_horizonte.tb_parcelas_contrato WHERE data_pagamento IS NOT NULL) AS Soma_OLTP,
    (SELECT SUM(valor_pago) FROM fato_financeiro) AS Soma_OLAP;

-- 2. Performance: Criação de Índice Estratégico
CREATE INDEX idx_fato_tempo ON fato_financeiro(fk_tempo);
CREATE INDEX idx_fato_aluno ON fato_financeiro(fk_aluno);

-- 3. Uso do EXPLAIN para demonstrar ganho de performance
EXPLAIN SELECT * FROM fato_financeiro WHERE fk_tempo = 1;
