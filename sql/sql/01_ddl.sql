-- TABELAS OLTP

CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY,
    nome_aluno VARCHAR(100),
    data_nascimento DATE
);

CREATE TABLE curso (
    id_curso INT PRIMARY KEY,
    nome_curso VARCHAR(100)
);

CREATE TABLE matricula (
    id_matricula INT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    nota_p1 DECIMAL(5,2),
    nota_p2 DECIMAL(5,2),
    aprovacao VARCHAR(20),

    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

-- OLAP

CREATE TABLE dim_aluno (
    sk_aluno INT PRIMARY KEY,
    nome_aluno VARCHAR(100)
);

CREATE TABLE dim_curso (
    sk_curso INT PRIMARY KEY,
    nome_curso VARCHAR(100)
);

CREATE TABLE fato_desempenho (
    id_fato INT AUTO_INCREMENT PRIMARY KEY,
    fk_aluno INT,
    fk_curso INT,
    nota_total DECIMAL(5,2),
    aprovacao VARCHAR(20),

    FOREIGN KEY (fk_aluno) REFERENCES dim_aluno(sk_aluno),
    FOREIGN KEY (fk_curso) REFERENCES dim_curso(sk_curso)
);
