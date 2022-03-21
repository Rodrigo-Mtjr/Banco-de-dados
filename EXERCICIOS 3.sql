--CRIANDO TABELA PAIS
CREATE TABLE Pais
(
	id_pais int primary key not null,
	nome varchar(35) not null,
	continente varchar(35) not null,
	pop real not null,
	pib real not null,
	expec_vida real not null
);


--CRIANDO TABELA CIDADE
CREATE TABLE Cidade
(
	id_cidade int primary key not null,
	nome varchar(35) not null,
	id_pais int not null, 
	pop real not null, 
	capital varchar(20) not null
);


--RELACIONANDO CHAVE ESTRANGEIRA DENTRO DA TABELA CIDADE
alter table cidade
	add constraint fk_pais foreign key (pais) references Pais (id_pais);

--TEVE UM ERRO NA HORA DE CRIAR A TABELA CIDADE
alter table Cidade
	DROP constraint fk_pais;

drop table Cidades;


--CRIANDO TABELA RIO
create table Rio
(
	id_rio int primary key not null,
	nome varchar (35) not null,
	id_pais int not null,
	comprimento integer not null,
);


--TEVE UM ERRO NA HORA DE CRIAR A TABELA RIO
alter table Rio
	drop constraint fk_pais1;
drop table Rio;



--RELACIONANDO CHAVE ESTRANGEIRA DENTRO DA TABELA RIO
alter table Rio
	add constraint fk_pais1 foreign key (pais) references Pais (id_pais);



--INSERINDO INFORMAÇÕES DENTRO DA TABELA PAIS
INSERT INTO Pais
	(id_pais, nome, continente, pop, pib, expec_vida)
values	
	(1, 'CANADA', 'Am.NORTE',30.1,658,77.08);
	
INSERT INTO Pais
	(id_pais, nome, continente, pop, pib, expec_vida)
values	
	(2, 'MEXICO', 'Am.NORTE',107.5,694,69.1);

INSERT INTO Pais
	(id_pais, nome, continente, pop, pib, expec_vida)
values	
	(3, 'BRASIL', 'AM.SUL',183.3,10004,65.2);

INSERT INTO Pais
	(id_pais, nome, continente, pop, pib, expec_vida)
values	
	(4, 'USA', 'AM.NORTE',270.0,8003,75.5);



--INSERINDO INFORMAÇÕES DENTRO DA TABELA CIDADE 
INSERT INTO Cidade
	(id_cidade, nome, id_pais, pop, capital)
VALUES
	(1, 'WASHINGTON',4,3.3,'S');

INSERT INTO Cidade
	(id_cidade, nome, id_pais, pop, capital)
VALUES
	(2, 'MONTERREY',2,2.0,'N');

INSERT INTO Cidade
	(id_cidade, nome, id_pais, pop, capital)
VALUES
	(3, 'BRASILIA',3,1.5,'S');

INSERT INTO Cidade
	(id_cidade, nome, id_pais, pop, capital)
VALUES
	(4, 'SAO PAULO',3,15.0,'N');

INSERT INTO Cidade
	(id_cidade, nome, id_pais, pop, capital)
VALUES
	(5, 'OTTAWA',1,0.8,'S');

INSERT INTO Cidade
	(id_cidade, nome, id_pais, pop, capital)
VALUES
	(6, 'CID.MEXICO',2,14.1,'S');



--INSERINDO INFORMAÇÕES NA TABELA RIO
INSERT INTO Rio
	(id_rio, nome, id_pais, comprimento)
VALUES	
	(1, 'ST.LAWRENCE',4,3.3);

INSERT INTO Rio
	(id_rio, nome, id_pais, comprimento)
VALUES	
	(2, 'GRANDE',4,2.0);

INSERT INTO Rio
	(id_rio, nome, id_pais, comprimento)
VALUES	
	(3, 'PARANA',3,1.5);

INSERT INTO Rio
	(id_rio, nome, id_pais, comprimento)
VALUES	
	(4, 'MISSISSIPI',4,15.0);



--LISTE TODAS AS CIDADES E PAISES AOS QUAIS PERTENCEM 
select c.id_cidade
	  ,c.nome
	  ,p.id_pais
	  ,p.nome
from dbo.Cidade c
	inner join dbo.Pais p
	on p.id_pais = c.id_pais



--LISTE TODAS AS CIDADES QUE SÃO CAPITAIS
select c.nome
	  ,c.capital
from dbo.Cidade c
where c.capital = 'S'



--LISTE TODOS OS ATRIBUTOS DOS PAISES ONDE A EXPECTATIVA DE VIDA É MENOR QUE 70 ANOS.
select *
from dbo.Pais
where expec_vida < 70



--LISTE TODAS AS CAPITAIS E AS POPULAÇÕES DOS PAISES CUJO O PIB É MAIOR QUE 1T DE DOLARES.
select c.nome as "NOME DA CAPITAL"
	  ,c.pop as "POPULAÇÃO"
from dbo.Cidade c
	inner join dbo.Pais p
	on p.id_pais = c.id_pais
where p.pib > 1000
	and c.capital = 'S'



--MOSTRE O NOME E A QUANTIDADE DA POPULÇÃO DA CAPITAL E O PAIS ONDE O RIO ST.LAWRENCE FICA.
select c.nome AS "NOME DA CAPITAL"
	  ,c.pop AS "POPULAÇÃO"
	  ,p.nome AS "NOME DO PAIS"
	  ,r.nome AS "NOME DO RIO"
from dbo.Cidade c
  inner join dbo.pais p 
  on p.id_pais = c.id_pais
  inner join dbo.Rio r
  on r.id_pais = p.id_pais
where r.nome = 'ST.LAWRENCE'



--MOSTRE OS PAISES E CONTE QUANTOS RIOS EXISTEM EM CADA
select p.nome AS "NOME DO PAIS"
	  ,count (r.id_pais) as "TOTAL DE RIOS"
from dbo.Pais p
  inner join dbo.Rio r
  on r.id_pais = p.id_pais
 GROUP BY P.NOME



--QUAL A MEDIA DA POPULAÇÃO DAS CIDADES QUE NÃO SÃO CAPITAIS
select avg(c.pop) AS "MEDIA DA POPULAÇÃO ENTRE CIDADES"
from dbo.Cidade c
where capital = 'n'



--LISTE OS PAISES CUJO O PIB É MAIOR QUE O PIB DO CANADA, ORDENANDO PELO PIB MAIS ALTO

select nome as "PAISES COM PIB MAIOR QUE O PIB DE CANADA"
from dbo.pais
where pib > 658
order by pib desc