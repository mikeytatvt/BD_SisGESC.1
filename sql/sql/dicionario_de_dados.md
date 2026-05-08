# Dicionário de Dados - SisGESC

Este documento descreve a estrutura das tabelas do banco de dados transacional (OLTP) e analítico (OLAP).

## 1. Banco de Dados Transacional (OLTP)

### Tabela: tb_unidades
*Propósito: Armazena as unidades físicas da instituição.*
- `pk_id_unidade` (INT): Chave primária, auto incremento.
- `nome_unidade` (VARCHAR): Nome do campus.

### Tabela: tb_cursos
*Propósito: Cadastro dos cursos oferecidos.*
- `pk_id_curso` (INT): ID do curso (Chave Primária).
- `nome_curso` (VARCHAR): Nome da graduação.
- `fk_id_unidade` (INT): Chave estrangeira ligando à unidade.

### Tabela: tb_alunos
*Propósito: Cadastro de alunos da instituição.*
- `pk_rgm` (INT): Registro Geral de Matrícula (Chave Primária).
- `nome_aluno` (VARCHAR): Nome completo.
- `data_nascimento` (DATE): Data de nascimento.
- `cpf` (VARCHAR): CPF do aluno.
- `email` (VARCHAR): Email do aluno.
- `sexo` (CHAR): Sexo do aluno.  
- `fk_id_curso` (INT): Chave estrangeira ligandio o curso em que o aluno está matriculado.

### Tabela: tb_disciplinas
*Propósito: Cadastro das disciplinas dos cursos.*
- `pk_id_disciplina` (INT): ID da disciplina (Chave Primária).
- `nome_disciplina` (VARCHAR): Nome da disciplina.
- `carga_horaria` (INT): Carga horária da disciplina do curso.
- `status_disciplina` (VARCHAR): Status da disciplina do aluno.

### Tabela: tb_matriculas
*Propósito: Cadastro da matrícula do aluno.*
- `pk_id_matricula` (INT): ID da matrícula (Chave Primária). 
- `fk_rgm` (INT): Chave estrangeira ligando o RGM.
- `fk_id_disciplina` (INT): Chave estrangeira ligando o ID da disciplina.
- `data_matricula` (DATE): Data da matricula.

### Tabela: tb_turmas
*Propósito: Cadastro das turmas.*
- `pk_id_turma` (INT): ID da turma (Chave Primária).
- `fk_id_curso` (INT): Chave estrangeira ligando o curso.
- `nome_turma` (VARCHAR): Nome da turma.
- `ano` (INT): Ano que a turma está cursando.
- `semestre` (INT): Semestre da turma. 

### Tabela: tb_grade_horaria
*Propósito: Criação e gestão da grade horária do aluno.*
- `pk_id_grade` (INT): ID da grade horária (Chave Primária).
- `fk_id_turma` (INT): Chave estrangeira ligando o ID da turma do aluno.
- `fk_id_disciplina` (INT): Chave estrangeira ligando o ID da disciplina.
- `fk_id_professor` (INT): Chave estrangeira ligando o ID do professor.
- `dia_semana` (VARCHAR): Dia da semana.

### Tabela: tb_notas
*Propósito: Gestão das notas dos alunos.*
- `pk_id_nota` (INT): ID da nota (Chave Primária).
- `fk_rgm` (INT): Chave estrangeira ligando o RGM do aluno.
- `fk_id_disciplina` (INT): Chave estrangeira ligando o ID da disciplina.
- `nota` (DECUMAL): Nota final do aluno.
  
### Tabela: tb_faltas
*Propósito: Gestão de presença dos alunos.*
- `pk_id_falta` (INT): ID da falta (Chave Primária).
- `fk_rgm` (INT): Chave estrangeira ligando o RGM do aluno.
- `fk_id_disciplina` (INT): Chave estrangeira ligando o ID da disciplina.
- `quantidade_faltas` (INT): Quantidade de faltas do aluno.

### Tabela: tb_inadimplecia
*Propósito: Gestão de inadimplência do aluno.*
- `pk_id_inadimplencia` (INT): ID da inadimplência (Chave Primária). 
- `fk_id_contrato` (INT): Chave estrangeira ligando o contrato.
- `dias_atraso` (INT): Quantidade de dias que está atrasado.
- `valor_multa` (DECIMAL): Valor da multa a ser paga.
 

### Tabela: tb_contratos_educacionais
*Propósito: Cadastro e gestão financeira dos contratos dos alunos.*
- `pk_id_contrato` (INT): ID do contrato (Chave Primária).
- `fk_rgm` (INT): Chave estrangeira ligando o RGM do aluno.
- `valor_total` (DECIMAL): Valor total contratado pelo aluno.
- `status_contrato` (VARCHAR): Status do contrato do aluno.

### Tabela: tb_parcelas_contrato
*Propósito: Criação e gestão financeira das parcelas do contrato.*
- `pk_id_parcela` (INT): ID das parcelas do contrato (Chave Primária).
- `fk_id_contrato` (INT): Chave estrangeira ligando o ID do contrato.
- `valor_parcela` (DECIMAL): Valor das parcelas.
- `data_vencimento` (DATE): Data de vencimeto das parcelas.
- `data_pagamento` (DATE): Data que foi realizado o pagamento das parcelas.

### Tabela: tb_funcionarios
*Propósito: Cadastro de funcionários.*
- `pk_id_funcionario` (INT): ID do funcionário (Chave Primária).
- `nome_funcionario` (VARCHAR): Nome do funcionário.
- `cargo` (VARCHAR): Cargo do funcionário.
- `data_admissao` (DATE): Data de admissão do funcionário.

### Tabela: tb_professores
*Propósito: Cadastro de professores.*
- `pk_id_professor` (INT): ID do professor (Chave Primária).
- `nome_professor` (VARCHAR): Nome do professor.
- `especialidade` (VARCHAR): Área de especialidade do professor.


---

## 2. Data Warehouse (OLAP - Star Schema)

### Tabela Fato: fato_financeiro
*Propósito: Armazena os fatos de pagamentos para análise.*
- `sk_fato` (INT): Surrogate Key (PK).
- `fk_aluno`, `fk_curso`, `fk_unidade`, `fk_tempo`: Chaves estrangeiras para as dimensões.
- `valor_pago` (DECIMAL): Métrica de valor financeiro processado.

### Dimensões: dim_aluno, dim_curso, dim_unidade, dim_tempo
*Propósito: Tabelas que fornecem contexto (quem, o quê, onde, quando) para os dados da Fato.*
