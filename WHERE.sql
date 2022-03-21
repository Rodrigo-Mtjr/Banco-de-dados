select * from alunos;

select id_aluno as "COD ALUNO"
	  ,nome as "NOME DO ALUNO"
	  ,data_nascimento as "DATA DE NASCIMENTO"
	  ,SEXO, data_cadastro as "DATA DE CADASTRO"
	  ,login_cadastro as "LOGIN DE CADASTRO"
From alunos where nome = 'alan mazoni alves';

select * 
from DBO.Alunos 
where nome = 'alan mazoni alves';

select *
from Alunos;

select * 
from alunos 
where sexo = 'M'
and data_nascimento >= '01/01/1997'

select * 
from AlunosxTurmas

insert into AlunosxTurmas
	(id_turma, id_aluno, valor, valor_desconto, data_cadastro, login_cadastro)
values
	(6,2,550,0.36,GETDATE(),'ALESS')

select id_aluno AS "COD DO ALUNO"
	  ,id_turma AS "COD DA TURMA"
	  ,floor (valor * valor_desconto) as DESCONTO
from AlunosxTurmas 
where valor_desconto > 0
    and id_aluno = 6;


select c.nome_curso as "NOME DO CURSO"
	  ,t.data_inicio AS "INICIO DO CURSO"
	  ,t.data_termino AS "TERMINO DO CURSO"
	  ,floor (at.valor) VALOR_BRUTO
	  ,floor ((at.valor * at.valor_desconto)) as DESCONTO
	  ,floor (at.valor) - floor ((at.valor * at.valor_desconto)) as "VALOR LIQUIDO"
from AlunosxTurmas at, Turmas t, Cursos c
where at.id_turma = t.id_turma
	and t.id_curso = c.id_curso
		
	 
 
 select * from AlunosxTurmas

 select * from Turmas

 select * from Cursos