--UNION DE SELECTS

--MESMO NUMERO DE COLUNAS
--O USO DO NULL PARA CONTORNAR LIMITAÇÃO
--NOME DAS COLUNAS SERA DO PRIMEIRO SELECT
--EXECUTA UM DISTINCT QUANDO UTILIZADO


SELECT p.EnglishProductName
	  ,p.SafetyStockLevel
	  ,p.DaysToManufacture
	  ,p.Class
	  ,p.Color
FROM DimProduct p
WHERE p.color = 'NA'

UNION -- NAO DARA CERTO SE OS SELECTs ESTIVEREM COM O NUMERO DE COLUNAS DIFERENTES

SELECT p.EnglishProductName
	  ,p.SafetyStockLevel
	  ,p.DaysToManufacture
	  ,p.Class
	  ,p.Color
FROM DimProduct p
WHERE p.color <> 'NA'



--PARA IGNORAR A LIMITAÇÃO DE TER COLUNAS IGUAIS


SELECT p.EnglishProductName
	  ,p.SafetyStockLevel
	  ,p.DaysToManufacture
	  ,null
	  ,null
FROM DimProduct p
WHERE p.color = 'NA'

UNION -- BASTA ACRESCENTAR COM A PALAVRA NULL, PARA TER O MESMO NUMERO DE COLUNAS

SELECT p.EnglishProductName
	  ,p.SafetyStockLevel
	  ,p.DaysToManufacture
	  ,p.Class
	  ,p.Color
FROM DimProduct p
WHERE p.color <> 'NA'

--ORDEM DOS CAMPOS TAMBEM INTERFERE, SEMPRE MONTAR AS QUERY NA SEQUENCIA CORRETA.
--BASTA APENAS COPIAR A QUERY JA FEITA E COLOCAR EM BAIXO.


--ALIAS PARA COLUNAS
select p.EnglishProductName as PRODUTO
	  ,p.SafetyStockLevel AS ESTOQUE
	  ,p.DaysToManufacture AS DIAS 
	  ,p.Class AS CLASSE
	  ,p.Color AS COLOR
from DimProduct p
where color = 'NA'
	and p.Class is not null

union

select p.EnglishProductName
	  ,p.SafetyStockLevel
	  ,p.DaysToManufacture
	  ,p.Class
	  ,p.Color
from DimProduct p
where color = 'Black'
	and Class = 'L'

--PARA DAR ALIAS NAS COLUNAS, TEM QUE DECLARAR NO PRIMEIRO SELECT, ANTES DO UNION.
--POIS SE DECLARAR NO SEGUNDO, VAI APARECER COMO A COLUNA FOI REGISTRADO.


--UNION (DISTINCT) /  UNION ALL (TODOS OS REGISTROS)

select EnglishProductName
	  ,class
	  ,Color 
from DimProduct

union all -- ELE VAI REPETIR AS INFORMAÇÕES QUE TEM MAIS DE UMA 

select EnglishProductName
	  ,class
	  ,Color 
from DimProduct
order by 1