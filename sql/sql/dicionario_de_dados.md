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
- `data_nascimento` (VARCHAR): Data de nascimento.
- `cpf` (VARCHAR): CPF do aluno.
- `email` (VARCHAR): Email do aluno.
- `sexo` (CHAR): Sexo do aluno.  
- `fk_id_curso` (INT): Curso em que o aluno está matriculado.

  ### Tabela: tb_disciplinas
  *Propósito: Cadastro das disciplinas dos cursos.*
- `pk_id_disciplina` (INT): ID da disciplina.
- `nome_disciplina` (VARCHAR): Nome da disciplina.
- `carga_horaria` (INT): Carga horária da disciplina do curso.
- `status_disciplina` (VARCHAR): Status da disciplina do aluno.

  ### Tabela: tb_matriculas
  *Propósito: Cadastro da matrícula do aluno.*
- `pk_id_matricula` (INT): ID da matrícula. 
- `fk_rgm` (INT): Chave estrangeira ligando o RGM.
- `fk_id_disciplina` (INT): Chave estrangeira ligando o ID da disciplina.
- `periodo_letivo` (VARCHAR): Período letivo que o aluno está cursando.
- `data_matricula` (DATE): Data da matricula.

### Tabela: tb_contratos_educacionais
*Propósito: Cadastro e gestão financeira dos contratos dos alunos.*
- `pk_id_contrato` (INT): ID do contrato.
- `fk_rgm` (INT): Chave estrangeira ligando o RGM do aluno.
- `valor_total` (DECIMAL): Valor total contratado pelo aluno.
- `status_contrato` (VARCHAR): Status do contrato do aluno.

### Tabela: tb_parcelas_contrato
*Propósito: Criação e gestão financeira das parcelas do contrato.*
- `pk_id_parcela` (INT): ID das parcelas do contrato.
- `fk_id_contrato` (INT): Chave estrangeira ligando o ID do contrato.
- `valor_parcela` (DECIMAL): Valor das parcelas.
- `data_vencimento` (DATE): Data de vencimeto das parcelas.
- `data_pagamento` (DATE): Data que foi realizado o pagamento das parcelas.

### Tabela: tb_funcionarios
*Propósito: Cadastro de funcionários.*
- `pk_id_funcionario` (INT): ID do funcionário.
- `nome_funcionario` (VARCHAR): Nome do funcionário.
- `cargo` (VARCHAR): Cargo do funcionário.
- `data_admissao` (DATE): Data de admissão do funcionário.


---

## 2. Data Warehouse (OLAP - Star Schema)

### Tabela Fato: fato_financeiro
*Propósito: Armazena os fatos de pagamentos para análise.*
- `sk_fato` (INT): Surrogate Key (PK).
- `fk_aluno`, `fk_curso`, `fk_unidade`, `fk_tempo`: Chaves estrangeiras para as dimensões.
- `valor_pago` (DECIMAL): Métrica de valor financeiro processado.

### Dimensões: dim_aluno, dim_curso, dim_unidade, dim_tempo
*Propósito: Tabelas que fornecem contexto (quem, o quê, onde, quando) para os dados da Fato.*
