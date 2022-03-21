--CRIE UMA BASE DE DADOS UNIVERSIDADE COM AS TABELAS A SEGUIR
--ALUNOS, DISCIPLINAS, PROFESSORES, TURMA, HISTORICA

create database UNIVERSIDADE;

create table Alunos 
(
	mat int primary key not null,
	nome varchar(200) not null,
	endereco varchar(200) not null,
	cidade varchar(200) not null,
);

create table Disciplinas
(
	cod_disc varchar(20) primary key not null,
	nome_disc varchar(200) not null,
	carga_hora int not null,
);

DROP TABLE Disciplinas;

create table Professores
(
	cod_prof int primary key not null,
	nome varchar(200) not null,
	endere�o varchar(200) not null,
	cidade varchar(200) not null,
);

create table Turma
(
	cod_disc varchar(20) not null,
	cod_turma int not null,
	cod_prof int not null,
	ano int not null,
	horario varchar(20) not null,
);

--RELACIONANDO A FK DA TABELA TURMA COM A PK DA TABELA DISCIPLINAS
alter table turma
	add constraint fk_disc foreign key (cod_disc) references Disciplinas (cod_disc);


--RELACIONANDO A FK DA TABELA TURMA COM A PK DA TABELA PROFESSORES
alter table turma 
	add constraint fk_prof foreign key (cod_prof) references Professores (cod_prof);


create table Historico
(
	mat int not null,
	cod_disc varchar (20)not null,
	cod_turma int not null,
	cod_prof int not null,
	ano int not null,
	frequencia int not null,
	nota numeric (5,2) not null,
);

--RELACIONANDO A FK DA TABELA HISTORICO COM A PK DA TABELA DISCIPLINAS
alter table historico
	add constraint fk_disc1 foreign key (cod_disc) references Disciplinas (cod_disc);

--RELACIONANDO A FK DA TABELA HISTORICO COM A PK DA TABELA TURMA 
alter table historico
	add constraint fk_turma1 foreign key (cod_turma) references Turma (cod_turma);

--RELACIONANDO A FK DA TABELA HISTORICO COM A PK DA TABELA PROFESSORES
alter table historico
	add constraint fk_prof1 foreign key (cod_prof) references Professores (cod_prof);

--RELACIONANDO A FK DA TABELA HISTORICO COM A PK DA TABELA ALUNOS
alter table historico 
	add constraint fk_mat foreign key (mat) references Alunos (mat);


drop table Historico;

--INSIRIR AS INFORMA��ES NA TABELA ALUNOS

SELECT * 
FROM Alunos

INSERT INTO Alunos
	(MAT, NOME, endereco, cidade)
VALUES
	(2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL');

INSERT INTO Alunos
	(MAT, NOME, endereco, cidade)
VALUES
	(2015010102, 'JO�O JOS�', 'AVENIDA RUY CARNEIRO', 'JO�O PESSOA');

INSERT INTO Alunos
	(MAT, NOME, endereco, cidade)
VALUES
	(2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE');

INSERT INTO Alunos
	(MAT, NOME, endereco, cidade)
VALUES
	(2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA');

INSERT INTO Alunos
	(MAT, NOME, endereco, cidade)
VALUES
	(2015010105, 'JOSU� CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');

INSERT INTO Alunos
	(MAT, NOME, endereco, cidade)
VALUES
	(2015010106, 'JOSU�LISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');

--INSERIR INFORMA��ES NA TABELA DISCIPLINAS

select *
from Disciplinas;

insert into Disciplinas
	(cod_disc, nome_disc, carga_hora)
values
	('BD', 'BANCO DE DADOS', 100);

insert into Disciplinas
	(cod_disc, nome_disc, carga_hora)
values
	('POO', 'PROGRAMA��O COM ACESSO A BANCO DE DADOS', 100);

insert into Disciplinas
	(cod_disc, nome_disc, carga_hora)
values
	('WEB', 'AUTORIA WEB', 50);

insert into Disciplinas
	(cod_disc, nome_disc, carga_hora)
values
	('ENG', 'ENGENHARIA DE SOFTWARE', 80);

--INSERIR AS INFORMA��ES NA TABELA PROFESSORES

SELECT*
FROM Professores;

insert into Professores
	(cod_prof, nome, endere�o, cidade)
values
	(212131,'NICKERSON FERREIRA', 'RUA MANA�RA', 'JO�O PESSOA');
	(cod_prof, nome, endere�o, cidade)
values
	(122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL');
	(cod_prof, nome, endere�o, cidade)
values
	(192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');