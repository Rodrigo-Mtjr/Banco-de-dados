--FUNÇÕES DE TEXTO

--FUNÇÕES: ASCII, NCHAR, CHAR, CHARINDEX, CONCAT, CONCAT_WS, DIFERENCE



--ASCII - RETORNA O CODIGO NUMERICO DA TABELA ASCII REFERENTE AO CARACTERER ENTRE ()
select ascii ('a');
select ascii ('A');
select ascii ('9');
select ascii ('Alessandro');


--NCHAR - RETORNA A LETRA REFERENTE AO NUMERO COLOCADO ENTRE ()
select nchar(65);
select nchar(97);
select nchar(57);


--CHAR (CONVERTE UM CODIGO ASCCI DO TIPOINT EM UM VALOR DE CARACTERE)
select char(65);
select char(97);


--CHARINDEX (PESQUISA UM CARACTERE EM UMA SEQUENCIA DE ATÉ 8.000 CARACTERES)
select charindex('a','trovato'); --SABER A POSIÇÃO DE CARACTERE DENTRO DE UM PALAVRA OU SEQUENCIA
select charindex('a','trovato',6); --MOSTRAR A PARTIR DA POSIÇÃO 6, POR ISSO QUE TEM O NUMERO NO FINAL, DEFINE DE ONDE VOCE QUER EXECUTAR A FUNÇÃO
select charindex('martins', 'rodrigo alexandre martins junior');


--EXEMPLOS DENTROD DE TABELAS
select *
from Alunos;

select a.nome, CHARINDEX('Silva', a.nome)
from Alunos a;

select a.nome, CHARINDEX('Silva', a.nome)
from Alunos a
where convert(int, charindex('Silva', a.nome)) > 0;

select a.nome, CHARINDEX('Silva', a.nome)
from Alunos a
where charindex('Silva', a.nome, 1) <> '0'


--CONCAT - CONCATENA VALORES
select CONCAT('Rodrigo', ' ', 'Martins'); --NESSE EXEMPLO O NOME VAI APARECER COM ESPAÇAMENTO
select CONCAT('Rodrigo', 'Martins'); --JA NESSE EXEMPLO, O NOME VAI APARECER SEM ESPAÇAMENTO

--OUTRO EXEMPLO DE CONTATENAR STRINGS
select 'Rodrigo' + ' ' + 'Martins';


--USANDO CONCAT COM INNER JOIN
select concat(a.nome, ': CURSANDO - ', c.nome_curso) as "NOME ALUNO - CURSO"
from alunos a
	inner join AlunosxTurmas at
	on at.id_aluno = a.id_aluno
	inner join Turmas t 
	on t.id_turma = at.id_turma
	inner join Cursos c 
	on c.id_curso = t.id_curso;



--CONCAT_WS - DEFINA APENAS UMA VEZ QUAL SERA O SEPARADOR ENTRE OS CARACTERES
select CONCAT_WS(' - ', 'RODRIGO', 'ALEXANDRE', 'MARTINS', 'JUNIOR');

select CONCAT_WS(' - ', a.nome, c.nome_curso,
		'INCIO : ' + convert(char, t.data_inicio),
		'TERMINO : ' + convert(char, t.data_termino))
from alunos a
	inner join AlunosxTurmas at
	on at.id_aluno = a.id_aluno
	inner join Turmas t 
	on t.id_turma = at.id_turma
	inner join Cursos c 
	on c.id_curso = t.id_curso;


--ELIMINAR OS ESPAÇAMENTOS NO RESULTADO COM  A FUNÇÃO TRIM
select CONCAT_WS(' - ', 'RODRIGO', 'ALEXANDRE', 'MARTINS', 'JUNIOR');

select CONCAT_WS(' - ', a.nome, c.nome_curso,
		'INICIO : ' + trim(convert(char, t.data_inicio)),
		'TERMINO : ' + trim(convert(char, t.data_termino)))
from alunos a
	inner join AlunosxTurmas at
	on at.id_aluno = a.id_aluno
	inner join Turmas t 
	on t.id_turma = at.id_turma
	inner join Cursos c 
	on c.id_curso = t.id_curso;



--DIFFERENCE (escala de 0 a 4), BOM PARA COMPARAR TEXTO
select DIFFERENCE('Alessandro', 'Alexsandro');