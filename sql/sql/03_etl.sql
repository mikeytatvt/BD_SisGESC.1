TRUNCATE TABLE fato_desempenho;
TRUNCATE TABLE dim_aluno;
TRUNCATE TABLE dim_curso;

INSERT INTO dim_aluno
SELECT id_aluno, nome_aluno FROM aluno;

INSERT INTO dim_curso
SELECT id_curso, nome_curso FROM curso;

INSERT INTO fato_desempenho
SELECT 
    NULL,
    id_aluno,
    id_curso,
    (nota_p1 + nota_p2)/2,
    aprovacao
FROM matricula;
