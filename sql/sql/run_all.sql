-- Script unificado de instalação do projeto SisGESC
-- Este arquivo executa todas as fases do projeto sequencialmente.

SOURCE sql/01_estrutura_oltp.sql;
SOURCE sql/02__carga_idempotente_dml.sql;
SOURCE sql/03_operacoes_oltp.sql;
SOURCE sql/04_dw_e_etl.sql;
SOURCE sql/05_validacao_e_performance.sql;

SELECT 'Instalação e Validação do SisGESC concluída com sucesso!' AS Status;
