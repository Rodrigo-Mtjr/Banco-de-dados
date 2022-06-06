--FUNÇÕES DE TEXTO

--FUNÇÃO LTRIM - RETIRA ESPAÇOS A ESQUERDA
select ltrim('          Rodrigo');
select ltrim('x         Rodrigo');

declare @varTexto varchar(50);
	set @varTexto = '            Este é um texto para teste do LTRIM';

select ltrim(@varTexto) as Teste;
select Resultado = ltrim(@varTexto);


--FUNÇÃO RTRIM - RETIRA ESPAÇOS A DIREITA
select rtrim('Rodrigo        ');
select len(rtrim('Rodrigo        '));

declare @varTexto2 varchar(50);
	set @varTexto2 = 'Este é um texto para teste do RTRIM'

select rtrim(@varTexto2);



--FUNÇÃO PATINDEX
--RETORNA A POSIÇÃO INICIAL DA PRIMEIRA OCORRENICA DE UM PADRAO

select PATINDEX('%tro%', 'Alessandro Trovato');
select PATINDEX('%a','Terça');
select PATINDEX('a%','Trovato');
select PATINDEX('a%', 'Alessandro');

select posicao = PATINDEX('%at%', 'Alessandro Trovato');
select posicao = PATINDEX('%dro_trov%','Alessandro Trovato');

declare @varTexto3 varchar(100);
	set @varTexto3 = 'Aqui é o canal do Alessandro Trovato no Youtube';

 --SUBSTRING
 select SUBSTRING(@varTexto3, patindex('%Trovato%',@varTexto3), 7);
 select PATINDEX('%Trovato%',@varTexto3);


 --REPLACE
 --TROCAR UM CARACTERE PELO OUTRO 

 select replace('RODRIGO ALEXANDRE', 'A','X');
 select replace(replace('RODRIGO ALEXANDRE', 'A','X'),'O','?');

 select a.nome
	   ,a.data_nascimento
	   ,replace(a.sexo, 'M', 'Masculino') as SEXO
 from Alunos a

declare @cpf varchar(15);
	set @cpf = '111.222.333-44';

select REPLACE(REPLACE(@cpf,'.',''),'-','') as CPF;



--REPLICATE - REPLICA UM CARACTERE QUANTAS VEZES QUISER
select replicate('x', 20);

--TAMANHO DE COLUNA FIXO EM 50 POSIÇÕES
--PASSO 1
select *
from Alunos;

select len(nome)
from Alunos;

--PASSO 2
select nome + replicate ('x', 50 - len(nome))
from Alunos;

--PASSO 3 
 select len(nome + replicate('x', 50 - len(nome))) as TAMANHO
 from Alunos;



 --REVERSE 
 select reverse ('RODRIGO MARTINS');

 select REVERSE (nome)
 from Alunos;