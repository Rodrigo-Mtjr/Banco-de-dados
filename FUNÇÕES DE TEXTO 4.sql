--FUNÇÕES DE TEXTO

--FUNÇÕES: SPACE, STRING_AGG E STUFF


--SPACE - ACRESCENTA ESPAÇOS DENTRO DOS CARACTERES

select 'Alessandro' + SPACE(25); -- ME MOSTRE O NOME ALESSANDRO COM UM ESPAÇO DE 25 POSIÇÕES
select 'Alessandro' + SPACE(25) + 'x'; -- ME MOSTRE O MESMO RESTULADO COM O X NO FINAL.

declare @vNome varchar(50);
set @vNome = 'Rodrigo Martins';
select @vNome + SPACE(50-len(@vNome));

select a.nome + space(60 - len(a.nome)) + a.sexo
from alunos a;

select a.nome + space(60 - len(a.nome)) + a.sexo, len(nome + space(60 - len(a.nome)) + a.sexo) as "TOTAL CARACTERES"
from alunos a;


--STING_AGG - CONCATENA OS VALORES DAS EXPRESSÕES DE CADEIA DE CARACTERES E COLOCA OS VALORES
-- DO SEPARADOR ENTRE ELES.
--O SEPARADOR NÃO É ADICIONADO AO FINAL DA CADEIA DE CARACTERES.
--OS VALORES NULLS NAO SAO EXIBIDOS

select string_agg(convert(nvarchar(max), sexo), ',') as Registro
from alunos;

select string_agg(convert(nvarchar(max), isnull(sexo, 'N')), '-') as Registro
from Alunos;

select DATEPART(year, data_nascimento) as ANO,
	   string_agg(CONVERT(NVARCHAR(MAX), ISNULL(sexo,'0')),'-') AS REGISTRO
FROM ALUNOS
GROUP BY DATEPART(YEAR, DATA_NASCIMENTO)
ORDER BY 1;

--STUFF - alteração de valores

select stuff('adcdefghi',3,5,'12345');

declare @vProcura varchar(50);
declare @vSubstit varchar(30);
set @vProcura = 'Eu, xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, autorizo...';
set @vSubstit = 'Alessandro Trovato';

select stuff(@vProcura,5,30,@vSubstit + space(30 - len(@vsubstit)));
select STUFF(@vProcura,5,30,trim(@vsubstit + space(30 - len(@vSubstit)))) as termo;