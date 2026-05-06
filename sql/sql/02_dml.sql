TRUNCATE TABLE matricula;
TRUNCATE TABLE aluno;
TRUNCATE TABLE curso;

INSERT INTO aluno VALUES
(1, 'Lucas', '2000-01-01'),
(2, 'Ana', '2001-02-02');

INSERT INTO curso VALUES
(1, 'ADS'),
(2, 'SI');

INSERT INTO matricula VALUES
(1, 1, 1, 7.0, 8.0, 'APROVADO'),
(2, 2, 2, 5.0, 4.0, 'REPROVADO');
