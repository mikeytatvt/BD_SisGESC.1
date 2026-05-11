USE faculdade_NH_dw;

-- 1. Validação Crucial de Soma (OLTP x OLAP) [cite: 24, 106]
SELECT 
    (SELECT SUM(valor_parcela) FROM faculdade_nova_horizonte.tb_parcelas_contrato WHERE data_pagamento IS NOT NULL) AS Soma_OLTP,
    (SELECT SUM(valor_pago) FROM fato_financeiro) AS Soma_OLAP;

-- 2. Performance: EXPLAIN ANTES da otimização
EXPLAIN SELECT * FROM fato_financeiro WHERE fk_tempo = 1;

-- 3. Criação de Índices Estratégicos [cite: 26, 107]
CREATE INDEX idx_fato_tempo ON fato_financeiro(fk_tempo);
CREATE INDEX idx_fato_aluno ON fato_financeiro(fk_aluno);

-- 4. Performance: EXPLAIN DEPOIS da otimização (Demonstra o ganho de performance) [cite: 108, 109]
EXPLAIN SELECT * FROM fato_financeiro WHERE fk_tempo = 1;
