--TRIGGERS (GATILHOS)

-------------------------------------------------------------------------------------------

 CREATE TABLE TBSALDOS
 (
	PRODUTO VARCHAR(10),
	SALDO_INICIAL NUMERIC(10),
	SALDO_FINAL NUMERIC(10),
	DATA_ULT_MOV DATETIME
 );
 GO

 INSERT INTO TBSALDOS
	(PRODUTO, SALDO_INICIAL, SALDO_FINAL, DATA_ULT_MOV)
VALUES 
	('PRODUTO A', 0, 100, GETDATE());
GO

CREATE TABLE TBVENDAS
(
	ID_VENDAS INT,
	PRODUTO VARCHAR(10),
	QUANTIDADE INT, 
	DATA DATETIME
);
GO 

CREATE SEQUENCE SEQ_TBVENDAS
	AS NUMERIC 
	START WITH 1 
	INCREMENT BY 1;

CREATE TABLE TBHISTORICOVENDAS
(
	PRODUTO VARCHAR(10),
	QUANTIDADE INT,
	DATA_VENDA DATETIME
);
GO

-------------------------------------------------------------------------------------------

CREATE TRIGGER TRG_AJUSTASALDO	--CRIE UM GATILHO CHAMADO TRG_AJUSTADO
ON TBVENDAS						--QUE VAI SER LIGADO A TABELA TBVENDAS
FOR INSERT						--MODIFICANDO POR UM INSERT 
AS								--NAO ESQUECER DESTA FUN??O	
BEGIN							--COMECE
	DECLARE @QUANTIDADE INT,	--DECLARANDO UMA VARIAVEL	
			@DATA DATETIME,     --DECLARANDO UMA VARIAVEL
			@PRODUTO VARCHAR(10)--DECLARANDO UMA VARIAVEL
	
	SELECT @DATA = DATA             --FA?A COM QUE A VARIAVEL @DATA MODIFIQUE O CAMPO DATA DA TABELA VENDAS
		  ,@QUANTIDADE = QUANTIDADE --FA?A COM QUE A VARIAVEL @QUANTIDADE MODIFIQUE O CAMPO QUANTIDADE DA TABELA VENDAS
		  ,@PRODUTO = PRODUTO	    --FA?A COM QUE A VARIAVEL @PRODUTO MODIFIQUE O CAMPO PRODUTO DA TABELA VENDAS
	FROM INSERTED 
	
	UPDATE TBSALDOS					--FA?A UMA ALTERA??O NA TABELA TBSALDOS
	SET SALDO_FINAL = SALDO_FINAL - @QUANTIDADE, --FAZENDO COM QUE O CAMPO DO SALDO FINAL, RECEBA O VALOR QUE J? EST? L? REGISTRAODO MENOS O VALOR DA VARIAVEL QUANTIDADE.
		DATA_ULT_MOV = @DATA		--FAZENDO COM QUE O CAMPO DATA_ULT_MOVIMENTA??O RECEBA O VALOR DA VARIAVEL @DATA
	WHERE PRODUTO = @PRODUTO;		--SOMENTE QUANDO O PRODUTO FOR IGUAL A VARIAVEL PRODUTO.

INSERT INTO TBHISTORICOVENDAS		--FA?A UM INSERT NA TABELA HISTORICO DE VENDAS
	(PRODUTO, QUANTIDADE, DATA_VENDA)--NOS CAMPOS PRODUTO, QUANTIDADE E DATA DE VENDA)
VALUES
	(@PRODUTO, @QUANTIDADE, @DATA); --COM AS VARIAVEIS UTILIZADAS NA TRIGGERS, PRODUTO, QUANTIDADE, DATA.
END									--FINALIZE COM UM END POIS TEM UM BEGIN.
GO
 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--FAZENDO PRA VER SE A TRIGGER DEU CERTO 

INSERT INTO TBVENDAS
	(ID_VENDAS,PRODUTO, QUANTIDADE, DATA)
VALUES
	(NEXT VALUE FOR SEQ_TBVENDAS, 'PRODUTO A', 11, GETDATE());


SELECT * FROM TBVENDAS;
SELECT * FROM TBSALDOS;
SELECT * FROM TBHISTORICOVENDAS;