--OPERAÇÕES DE AGREGAÇÃO NO SELECT

--GANHO COM TURMA
--QUANTO PAGA CADA ALUNO MATRICULADO
select c.nome_curso "NOME DO CURSO"
	  ,t.id_turma "CODIGO DA TURMA"
	  ,FLOOR (at.valor) "VALOR DO CURSO"
	  ,FLOOR (at.valor*at.valor_desconto) as "VALOR DO DESCONTO"
	  ,FLOOR (at.valor-(at.valor*(at.valor_desconto))) as "VALOR LIQUIDO"
from dbo.Turmas t
	inner join AlunosxTurmas at 
	on at.id_turma = t.id_turma
	inner join dbo.Cursos c
	on c.id_curso = t.id_curso



--SOMATORIA 
select c.nome_curso "NOME DO CURSO"
	  ,SUM (at.valor) "VALOR DO CURSO"
	  ,sum (at.valor*at.valor_desconto) as "VALOR DO DESCONTO"
	  ,sum (at.valor-(at.valor*(at.valor_desconto))) as "VALOR LIQUIDO"
from dbo.Turmas t
	inner join AlunosxTurmas at 
	on at.id_turma = t.id_turma
	inner join dbo.Cursos c
	on c.id_curso = t.id_curso
group by c.nome_curso



--SOMAR O TOTAL DE VALOR DO CURSO
select c.nome_curso as "NOME DO CURSO"
	  ,t.id_turma as "CODIGO DA TURMA"
	  ,sum(at.valor) as TOTAL
from AlunosxTurmas AT
	INNER JOIN DBO.Turmas T
	on t.id_turma = at.id_turma
	INNER JOIN DBO.Cursos c
	on c.id_curso = t.id_curso
group by c.nome_curso, t.id_turma



--SOMATORIA POR CURSO X TURMA
select c.nome_curso  as "NOME DO CURSO"
	  ,t.id_turma as "COD DA TURMA"
	  ,SUM (at.valor) "VALOR DO CURSO"
	  ,sum (at.valor*at.valor_desconto) as "VALOR DO DESCONTO"
	  ,sum (at.valor-(at.valor*(at.valor_desconto))) as "VALOR LIQUIDO"
from dbo.Turmas t
	  inner join AlunosxTurmas at 
	  on at.id_turma = t.id_turma
	  inner join dbo.Cursos c
	  on c.id_curso = t.id_curso
group by c.nome_curso, t.id_turma



--ARREDONDAMENTO DOS VALORES
select c.nome_curso  as "NOME DO CURSO"
	  ,t.id_turma as "COD DA TURMA"
	  ,sum(at.valor) "VALOR DO CURSO"
	  ,round (sum (at.valor*at.valor_desconto),0) as "VALOR DO DESCONTO"
	  ,round (sum (at.valor-(at.valor*(at.valor_desconto))),0) as "VALOR LIQUIDO"
from dbo.Turmas t
	  inner join AlunosxTurmas at 
	  on at.id_turma = t.id_turma
	  inner join dbo.Cursos c
	  on c.id_curso = t.id_curso
group by c.nome_curso, t.id_turma



--GANHOS POR ANO
select year(t.data_inicio) as ANO
	  ,sum(at.valor) "VALOR BRUTO"
	  ,round (sum (at.valor*at.valor_desconto),0) as "VALOR DO DESCONTO"
	  ,round (sum (at.valor-(at.valor*(at.valor_desconto))),0) as "VALOR LIQUIDO"
from dbo.Turmas t
	  inner join AlunosxTurmas at 
	  on at.id_turma = t.id_turma
	  inner join dbo.Cursos c
	  on c.id_curso = t.id_curso
group by year(t.data_inicio) 



--COUNT 
SELECT t.id_turma
	  ,count(at.valor) as TOTAL
FROM AlunosxTurmas at	
	inner join dbo.turmas t
	on t.id_turma = at.id_turma
group by t.id_turma

SELECT t.id_turma
	  ,count(at.id_aluno) as "TOTAL ALUNO"
	  ,sum(at.valor) as "VALOR TOTAL"
FROM AlunosxTurmas at	
	inner join dbo.turmas t
	on t.id_turma = at.id_turma
group by t.id_turma



--AVERAGE / MEDIA
select t.id_turma
	  ,c.nome_curso
	  ,avg(at.valor) as "TOTAL MEDIA"
from AlunosxTurmas at
	inner join dbo.Turmas t 
	on t.id_turma = at.id_turma
	inner join dbo.Cursos c
	on c.id_curso = t.id_curso
group by t.id_turma, c.nome_curso



--MAX (MAIOR VALOR)
select t.id_turma
	  ,c.nome_curso
	  ,max(at.valor) as "VALOR MAXIMO"
from AlunosxTurmas at
	inner join dbo.Turmas t 
	on t.id_turma = at.id_turma
	inner join dbo.Cursos c
	on c.id_curso = t.id_curso
group by t.id_turma, c.nome_curso



--MIN (MININO VALOR)
select t.id_turma
	  ,c.nome_curso
	  ,MIN(at.valor) as "VALOR MININO"
from AlunosxTurmas at
	inner join dbo.Turmas t 
	on t.id_turma = at.id_turma
	inner join dbo.Cursos c
	on c.id_curso = t.id_curso
group by t.id_turma, c.nome_curso



--MIN E MAX JUNTOS
select t.id_turma
	  ,c.nome_curso
	  ,MIN(at.valor) as "VALOR MININO"
	  ,MAX(at.valor) as "VALOR MAXIMO"
from AlunosxTurmas at
	inner join dbo.Turmas t 
	on t.id_turma = at.id_turma
	inner join dbo.Cursos c
	on c.id_curso = t.id_curso
group by t.id_turma, c.nome_curso



--MIN, MAX COM A DIFERENÇA ENTRE ELES NO FINAL
select t.id_turma
	  ,c.nome_curso
	  ,MIN(at.valor) as "VALOR MININO"
	  ,MAX(at.valor) as "VALOR MAXIMO"
	  ,MAX(at.valor) - MIN(at.valor) as "DIFERENÇA"
from AlunosxTurmas at
	inner join dbo.Turmas t 
	on t.id_turma = at.id_turma
	inner join dbo.Cursos c
	on c.id_curso = t.id_curso
group by t.id_turma, c.nome_curso

