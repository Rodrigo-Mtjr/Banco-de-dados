--TOTAL DE TURMAS POR CURSO
--INNER JOIN

select c.id_curso
	  ,c.nome_curso 
	  ,count(t.id_turma) as "TOTAL TURMAS"
from dbo.Turmas t 
	inner join dbo.cursos c 
	on c.id_curso = t.id_curso
group by c.id_curso, c.nome_curso



--TODOS OS CURSOS, INDEPENDENTE SE HÁ OU NÃO TURMAS
--RIGHT JOIN
select  c.id_curso
	   ,c.nome_curso
	   ,count(t.id_turma) as "TOTAL TURMAS"
from dbo.Turmas t 
		right join dbo.Cursos c on c.id_curso = t.id_curso
group by  c.id_curso,c.nome_curso;

--FAZENDO A MESMA PESQUISA COM WHERE

select c.id_curso
	  ,c.nome_curso
	  ,count (t.id_turma) as "TOTAL TURMA"
from dbo.Turmas t, 
	 dbo.Cursos c	
where c.id_curso = t.id_curso
group by c.nome_curso, c.id_curso

--LISTA COMPLETA DE ALUNOS COM NOME DO CURSO, VALOR DO CURSO, DESCONTO, TOTAL LOUIDO
--INICIO DO CURSO, TERMINO DO CURSO, NOME DO ALUNO, SEXO DO ALUNO
--LEMBRANDO QUE TODOS OS CAMPOS ESTÃO COM ALIAS

select *
from dbo.AlunosxTurmas;

select *
from dbo.Cursos;

select *
from Turmas;

select C.nome_curso AS "NOME DO CURSO"
	  ,AT.valor AS "VALOR DO CURSO"
	  ,AT.valor_desconto AS "VALOR DE DESCONTO"
	  ,floor((at.valor * at.valor_desconto)) AS "TOTAL DESCONTO"
	  ,floor (at.valor - (at.valor * at.valor_desconto)) AS "TOTAL LIQUIDO"
	  ,T.data_inicio AS "INICIO DO CURSO"
	  ,T.data_termino AS "TERMINIO DO CURSO"
	  ,A.nome AS "NOME DO ALUNO"
	  ,A.sexo "SEXO DO ALUNO"	  
from dbo.AlunosxTurmas AT
	inner join dbo.Turmas T 
		on T.id_turma = AT.id_turma
	inner join dbo.Alunos A 
		on A.id_aluno = AT.id_aluno
	inner join dbo.Cursos C
		on C.id_curso = T.id_curso


-- QUANTIDADE DE TURMAS COM ALUNOS
	
select T.id_turma
	  ,c.nome_curso
	  ,count(1) as TOTAL
from Dbo.Turmas T
	inner join dbo.AlunosxTurmas At on AT.id_turma = t.id_turma
	inner join dbo.Cursos C on C.id_curso = t.id_curso

group by c.nome_curso, T.id_turma 
