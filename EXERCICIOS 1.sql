--CRIANDO TABELA PARA EXERCICIOS SIMPLES

create table VENDAS
(
	ID_NF INT NOT NULL,
	ID_ITEM INT NOT NULL,
	COD_PROD INT NOT NULL,
	VALOR_UNIT NUMERIC(5,2) NOT NULL,
	QUANTIDADE INT NOT NULL,
	DESCONTO INT
);

-- SELECT PARA VER SE OS RESULTADOS ESTAVAM DE ACORDO COM O EXERCICIO

SELECT * FROM VENDAS;

-- INSERINDO AS INFORMA??ES DO EXERCICIO NA TABELA

INSERT INTO DBO.VENDAS
	(ID_NF
	,ID_ITEM
	,COD_PROD
	,VALOR_UNIT
	,QUANTIDADE
	,DESCONTO)
VALUES 
	();

--PESQUISANDO QUAIS OS ITENS QUE TEM DESCONTO DENTRO DA TABELA, JUNTO COM AS COLUNAS 
--ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT

SELECT ID_NF
	  ,ID_ITEM
	  ,COD_PROD
	  ,VALOR_UNIT
FROM DBO.VENDAS
WHERE DESCONTO > 0 

--PESQUISAR OS ITENS QUE FORAM VENDIDOS COM DESCONTO, MOSTRANDO AGORA O VALOR VENDIDO NO FINAL

SELECT ID_NF
	  ,ID_ITEM
	  ,COD_PROD
	  ,VALOR_UNIT, 
	FLOOR (VALOR_UNIT-(VALOR_UNIT*DESCONTO/100)) AS "VALOR VENDIDO"
FROM DBO.VENDAS
WHERE DESCONTO > 0 

--FAZENDO O MESMO EXERCICIO DE CIMA, MAS AGORA ACRESCENTANDO ALGUMAS ALIAS

SELECT ID_NF AS "NUMERO NOTA FISCAL"
	  ,ID_ITEM AS "COD DO ITEM"
	  ,COD_PROD AS "COD DO PRODUTO"
	  ,VALOR_UNIT AS "VALOR UNITARIO",
FLOOR (VALOR_UNIT-(VALOR_UNIT*DESCONTO/100)) AS "VALOR VENDIDO"
FROM DBO.VENDAS
WHERE DESCONTO > 0

--ALTERAR O VALOR DE DESCONTO PARA ZERO DE TODOS OS REGISTROS ONDE ESTE CAMPO ? NULO.


--PESQUISAR OS ITENS QUE FORAM VENDIDOS COM DESCONTO, CONTENDO AS COLUNAS:
--ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_TOTAL, DESCONTO, VALOR_VENDIDO.
--ORDENANDO PELO VALOR TOTAL

SELECT ID_NF
	  ,ID_ITEM AS "COD DO ITEM"
	  ,COD_PROD AS "COD DO PRODUTO"
	  ,VALOR_UNIT "VALOR UNITARIO"
	  ,QUANTIDADE
      ,QUANTIDADE*VALOR_UNIT AS "VALOR TOTAL"
	  ,DESCONTO
	  ,(VALOR_UNIT-(VALOR_UNIT*DESCONTO/100)) AS "VALOR VENDIDO"
FROM DBO.VENDAS     
WHERE DESCONTO > 0
ORDER BY [VALOR TOTAL]
	
--PESQUISAR O VALOR TOTAL DAS NF ORDENANDO O RESULTADO DO MAIOR PARA O MENOR, CONTENDO AS COLUNAS:
--ID_NF, VALOR_TOTAL

SELECT ID_NF
	  ,(QUANTIDADE*VALOR_UNIT) AS "VALOR TOTAL"
FROM DBO.VENDAS
ORDER BY [VALOR TOTAL]

--PESQUISAR O VALOR VENDIDO DAS NF COM DESCONTO E ORDENE O RESULTADO DO MAIOR PARA O MENOR.
--AS COLUNAS PRESENTES NO RESULTADO S?O: ID_NF, VALOR_VENDIDO.

SELECT ID_NF
       ,VALOR_UNIT-(VALOR_UNIT*(DESCONTO/100)) AS "VALOR UNITARIO VENDIDO"
	   ,QUANTIDADE*VALOR_UNIT AS "VALOR TOTAL"	   
FROM DBO.VENDAS
WHERE DESCONTO > 0
ORDER BY ID_NF

--CONSULTE O PRODUTO QUE MAIS VENDEU NO GERAL, CONTENDO AS SEGUINTES COLUNAS:
--COD_PROD, QUANTIDADE, AGRUPAR POR COD_PROD.


SELECT COD_PROD
	  ,QUANTIDADE 
FROM DBO.VENDAS
ORDER BY QUANTIDADE DESC


--CONSULTE AS NF QUE FORAM VENDIDAS COM MAIS DE 1O UN, PELO MENOS UM PRODUTO.
--AS COLUNAS PRESENTES NESSA CONSULTA S?O: ID_NF, COD_PROD.

SELECT	ID_NF
	   ,COD_PROD
	   ,QUANTIDADE
FROM DBO.VENDAS
WHERE QUANTIDADE >= 10


--PESQUISE O VALOR TOTAL DAS NF, ONDE ESSE VALOR SEJA MAIOR QUE 200, E ORDENE O RESULTADO
--DO MAIOR VALOR PARA O MENOR. AS COLUNAS PRESENTES NO RESULTADO DA CONSULTA S?O:
--ID_NF, VALOR_TOTAL.

SELECT ID_NF
	  ,QUANTIDADE*VALOR_UNIT AS "VALOR TOTAL"
FROM DBO.VENDAS
ORDER BY [VALOR TOTAL] DESC


--QUAL O VALOR MEDIO DOS DESCONTOS DADO POR PRODUTO? AS COLUNAS PRESENTES NO RESULTADO
--S?O: COD_PROD, MEDIA.

SELECT COD_PROD
      ,AVG (DESCONTO) AS MEDIA
FROM DBO.VENDAS
GROUP BY COD_PROD

--QUAL O MENOR, MAIOR E O VALOR MEDIO DOS DESCONTOS DADO POR PRODUTO? AS COLUNAS
--PRESENTES NO RESULTADO S?O: COD_PROD, MENOR, MAIOR, MEDIA.

SELECT COD_PROD
	,AVG (DESCONTO) AS MEDIA
	,MAX (DESCONTO) AS MAIOR
	,MIN (DESCONTO) AS MENOR
FROM DBO.VENDAS
GROUP BY COD_PROD

--QUANTOS PRODUTOS POSSUEM CADA NF? AS COLUNAS PRESENTES S?O:
--ID_NF, QUANTIDADE_ITENS.

SELECT ID_NF
	  ,COUNT (COD_PROD) AS "TOTAL DE PRODUTOS"
FROM DBO.VENDAS 
GROUP BY ID_NF;


SELECT *
FROM VENDAS;