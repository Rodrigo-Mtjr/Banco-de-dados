--FUNÇÕES DE TEXTO 


--SUBSTRING - RETIRA UMA PARTE DO TEXTO OU DE UM CAMPO
select SUBSTRING('Rodrigo Martins',1,10) as NOME;

select SUBSTRING(a.nome, 1, 20) as "NOME PARCIAL"
from alunos a;

--DOIS PRIMEIROS NOME DO NOSSO BANCO DE DADOS
--CASE / WHEN
select a.nome,
	case SUBSTRING(a.nome, 1, CHARINDEX(' ', a.nome, charindex(' ', a.nome)+1))
	when '' then
		a.nome
	else	
		SUBSTRING(a.nome, 1, CHARINDEX(' ', a.nome, charindex(' ', a.nome)+1))
	end as "NOME EXTRAIDO"
from alunos a


--IIF
select a.nome,
	iif(substring(a.nome,1,charindex(' ', a.nome, charindex(' ', a.nome) +1)) = '',
		a.nome,
		substring(a.nome,1,charindex(' ', a.nome, charindex(' ', a.nome) +1)))
from alunos a


--TRANSLATE
select translate('2*[3+4]/{7-2}','[]{}','()()'); 
select translate('abcdefghi', 'abc','123');



--TRIM
select trim('Alessandro Trovato       ');
select trim('        Alessandro        Trovato      ');


--WHILE
declare @vString varchar(100);
	set @vString = 'SQL        SERVER      |';

	while charindex('  ', @vString) > 0
	begin 
		set @vString = replace(@vString, '  ', ' ')
	end

	select @vString;


--UPPER / LOWER
select a.nome
	  ,upper(a.nome) as Maiusculo
	  ,lower(a.nome) as Minusculo
from alunos a;