-- ==========================================
-- RESET E CRIAÇÃO DOS BANCOS
-- ==========================================

DROP DATABASE IF EXISTS faculdade_nova_horizonte;
DROP DATABASE IF EXISTS faculdade_NH_dw;

CREATE DATABASE faculdade_nova_horizonte;
CREATE DATABASE faculdade_NH_dw;

USE faculdade_nova_horizonte;

-- ==========================================
-- MÓDULO ACADÊMICO E PEDAGÓGICO
-- ==========================================

CREATE TABLE tb_unidades (
    pk_id_unidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_unidade VARCHAR(100) NOT NULL
);

CREATE TABLE tb_cursos (
    pk_id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    fk_id_unidade INT NOT NULL,
    FOREIGN KEY (fk_id_unidade)
        REFERENCES tb_unidades(pk_id_unidade)
);

CREATE TABLE tb_professores (
    pk_id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome_professor VARCHAR(120) NOT NULL,
    especialidade VARCHAR(100)
);

CREATE TABLE tb_turmas (
    pk_id_turma INT AUTO_INCREMENT PRIMARY KEY,
    nome_turma VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    semestre INT NOT NULL,
    fk_id_curso INT NOT NULL,
    FOREIGN KEY (fk_id_curso)
        REFERENCES tb_cursos(pk_id_curso)
);

CREATE TABLE tb_alunos (
    pk_rgm INT AUTO_INCREMENT PRIMARY KEY,
    nome_aluno VARCHAR(120) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(11) UNIQUE,
    email VARCHAR(120) UNIQUE,
    sexo CHAR(1),
    fk_id_curso INT NOT NULL,
    FOREIGN KEY (fk_id_curso)
        REFERENCES tb_cursos(pk_id_curso)
);

CREATE TABLE tb_disciplinas (
    pk_id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome_disciplina VARCHAR(120) NOT NULL,
    carga_horaria INT NOT NULL,
    status_disciplina VARCHAR(20) NOT NULL DEFAULT 'ativo'
);

CREATE TABLE tb_grade_horaria (
    pk_id_grade INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_turma INT NOT NULL,
    fk_id_disciplina INT NOT NULL,
    fk_id_professor INT NOT NULL,
    dia_semana VARCHAR(20),
    FOREIGN KEY (fk_id_turma)
        REFERENCES tb_turmas(pk_id_turma),
    FOREIGN KEY (fk_id_disciplina)
        REFERENCES tb_disciplinas(pk_id_disciplina),
    FOREIGN KEY (fk_id_professor)
        REFERENCES tb_professores(pk_id_professor)
);

CREATE TABLE tb_matriculas (
    pk_id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    fk_rgm INT NOT NULL,
    fk_id_disciplina INT NOT NULL,
    data_matricula DATE NOT NULL,
    FOREIGN KEY (fk_rgm)
        REFERENCES tb_alunos(pk_rgm),
    FOREIGN KEY (fk_id_disciplina)
        REFERENCES tb_disciplinas(pk_id_disciplina)
);

CREATE TABLE tb_notas (
    pk_id_nota INT AUTO_INCREMENT PRIMARY KEY,
    fk_rgm INT NOT NULL,
    fk_id_disciplina INT NOT NULL,
    nota DECIMAL(4,2),
    FOREIGN KEY (fk_rgm)
        REFERENCES tb_alunos(pk_rgm),
    FOREIGN KEY (fk_id_disciplina)
        REFERENCES tb_disciplinas(pk_id_disciplina)
);

CREATE TABLE tb_faltas (
    pk_id_falta INT AUTO_INCREMENT PRIMARY KEY,
    fk_rgm INT NOT NULL,
    fk_id_disciplina INT NOT NULL,
    quantidade_faltas INT DEFAULT 0,
    FOREIGN KEY (fk_rgm)
        REFERENCES tb_alunos(pk_rgm),
    FOREIGN KEY (fk_id_disciplina)
        REFERENCES tb_disciplinas(pk_id_disciplina)
);

-- ==========================================
-- MÓDULO FINANCEIRO
-- ==========================================

CREATE TABLE tb_contratos_educacionais (
    pk_id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    fk_rgm INT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    status_contrato VARCHAR(20) NOT NULL DEFAULT 'ativo',
    FOREIGN KEY (fk_rgm)
        REFERENCES tb_alunos(pk_rgm)
);

CREATE TABLE tb_parcelas_contrato (
    pk_id_parcela INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_contrato INT NOT NULL,
    valor_parcela DECIMAL(10,2) NOT NULL,
    data_vencimento DATE NOT NULL,
    data_pagamento DATE,
    FOREIGN KEY (fk_id_contrato)
        REFERENCES tb_contratos_educacionais(pk_id_contrato)
);

CREATE TABLE tb_inadimplencia (
    pk_id_inadimplencia INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_contrato INT NOT NULL,
    dias_atraso INT,
    valor_multa DECIMAL(10,2),
    FOREIGN KEY (fk_id_contrato)
        REFERENCES tb_contratos_educacionais(pk_id_contrato)
);

-- ==========================================
-- MÓDULO RH
-- ==========================================

CREATE TABLE tb_funcionarios (
    pk_id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(120) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    data_admissao DATE NOT NULL
);
