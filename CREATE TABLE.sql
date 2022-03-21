CREATE TABLE Alunos
(
	id_aluno int PRIMARY KEY not null,
	nome varchar(200) NOT NULL, 
	data_nascimento date NOT NULL, 
	sexo varchar(1) NOT NULL, --M para masculino ou F para feminino
	data_cadastro datetime NOT NULL, 
	login_cadastro varchar(15) NOT NULL,


);

ALTER TABLE Alunos
		add constraint fk_Turmas FOREIGN KEY (id_aluno) REFERENCES Turmas (id_turmas);



--ALTER TABLE Alunos
		DROP CONSTRAINT fk_turmas;

-- DROP TABLE Alunos;

CREATE TABLE Situacao
(
	id_situacao int PRIMARY KEY NOT NULL,
	situacao varchar (25) NOT NULL, 
	data_cadastro datetime, 
	login_cadastro varchar(15)
);



CREATE TABLE Cursos
(
	id_curso int primary key not null,
	nome_curso varchar (200) not null,
	data_cadastro datetime not null, 
	login_cadastro varchar(15) not null,

);

CREATE TABLE Turmas
(
	id_turmas int PRIMARY KEY not null, 
	id_aluno int not null,
	id_curso int not null, 
	valor_turma numeric(15,2),
	desconto numeric(3,2)not null,
	data_inicio date not null,
	data_termino date,
	data_cadastro datetime not null, 
	login_cadastro varchar(15) not null,
	   
);

ALTER TABLE Turmas
		add constraint fk_Alunos FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);

ALTER TABLE Turmas
		add constraint fk_Curso FOREIGN KEY (id_curso) REFERENCES Cursos (id_curso);

;  

CREATE TABLE Registro_presenca
(
	id_turma int not null, 
	id_aluno int not null,
	id_situacao int not null,
	data_presenca date not null,
	data_cadastro date not null,
	login_cadastro varchar(15) not null,
);
ALTER TABLE Registro_presenca
	add constraint fk_TurmasRP FOREIGN KEY (id_turma) REFERENCES Turmas (id_turmas);

ALTER TABLE Registro_presenca
	add constraint fk_AlunosRP FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);

ALTER TABLE Registro_presenca
	add constraint fk_situacaoRP FOREIGN KEY (id_situacao) REFERENCES Situacao (id_situacao);

/*
drop table Turmas;
drop table Situacao;
drop table Registro_presenca;
drop table Cursos;
drop table Alunos; 
*/