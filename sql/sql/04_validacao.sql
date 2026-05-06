SELECT COUNT(*) FROM aluno;
SELECT COUNT(*) FROM fato_desempenho;

SELECT SUM((nota_p1 + nota_p2)/2) FROM matricula;
SELECT SUM(nota_total) FROM fato_desempenho;

CREATE INDEX idx_fato_aluno ON fato_desempenho(fk_aluno);
