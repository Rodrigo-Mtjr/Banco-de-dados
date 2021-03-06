--ESTRUTURA WHILE

--ESTRUTURA DE REPETI??O
--------------------------------------------------------------------------------------------------------------------------------------

SELECT *
INTO TTEMP
FROM ALUNOS;
--------------------------------------------------------------------------------------------------------------------------------------

--SUBSTITUI??O DE VALORES COM O WHILE

DECLARE @VSTRING VARCHAR(100);									--DECLARANDO VARIAVEL
	SET @VSTRING = 'SQL            SERVER                  |'	--DEFININDO O QUE VAI TER DENTRO DA VARIAVEL

WHILE CHARINDEX('  ', @VSTRING) > 0				                --PROCURE DENTRO DA VARIAVEL DOIS ESPA?OES
BEGIN											                --FUN?AO PARA INICIAR A CONTAGEM	
	SET @VSTRING = REPLACE(@VSTRING, '  ', ' ')	                --DEPOIS DE ENCONTRAR OS DOIS ESPA?OS, TROQUE ELES POR UM ESPA?O
END												                --FUN??O PARA ENCERRAR A CONTAGEM
												                
SELECT @VSTRING									                --SELECIONANDO A STRING PARA VOLTAR O RESULTADO NO FINAL
--------------------------------------------------------------------------------------------------------------------------------------

--CONTADOR

DECLARE @VCONT INT;                                             --DECLARANDO VARIAVEL
	SET @VCONT = 1;                                             --INSERINDO VALOR NA VARIAVEL
															    
WHILE (@VCONT <= 10)                                            --ENQUANTO A VARIAVEL FOR MENOR QUE 10
BEGIN				                                            --FA?A
	PRINT 'O CONTADOR EST? EM : ' + CONVERT(VARCHAR,@VCONT)     --ESCREVA A VARIAVEL CONVERTIDA PARA VARCHAR
	  SET @VCONT = @VCONT + 1                                   --E FA?A QUE A VARIAVEL SEMPRE RECEBA 1 
END;														    --FINALIZANDO O SISTEMA
--------------------------------------------------------------------------------------------------------------------------------------

--BREAK

DECLARE @VCONT1 INT;											--DECLARANDO VARIAVEL
	SET @VCONT1 = 1;											--INSERIANDO VALOR NA VARIAVEL

WHILE (@VCONT1 <= 10)											--ENQUANTO A VARIAVEL FOR MENOR QUE 10
BEGIN															--FA?A	
	PRINT 'O CONTADOR EST? EM : ' + CONVERT(VARCHAR, @VCONT1)	--MOSTRAR A VARIAVEL CONVERTIDA PARA VARCHAR
	IF @VCONT1 = 7												--SE A VARIAVEL FOR IGUAL A 7
	BREAK														--ENTAO PAUSE A FUN??O	
	SET @VCONT1 = @VCONT1 + 1									--SEMPRE FA?A COM QUE A VARIAVEL RECEBA 1
END																--FINALIZANDO O SISTEMA
--------------------------------------------------------------------------------------------------------------------------------------

--NUMEROS IMPARES 

DECLARE @VCONT2 INT;											--DECLARANDO VARIAVEL
	SET @VCONT2 = 1;											--INSERINDO VALOR NA VARIAVEL	
																
WHILE (@VCONT2 <= 17)											--ENQUANTO A VARIAVEL FOR MENOR OU IGUAL A 17	
BEGIN															--FA?A 	
	IF @VCONT2 % 2 = 0											--SE A DIVIS?O DA VARIAVEL POR 2 FOR IGUAL A ZERO	
	BEGIN														--FA?A
		SET @VCONT2 = @VCONT2 + 1								--SEMPRE FA?A COM QUE A VARIAVEL RECEBA ELA MAIS 1
		CONTINUE												--CONTINUE O SISTEMA	
	END															--FINALIZE O IF	
	PRINT 'O VALOR ? : ' + CONVERT(VARCHAR, @VCONT2)			--MOSTRAR A VARIAVEL QUE PASSOU PELO TESTE VERDADEIRO NA FORMULA DO IF
	SET @VCONT2 = @VCONT2 + 1									--SEMPRE FAZENDO COM QUE A VARIAVEL RECEBA +1	
END																--FINALIZANDO WHILE	
--------------------------------------------------------------------------------------------------------------------------------------

--LER REGISTRO EM UMA TABELA

SELECT X.*													--CRIANDO UMA TABELA
INTO TTEMP													--COM O NOME TTEMP	
FROM (														--COPIE TODAS AS COLUNAS DA SUBQUERY		
		SELECT ROW_NUMBER() OVER(ORDER BY ID_ALUNO) LINHA,	--FA?A UMA COLUNA NOVA CHAMADA LINHA, AONDE ELA ORDENE AS LINHAS DE TODAS AS COLUNAS
			   Y.ID_ALUNO									--MOSTRE O ID DO ALUNO
			  ,Y.NOME										--NOME DO ALUNO	
			  ,Y.NOME_CURSO									--NOME DO CURSO
			  ,Y.DATA_INICIO								--DATA INICIO DO CURSO
			  ,Y.DATA_TERMINO								--DATA TERMINO
	    FROM (												--CRIA??O DA SUBQUERY
	    SELECT A.ID_ALUNO									--MOSTRE O ID ALUNO
			  ,A.NOME										--NOME DO ALUNO
			  ,C.NOME_CURSO									--NOME DO CURSO
			  ,T.DATA_INICIO								--DATA INICIO CURSO
			  ,T.DATA_TERMINO								--DATA TERMINO CURSO
		FROM ALUNOSXTURMAS AT								--PEGUE ESSAS INFORMA??ES DA TABELA ALUNOSXTURMA
				INNER JOIN TURMAS T							--FA?A UMA RELA??O COM A TABELA TURMA
					ON (T.ID_TURMA = AT.ID_TURMA)			--ONDE O ID TURMA DA TABELA TURMA ? IGUAL A ID TURMA DA TABELA ALUNOSXTURMAS	
					INNER JOIN CURSOS C						--FA?A UMA RELA??O COM A TABELA CURSO
						ON (C.ID_CURSO = T.ID_CURSO)		--ONDE O ID CURSO DA TABELA CURSO ? IGUAL A ID CURSO DA TABELA TURMA	
						INNER JOIN ALUNOS A					--FA?A UMA RELA??O COM A TABELA ALUNOS	
							ON (A.ID_ALUNO = AT.ID_ALUNO)	--ONDE O ID ALUNO DA TABELA ALUNO ? IGUAL A ID ALUNO DA TABELA ALUNOSXTURMAS
			 ) Y											--FECHE A SUBQUERY
	 )X														--FECHE A QUERY PRINCIPAL

--LEMBRE-SE QUE O X.* NO COME?O DA QUERY, SIGNIFICA QUE VOCE QUER QUE O SISTEMA MOSTRE APENAS A QUERY ENTRE PARENTES X
--A Y VAI SER APENAS PARA TRAZER AS INFORMA??ES NECESSARIAS PARA MONTAR A QUERY
--------------------------------------------------------------------------------------------------------------------------------------

DECLARE @CONTADOR INT,										--DECLARANDO VARIAVEL
		@MAXLINHAS INT,										--DECLARANDO VARIAVEL
		@CURSOPROCURA NVARCHAR(100),						--DECLARANDO VARIAVEL
		@CURSONOME NVARCHAR(100),							--DECLARANDO VARIAVEL
		@NOMEALUNO NVARCHAR(100)							--DECLARANDO VARIAVEL
SET @CURSOPROCURA = 'WORD AVAN?ADO'							--DEFININDO QUE A VARIAVEL VAI RECEBER O TEXTO

SELECT @CONTADOR = MIN(LINHA), @MAXLINHAS =  MAX(LINHA)		--FA?A COM QUE A VARIAVEL DO CONTADOR SEJA IGUAL O MININO DE LINHAS DA COLUNA LINHAS E A VARIAVEL MAXLINHAS SEJA O MAXIMO DE LINHAS DA COLUNA LINHAS
  FROM TTEMP												--TABELA QUE VAI SERVIR PARA PEGAR AS INFORMA??ES	
		
WHILE (@CONTADOR IS NOT NULL AND @CONTADOR <= @MAXLINHAS)	--ENQUANTO A VARIAVEL DO CONTADOR NAO FOR NULA E FOR MENOS QUE A VARIAVEL DE LINHAS, QUE SERIA MENOR QUE A QUANTIDADE DE LINHNAS DA COLUNA
BEGIN														--FA?A	
	SELECT @CURSONOME = NOME_CURSO,							--A VARIAVEL CURSONOME RECEBE NOME DO CURSO	
		   @NOMEALUNO = NOME								--VARIAVEL NOMEALUNO RECEBE NOME DO ALUNO
	FROM TTEMP												--TABELA QUE VAI SERVIR PARA BUSCAR INFORMA??ES
	WHERE LINHA = @CONTADOR									--APENAS SE A LINHA FOR IGUAL A VARIAVEL CONTADOR

		IF CHARINDEX(@CURSOPROCURA, @CURSONOME) > 0			--SE A VARIAVEL CURSOPROCURA E A CURSONOME FOR MAIOR QUE ZERO
			PRINT CONVERT(VARCHAR, @CONTADOR) + ' > CURSO: '--MOSTRE O NUMERO DA LINHA CONVERTIDO EM VARCHAR COM A MENSAGEM PRINTADA
			+ @CURSONOME + ' ALUNO : ' + @NOMEALUNO			--MOSTRE TAMBEMO NOME DO CURSO, E O NOME DO ALUNO	

	SET @CONTADOR = @CONTADOR + 1							--DEFININDO SEMPRE QUE O CONTADOR VAI RECEBER 1 TODAS AS VEZES AT? BATER O NUMERO DE LINHAS MAXIMA

END
