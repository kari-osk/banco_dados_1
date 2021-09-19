CREATE DATABASE escola;

USE escola;

-- criação das tabelas 
CREATE TABLE enderecos(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
rua VARCHAR(50),
numero INT(15),
cep INT(10),
bairro VARCHAR(30),
cidade VARCHAR(30),
estado CHAR(2)
);

CREATE TABLE professores(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(30) NOT NULL,
sobrenome VARCHAR(50) NOT NULL,
cpf INT(11) NOT NULL,
data_nascimento DATE,
email VARCHAR(40),
telefone_celular INT(11),
telefone_fixo INT(11),
idEndereco INT,
FOREIGN KEY(idEndereco) REFERENCES enderecos(id),
valor_hora DECIMAL(5,2)
);

CREATE TABLE alunos(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(30) NOT NULL,
sobrenome VARCHAR(50) NOT NULL,
cpf INT(11) NOT NULL,
data_nascimento DATE,
email VARCHAR(40),
telefone_celular INT(11),
telefone_fixo INT(11),
idEndereco INT,
FOREIGN KEY(idEndereco) REFERENCES enderecos(id)
);

CREATE TABLE cursos(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_curso VARCHAR(100),
carga_horaria TIME,
data_inicio DATE,
data_termino DATE
);

CREATE TABLE aluno_cursos(
idCurso INT,
FOREIGN KEY(idCurso) REFERENCES cursos(id),
idAluno INT,
FOREIGN KEY(idAluno) REFERENCES alunos(id)
);

CREATE TABLE professor_cursos(
idCurso INT,
FOREIGN KEY(idCurso) REFERENCES cursos(id),
idProfessor INT,
FOREIGN KEY(idProfessor) REFERENCES professores(id)
);

CREATE TABLE matriculas(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
idCurso INT,
FOREIGN KEY(idCurso) REFERENCES cursos(id),
idAluno INT,
FOREIGN KEY(idAluno) REFERENCES alunos(id),
data_matricula DATE,
status_matricula VARCHAR(20)
);

CREATE TABLE avaliacoes(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
idCurso INT,
FOREIGN KEY(idCurso) REFERENCES cursos(id),
idAluno INT,
FOREIGN KEY(idAluno) REFERENCES alunos(id),
nota VARCHAR(20)
);

-- Alteração das tabelas
ALTER TABLE enderecos
MODIFY cep INT(10) NOT NULL,
MODIFY numero INT(15) NOT NULL;

ALTER TABLE professores
MODIFY telefone_celular INT(11) NOT NULL,
MODIFY idEndereco INT NOT NULL;

ALTER TABLE alunos
MODIFY email VARCHAR(40) NOT NULL,
MODIFY telefone_celular INT(11) NOT NULL;

ALTER TABLE aluno_cursos
MODIFY idCurso INT NOT NULL,
MODIFY idAluno INT NOT NULL;

ALTER TABLE professor_cursos
MODIFY idCurso INT NOT NULL,
MODIFY idProfessor INT NOT NULL;

ALTER TABLE matriculas
MODIFY idCurso INT NOT NULL, 
MODIFY idAluno INT NOT NULL;

ALTER TABLE avaliacoes
MODIFY idCurso INT NOT NULL,
MODIFY idAluno INT NOT NULL;


-- CRUD 

USE escola;

-- Inserção de dados na tabela.
INSERT INTO cursos (nome_curso, carga_horaria, data_inicio, data_termino)
VALUES ('Desenvolvimento Web Full Stack', '210', '2022-01-10', '2022-05-31');

-- Seleção para verificar
SELECT * FROM cursos;

-- Nova inserção de dados na tabela.
INSERT INTO cursos (nome_curso, carga_horaria, data_inicio, data_termino)
VALUES ('Marketing Digital', '100', '2021-10-08', '2021-12-10');

-- Atualização de dados na tabela.
UPDATE cursos SET carga_horaria = '210:00:00'
WHERE carga_horaria = '210';

-- Nova atualização.
UPDATE cursos SET carga_horaria = '100:00:00'
WHERE carga_horaria = '100';

-- Exclusão de dados da tabela.
DELETE FROM escola.cursos
WHERE data_inicio = '2021-10-08';

SELECT * FROM cursos;

-- Nova inserção de dados na tabela.
INSERT INTO cursos (nome_curso, carga_horaria, data_inicio, data_termino)
VALUES ('Data Science', '100:00:00', '2022-01-15', '2022-06-25');

-- Seleção de dados da tabela.
SELECT * FROM cursos;
SELECT nome_curso 
FROM cursos 
WHERE nome_curso LIKE 'Data%';