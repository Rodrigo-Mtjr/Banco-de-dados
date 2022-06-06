--DROP


--APAGAR ITENS DO BANCO DE DADOS

------------------------------------------------------------------------------------------

--APAGAR TABELAS

SELECT *
FROM SYS.TABLES; --VERIFICANDO NO BANCO DE DADOS TODAS AS TABELAS CRIADAS, COM O COMANDO SYS

SELECT *
	INTO TBDELETE1 --CRIANDO UMA TABELA COM TODOAS AS INFORMA��O DE OUTRA, UTILIZANDO O INTO
	FROM Cursos;

DROP TABLE TBDELETE1; -- EXCLUINDO A TABELA CRIADA A CIMA, COM O COMANDO DROP.
DROP TABLE TBDELETE; -- EXCLUINDO OUTRA TABELA QUE FOI CRIADA APENAS PARA TESTE.

SELECT *
FROM TBDELETE1; -- TESTANDO PARA VER SE AINDA EXISTE A TABELA.
------------------------------------------------------------------------------------------

--APAGAR SEQUENCES

SELECT *
FROM SYS.SEQUENCES; --ANALISANDO QUANTAS SEQUENCES EXISTEM NO BANCO DE DADOS

DROP SEQUENCE SEQ_TESTE02; --APAGANDO UMA SEQUENCE JA CRIADA.
------------------------------------------------------------------------------------------

--APAGAR INDICES - AINDA VAI TER UMA AULA MAIS A FUNDO COMO CRIAR UMA INDEX

CREATE INDEX INDALUNOSTESTE --CRIE UMA INDEX COM O NOME DE INDALUNOTESTE
ON ALUNOS (ID_ALUNO); --ONDE ELA VAI SER LOCALIZADA NA TABELA ALUNOS, NO CAMPO DE ID ALUNO

DROP INDEX ALUNOS.INDALUNOSTESTE; --EXCLUINDO A INDEX DENTRO DA TABELA ALUNOS
------------------------------------------------------------------------------------------

--APAGAR PROCEDURES - VAI TER UMA AULA MAIS A FUNDO SOBRE O ASSUNTO DE CRIAR UMA PROCEDURE

CREATE PROCEDURE PRCLISTAALUNO --CRIANDO UMA PROCEDURE COM O NOME PRCLISTAALUNO
AS 
	SELECT AL.NOME, AL.data_nascimento --SELECIONANDO OS CAMPOS QUE ESSA PROCEDURE VAI EXECUTAR
	  FROM ALUNOS AL -- MOSTRANDO QUAL TABELA SERA UTLIZADA NESSA PROCEDURE, NO CASO ALUNOS
	 WHERE AL.NOME LIKE 'G%'; -- COM O QUESITO DE QUE ELA MOSTRE SEMPRE OS ALUNOS COM QUE COMECEM COM A LETRA G

EXEC PRCLISTAALUNO; 

DROP PROCEDURE PRCLISTAALUNO; --DELETANDO A PROCEDURE CRIADA
------------------------------------------------------------------------------------------

--APAGAR CONSTRAINTS

SELECT  NAME
FROM SYS.key_constraints --ANALISANDO QUANTAS FK TEM NO BANCO DE DADOS
WHERE NAME LIKE 'PK%'

SELECT *
INTO TBDELETE --CRIANDO UMA TABELA COM TODAS AS INFORMA��ES DA TABELA CURSOS
FROM Cursos;

SELECT *
FROM TBDELETE; --VERIFICANDO SE A TABELA FOI CRIADA

USE SQL_DB_2
GO
ALTER TABLE TBDELETE
	ADD CONSTRAINT PK_IDCURSO UNIQUE (ID_CURSO);

SELECT NAME 
FROM SYS.key_constraints --VERIFICANDO NOVAMENTE SE A CONSTRAINT FOI CRIADA
WHERE NAME LIKE 'PK%'

ALTER TABLE TBDELETE --ALTERANDO A TABELA TBDELETE
	DROP CONSTRAINT PK_IDCURSO; --PARA DELETAR A CONSTRAINT PK_IDCURSO
------------------------------------------------------------------------------------------

--APAGA VIEWS

CREATE VIEW VWALUNOSTURMASTESTE -- SERVER PARA DEIXAR REGISTRADO UM SELECT QUE VOCE USA VARIAS VEZES
AS
	SELECT NOME
		  ,DATA_NASCIMENTO
		  ,DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) IDADE
	FROM Alunos
	WHERE DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) <18;

SELECT *
FROM VWALUNOSTURMASTESTE;

DROP VIEW VWALUNOSTURMASTESTE;
------------------------------------------------------------------------------------------

--APAGAR BANDO DE DADOS

CREATE DATABASE DBTESTEDROP;

DROP DATABASE DBTESTEDROP;
------------------------------------------------------------------------------------------