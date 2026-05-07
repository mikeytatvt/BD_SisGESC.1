# Dicionário de Dados - SisGESC

Este documento descreve a estrutura das tabelas do banco de dados transacional (OLTP) e analítico (OLAP).

## 1. Banco de Dados Transacional (OLTP)

### Tabela: tb_unidades
*Propósito: Armazena as unidades físicas da instituição.*
- `pk_id_unidade` (INT): Chave primária, auto incremento.
- `nome_unidade` (VARCHAR): Nome do campus.

### Tabela: tb_cursos
*Propósito: Cadastro dos cursos oferecidos.*
- `pk_id_curso` (INT): Chave primária.
- `nome_curso` (VARCHAR): Nome da graduação.
- `fk_id_unidade` (INT): Chave estrangeira ligando à unidade.

### Tabela: tb_alunos
*Propósito: Cadastro de alunos da instituição.*
- `pk_rgm` (INT): Registro Geral de Matrícula (Chave Primária).
- `nome_aluno` (VARCHAR): Nome completo.
- `fk_id_curso` (INT): Curso em que o aluno está matriculado.

### Tabela: tb_contratos_educacionais
*Propósito: Gestão financeira dos contratos dos alunos.*
- `pk_id_contrato` (INT): ID do contrato.
- `valor_total` (DECIMAL): Valor total contratado pelo aluno.

---

## 2. Data Warehouse (OLAP - Star Schema)

### Tabela Fato: fato_financeiro
*Propósito: Armazena os fatos de pagamentos para análise.*
- `sk_fato` (INT): Surrogate Key (PK).
- `fk_aluno`, `fk_curso`, `fk_unidade`, `fk_tempo`: Chaves estrangeiras para as dimensões.
- `valor_pago` (DECIMAL): Métrica de valor financeiro processado.

### Dimensões: dim_aluno, dim_curso, dim_unidade, dim_tempo
*Propósito: Tabelas que fornecem contexto (quem, o quê, onde, quando) para os dados da Fato.*
