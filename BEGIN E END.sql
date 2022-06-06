--BEGIN 

--CONTROLE DE FLUXO DAS INSTRU플O T-SQL (TRANSACTION SQL)
-----------------------------------------------------------------------------------------------------------

--FAZENDO UMA TABELA COM COLUNAS E ALGUMAS INFORAM합ES DE 3 TABELAS DIFERENTES, USANDO INNER JOIN E O INTO.
SELECT X.*
INTO TTEMP
FROM (
		SELECT ROW_NUMBER() OVER(ORDER BY ID_ALUNO) LINHA,
			   Y.ID_ALUNO
			  ,Y.NOME
			  ,Y.SEXO
			  ,Y.NOME_CURSO
			  ,Y.DATA_INICIO
			  ,Y.DATA_TERMINO
			  ,Y.VALOR
		FROM(
						SELECT A.ID_ALUNO
							  ,A.NOME
							  ,A.SEXO
							  ,C.NOME_CURSO
							  ,T.DATA_INICIO
							  ,T.DATA_TERMINO
							  ,AT.VALOR
						FROM AlunosxTurmas AT
							INNER JOIN Turmas T 
								ON T.ID_TURMA = AT.ID_TURMA
									INNER JOIN CURSOS C 
									ON C.ID_CURSO = T.ID_CURSO
										INNER JOIN ALUNOS A
										ON A.ID_ALUNO = AT.ID_ALUNO)Y
	)X

SELECT *
FROM TTEMP;
-----------------------------------------------------------------------------------------------------------

DECLARE @VCONTADOR INT = 1;

WHILE @VCONTADOR < 10
BEGIN
	PRINT 'CONTADOR : ' + CONVERT(VARCHAR, @VCONTADOR)
	SET @VCONTADOR = @VCONTADOR +1 
END
-----------------------------------------------------------------------------------------------------------

--SEM O BEGIN ANINHADO

BEGIN TRANSACTION;

IF @@TRANCOUNT = 0

	SELECT NOME
		  ,NOME_CURSO
		  ,SEXO	
	FROM TTEMP
	WHERE SEXO = 'M'

ROLLBACK TRANSACTION;

PRINT 'EXECUTAR DOIS ROLLBACKS GERARIA UM ERRO DE EXECU플O DO SEGUNDO';

ROLLBACK TRANSACTION;

PRINT 'TRANSA플O DESFEITA'
-----------------------------------------------------------------------------------------------------------

--COM BEGIN ANINHADO

BEGIN TRANSACTION 

IF @@TRANCOUNT = 0

	BEGIN 
		SELECT NOME
			  ,NOME_CURSO
			  ,SEXO
		FROM TTEMP
		WHERE SEXO = 'M'
	ROLLBACK TRANSACTION;
		PRINT 'EXECUTAR DOIS ROLLBACKS GERA UM ERRO NO SEGUNDO';
	END;

ROLLBACK TRANSACTION 

PRINT 'TRANSA플O DESFEITA';

DROP TABLE TTEMP;
