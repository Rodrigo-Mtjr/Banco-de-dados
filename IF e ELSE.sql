--IF
--ELSE

--COMANDO IF = SE NA LÓGICA DE PROGRAMAÇÃO
--COMANDO ELSE = SENAO NA LÓGICA DE PROGRAMAÇÃO

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT *
INTO Ttemp                      --DUPLICANDO TABELA COM INFORMAÇÃO DE OUTRA
FROM Alunos;

IF 10 > 20                      --SE 10 FOR MAIOR QUE 20
	SELECT '10 É MAIOR QUE 20'  --ENTAO ESCREVA
ELSE                            --SE 10 NAO FOR MAIS QUE 20
	SELECT '10 É MENOR QUE 20'; --ENTAO ESCREVA
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

IF DATENAME(WEEKDAY, GETDATE()) IN ('SABADO', 'DOMINGO')                                --SE O NOME DO DIA DA SEMANA ESTIVER ENTRE SABADO E DOMINGO
	SELECT 'ESTAMOS NO FIM DE SEMANA, HOJE É' + UPPER(DATENAME(WEEKDAY, GETDATE()))     --ENTAO ESCREVA CONCATENADO EM LETRA MAIUSCULA O DIA DA SEMANA ATUAL
ELSE                                                                                    --SENAO    
	SELECT 'ESTAMOS EM UM DIA DA SEMANA, HOJE É ' + UPPER(DATENAME(WEEKDAY, GETDATE()));--ESCREVA CONCATENADO EM LETRA MAIUSCULA O DIA DA SEMANA ATUAL.
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--VARIAVEIS GLOBAIS DO SQL

SELECT @@SERVERNAME; --NOME DO SERVIDOR DO BANCO DE DADOS
SELECT @@LANGUAGE;   --LINGUAGEM QUE O SERVIDOR ESTÁ
SELECT @@LANGID;     --CODIGO ID DA LINGUAGEM NO SERVIDOR
SELECT @@TRANCOUNT;  --EXIBIR TRANSAÇÕES EXISTENTES

IF @@LANGUAGE <> 'Português (Brasil)'                         --SE A LINGUAGEM DO SISTEMA FOR DIFERENTE 
	SELECT 'TODAY IS ' + UPPER(DATENAME(WEEKDAY, GETDATE())); --ENTAO ESCREVA O DIA EM INGLES COM LETRA MAIUSCULA
ELSE                                                          --SENAO
	SELECT 'HOJE É ' + UPPER(DATENAME(WEEKDAY, GETDATE()));   --ESCREVA O DIA EM PORTUGUES EM LETRA MAISCULA
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

IF OBJECT_ID ('dbo.Alunos','U') IS NULL --PROCURE O NOME DA TABELA ALUNOS E VEJA SE ELA EXISTE
	SELECT 'ESTA TABELA NÃO EXISTE!'    --SE NAO ENCONTRAR ESCREVA
ELSE									--SENAO	
	EXEC SP_COLUMNS Alunos;             --EXIBIR AS COLUNAS E TODOS OS DETALHES DA COLUNA
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE @vIDADEMAX INT;   --DECLARANDO VARIAVEL
DECLARE @vPARAM INT;	  --DECLARANDO VARIAVEL
	SET @vIDADEMAX = 17;  --DEFININDO O VALOR DA VARIAVEL
	SET @vPARAM = 25;	  --DEFININDO O VALOR DA VARIAVEL

IF @vIDADEMAX >= @vPARAM											--SE A VARIAVEL FOR MAIOR QUE A OUTRA
	SELECT NOME														--MOSTRE O NOME
		  ,DATA_NASCIMENTO											--MOSTRE A DATA DE NASCIMENTO
		  ,DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) AS IDADE		--A DIFERENÇA DOS ANOS DA COLUNA DE DATA DE NASCIMENTO COM A DATA ATUAL
	FROM Ttemp														--DA TABELA TTEMP
	WHERE DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) >= @vIDADEMAX  --QUANDO A DIFERENÇA DO ANO DA DATA DE NASCIMENTO COM A DATA ATUAL FOR MAIOR OU IGUAL A VARIAVEL
ELSE
	SELECT NOME													    --MOSTRE O NOME
		  ,DATA_NASCIMENTO											--MOSTRE A DATA DE NASCIMENTO
		  ,DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) AS IDADE		--A DIFERENÇA DOS ANOS DA COLUNA DE DATA DE NASCIMENTO COM A DATA ATUAL
	FROM Ttemp														--DA TABELA TTEMP
	WHERE DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) < @vIDADEMAX   --QUANDO A DIFERENÇA DO ANO DA DATA DE NASCIMENTO COM A DATA ATUAL FOR MENOR A VARIAVEL DE IDADE MAXIMA

DROP TABLE Ttemp;--EXLCUINDO A TABELA
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------