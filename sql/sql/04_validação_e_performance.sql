USE faculdade_NH_dw;

-- 1. Validação de Soma (Crucial para nota 5.0 neste tópico)
SELECT 
    (SELECT SUM(valor_parcela) FROM faculdade_nova_horizonte.tb_parcelas_contrato WHERE data_pagamento IS NOT NULL) AS Soma_OLTP,
    (SELECT SUM(valor_pago) FROM fato_financeiro) AS Soma_OLAP;

-- 2. Performance: Criação de Índice
CREATE INDEX idx_fato_tempo ON fato_financeiro(fk_tempo);

-- 3. Uso do EXPLAIN
EXPLAIN SELECT * FROM fato_financeiro WHERE fk_tempo = 1;
