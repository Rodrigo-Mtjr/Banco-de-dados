--SELECTs DIVERSOS COM FUNÇÃO DE AGREGAÇÃO

--TOTAL DE TURMAS POR CURSO

SELECT c.id_curso, c.nome_curso, count(t.id_turma) as "TOTAL DE TURMA"
FROM dbo.Turmas t
	INNER JOIN dbo.Cursos c on c.id_curso = t.id_curso	
GROUP BY c.id_curso, c.nome_curso;

-- TIRAR A PROVA DA QUANTIDADE DE TURMAS POR CURSO

SELECT* 
FROM DBO.Turmas
WHERE id_curso = 1; -- CURSO DE VBA I

SELECT* 
FROM DBO.Turmas
WHERE id_curso = 4; -- EXCEL BASICO

--UTILIZANDO A CLAUSULA 'IN'

SELECT*
FROM DBO.Turmas
WHERE id_Curso in (1,9); --TRAZER O RESULTADO AONDE TODOS OS CURSOS TENHAM O ID 1 E 9

--UTILIZANDO A CLAUSULA 'NOT IN'

SELECT *
FROM DBO.Turmas
WHERE id_curso not in (1,4)--TRAZER O RESULTADO DE TODOS OS CURSOS, MENOS OS QUE TENHAM ID 1 E 4

--ANO DE NASCIMENTO DOS ALUNOS
--DISTINCT
select DISTINCT DATEPART(YEAR, data_nascimento) as "DATA DE NASCIMENTO DOS ALUNOS"
from dbo.Alunos
order by [DATA DE NASCIMENTO DOS ALUNOS] -- CRESCENTE

select DISTINCT DATEPART(YEAR, data_nascimento) as "DATA DE NASCIMENTO DOS ALUNOS"
from dbo.Alunos
order by [DATA DE NASCIMENTO DOS ALUNOS] desc -- DECRESCENTE

--LISTA COMPLETA DE ALUNOS

SELECT A.nome
	  ,A.sexo
	  ,C.id_curso
	  ,C.nome_curso
	  ,at.valor
	  ,at.valor_desconto
	  ,T.data_inicio
	  ,T.data_termino  
FROM DBO.AlunosxTurmas at
	INNER JOIN DBO.Turmas t 
		on t.id_turma = at.id_turma
	INNER JOIN DBO.Cursos c
		on c.id_curso = t.id_curso
	INNER JOIN DBO.Alunos a 
	on a.id_aluno = at.id_aluno

select * from Alunos

select * from AlunosxTurmas