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
	endereço varchar(200) not null,
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

--INSIRIR AS INFORMAÇÕES NA TABELA ALUNOS

SELECT * 
FROM Alunos

INSERT INTO Alunos
	(MAT, NOME, endereco, cidade)
VALUES
	(2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL');

INSERT INTO Alunos
	(MAT, NOME, endereco, cidade)
VALUES
	(2015010102, 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA');

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
	(2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');

INSERT INTO Alunos
	(MAT, NOME, endereco, cidade)
VALUES
	(2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');

--INSERIR INFORMAÇÕES NA TABELA DISCIPLINAS

select *
from Disciplinas;

insert into Disciplinas
	(cod_disc, nome_disc, carga_hora)
values
	('BD', 'BANCO DE DADOS', 100);

insert into Disciplinas
	(cod_disc, nome_disc, carga_hora)
values
	('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', 100);

insert into Disciplinas
	(cod_disc, nome_disc, carga_hora)
values
	('WEB', 'AUTORIA WEB', 50);

insert into Disciplinas
	(cod_disc, nome_disc, carga_hora)
values
	('ENG', 'ENGENHARIA DE SOFTWARE', 80);

--INSERIR AS INFORMAÇÕES NA TABELA PROFESSORES

SELECT*
FROM Professores;

insert into Professores
	(cod_prof, nome, endereço, cidade)
values
	(212131,'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA');insert into Professores
	(cod_prof, nome, endereço, cidade)
values
	(122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL');insert into Professores
	(cod_prof, nome, endereço, cidade)
values
	(192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');--INSERIR AS INFORMAÇÕES NA TABELA TURMAselect *from Turma;insert into Turma	(cod_disc, cod_turma, cod_prof, ano, horario)values	('BD', 1, 212131, 2015, '11H-12H');	insert into Turma	(cod_disc, cod_turma, cod_prof, ano, horario)values	('BD', 2, 212131, 2015, '13H-14H');insert into Turma	(cod_disc, cod_turma, cod_prof, ano, horario)values	('POO', 1, 192011, 2015, '08H-09H');insert into Turma	(cod_disc, cod_turma, cod_prof, ano, horario)values	('WEB', 1, 192011, 2015, '07H-08H')insert into Turma	(cod_disc, cod_turma, cod_prof, ano, horario)values	('ENG', 1, 122135, 2015, '10H-11H')--INSERIR INFORMAÇÕES PARA A TABELA HISTORICOselect *from historicoinsert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010101,'BD',1,212131,2015,100,10);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010101,'BD',2,212131,2015,90,8);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010101,'POO',1,192011,2015,100,10);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010101,'WEB',1,192011,2015,100,7);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010101,'ENG',1,122135,2015,80,9);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010102,'BD',1,212131,2015,50,5);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010102,'BD',2,212131,2015,70,8);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010102,'POO',1,192011,2015,100,9);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010102,'WEB',1,192011,2015,100,10);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010102,'ENG',1,122135,2015,80,6);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010103,'BD',1,212131,2015,80,7);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010103,'BD',2,212131,2015,100,8);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010103,'POO',2,192011,2015,60,6);insert into historico		(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010103,'WEB',1,192011,2015,50,5);insert into historico		(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010103,'ENG',1,122135,2015,100,10);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010104,'BD',1,212131,2015,70,8);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010104,'BD',2,212131,2015,80,8);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010104,'POO',1,192011,2015,90,9);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010104,'WEB',1,192011,2015,50,5);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010104,'ENG',1,122135,2015,70,7);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010105,'BD',1,212131,2015,70,9);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010105,'BD',2,212131,2015,80,8)insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010105,'POO',1,192011,2015,80,8);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010105,'WEB',1,192011,2015,100,10);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010105,'ENG',1,122135,2015,90,9);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010106,'BD',1,212131,2015,90,9);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010106,'BD',2,212131,2015,90,9);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010106,'POO',2,192011,2015,100,10);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010106,'WEB',2,192011,2015,50,5);insert into historico	(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota)values	(2015010106,'ENG',1,122135,2015,90,9);SELECT * FROM HISTORICO--ENCONTRE A MAT DOS ALUNOS COM NOTA EM BD EM 2015 IGUAL A 5select h.mat	  ,h.nota	  ,h.cod_discfrom dbo.historico h	inner join dbo.Alunos a	on h.mat = a.matwhere nota >= 5 and h.cod_disc = 'BD'order by nota  desc--ENCONTRE A MAT E CALCULE A MEDIA DAS NOTAS DOS ALUNOS NA DISCIPLINA DE POOselect h.mat	  ,h.nota	  ,AVG(h.nota) as "MEDIAS DAS NOTAS"from dbo.historico hwhere h.cod_disc = 'POO'GROUP BY h.mat, h.nota--ENCONTRE QUANTOS ALUNOS NAO SAO DE NATALselect nome	  ,cidadefrom dbo.Alunoswhere cidade <> 'natal'