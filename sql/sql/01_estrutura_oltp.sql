-- RESET E CRIAÇÃO DO BANCO (Combinado para facilitar)
DROP DATABASE IF EXISTS faculdade_nova_horizonte;
DROP DATABASE IF EXISTS faculdade_NH_dw;

CREATE DATABASE faculdade_nova_horizonte;
CREATE DATABASE faculdade_NH_dw;

-- TABELAS OLTP
USE faculdade_nova_horizonte;

-- ==========================================
-- Módulo Acadêmico
-- ==========================================
CREATE TABLE tb_unidades(
    pk_id_unidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_unidade VARCHAR(100) NOT NULL
);

CREATE TABLE tb_cursos(
    pk_id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    fk_id_unidade INT NOT NULL,
    FOREIGN KEY (fk_id_unidade) REFERENCES tb_unidades(pk_id_unidade)
);

CREATE TABLE tb_alunos(
    pk_rgm INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_aluno VARCHAR(120) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(11) UNIQUE,
    email VARCHAR(120) UNIQUE,
    sexo CHAR(1),
    fk_id_curso INT NOT NULL,
    FOREIGN KEY (fk_id_curso) REFERENCES tb_cursos(pk_id_curso)
);

CREATE TABLE tb_disciplinas(
    pk_id_disciplina INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_disciplina VARCHAR(120) NOT NULL,
    carga_horaria INT NOT NULL,
    status_disciplina VARCHAR(20) NOT NULL DEFAULT 'ativo'
);

CREATE TABLE tb_matriculas(
    pk_id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    fk_rgm INT NOT NULL,
    fk_id_disciplina INT NOT NULL,
    data_matricula DATE NOT NULL,
    FOREIGN KEY (fk_rgm) REFERENCES tb_alunos(pk_rgm),
    FOREIGN KEY (fk_id_disciplina) REFERENCES tb_disciplinas(pk_id_disciplina)
);

-- ==========================================
-- Módulo Financeiro
-- ==========================================
CREATE TABLE tb_contratos_educacionais(
    pk_id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    fk_rgm INT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    status_contrato VARCHAR(20) NOT NULL DEFAULT 'ativo',
    FOREIGN KEY (fk_rgm) REFERENCES tb_alunos(pk_rgm)
);

CREATE TABLE tb_parcelas_contrato(
    pk_id_parcela INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_contrato INT NOT NULL,
    valor_parcela DECIMAL(10,2) NOT NULL,
    data_vencimento DATE NOT NULL,
    data_pagamento DATE,
    FOREIGN KEY (fk_id_contrato) REFERENCES tb_contratos_educacionais(pk_id_contrato)
);

-- ==========================================
-- Módulo RH
-- ==========================================
CREATE TABLE tb_funcionarios(
    pk_id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(120) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    data_admissao DATE NOT NULL
);
