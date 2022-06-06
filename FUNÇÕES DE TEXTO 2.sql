--FUNÇÕES DE TEXTO

--FUNÇÕES: FORMAT, LEFT, RIGHT, LEN, LOWER, UPPER
--COMENTARIO EM BLOCO



--FORMAT 
--RETORNAR UM VALOR FORMATADO E A CULTURA OPCIONAL(ESPECIFICAR)


declare @dt datetime = getdate();	--ESTOU DECLARANDO QUE A VARIAVEL @DT VAI SER IGUAL A DATA ATUAL.

select format (@dt, 'd', 'en-US') as AMERICANO,
	   format (@dt, 'd', 'zh-cn') as "CHINES SIMPLFICADO",
	   format (@dt, 'd', 'de-de') as ALEMAO,
	   format (@dt, 'D', 'en-US') as AMERICANO,
	   format (@dt, 'D', 'zh-cn') as "CHINES SIMPLIFICADO",
	   format (@dt, 'D', 'de-de') as ALEMAO;
--BASICAMENTE ESTAMOS FALANDO PARA QUE O SISTEMA MUDE AS INFORMAÇÕES DA NOSSA VARIAVEL PARA OS FORMATOS DECLARADOS NA FUNÇÃO FORMAT


--PODEMOS FAZER A UTILIZAÇÃO DO FORMAT PARA NOS APRESENTAR ALGUMAS INFORMAÇÕES DE MODO DIFERENTE

select format(at.valor, 'N', 'en-US') "FORMATO AMERICANO",
	   format(at.valor, 'G', 'en-US') "FORMATO GERAL",
	   format(at.valor, 'C', 'pt-BR') "FORMATO MONETARIO BR",
	   format(at.valor, 'C', 'en-US') "FORMATO MONETARIO US",
	   format(at.valor, 'C', 'de-de') "FORMATO MONETARIO AL",
	   format(at.valor, 'C', 'de-at') "FORMATO MONETARIO AUS"
from AlunosxTurmas at


--LEFT
--EXTARI CARACTERES A ESQUERDA DE UM TEXTO OU CAMPO
select left('RODRIGO MARTINS', 10);
select left('Este é um curso de SQL', 18);

/* NESSE EXEMPLO ABAIXO, VAMOS FAZER O SISTEMA RETORNAR OS 5 CARACTERES DE TODOS OS NOMES
DA TABELA ALUNOS, MAS COM A FUNÇÃO 'DISTINCT' JUNTO, PARÃ NÃO MOSTRAR NOMES REPETIDOS*/
select distinct left (a.nome, 5)
from Alunos a;


--RIGHT 
--FUNÇÃO AO CONTRARIA DO LEFT, EXTRAI CARACTERES A DIREITA DE UM TEXTE OU CAMPO
 select right('Rodrigo Martins', 7);
 select right('Este é um curso de SQL', 12);

 select right(a.nome, 5)
 from alunos a;

 --PODEMOS TAMBEM JUNTAS AS FUNÇÕES LEFT E RIGHT 
 select left(a.nome, 5) + right(a.nome, 5)
 from alunos a;


 --LEN - RETORNA O TAMANHO DO CAMPO
 select len('Rodrigo Martins');
 select len('Este é um curso de SQL');

 select a.nome, len(a.nome) "TAMANO DO NOME"
 from Alunos a;

 select max(len(a.nome)) as "MAIOR NOME"
from Alunos a 

select min(len(a.nome)) as "MENOR NOME"
from alunos a;


--UPPER
--CONVERTE OS CARACTERES PARA MAIUSCULO
select upper('Rodrigo Martins') as "NOME EM MAISCULO";

select UPPER(a.nome) "NOME DO ALUNO"
FROM Alunos a;


--LOWER
--CONVERTE OS CARACTERESPARA MINUSCULO
select lower('Rodrigo Martins') as "NOME EM MAISCULO";

select lower(a.nome) "NOME DO ALUNO"
FROM Alunos a;