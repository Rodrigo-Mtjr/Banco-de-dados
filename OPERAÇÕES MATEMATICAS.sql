-- OPERAÇÕES MATEMATICAS 

--SOMA
select 1 + 2 AS Resultado;
select 458.99 + 899 + 7.77 AS Resultado;

--SUBTRAÇÃO 
select 233 - (78.99 + 333) AS Resultado;

--DIVISÃO
select 50 / 2 as Resultado;
select 49 / 2 as Resultado;
select 49.0 / 2 as Resultado;
select 49.99 / 2 as Resultado;

--MULTIPLICAÇÃO
select 50 * 2 as Resultado;
select 50.88 * 3 as Resultado;

--ATENÇÃO - ISSO SÓ VALE PARA O ORACLE
--select 50*2 from dual;	

--CALCULAR PONTENCIA = 2 AO QUADRADO
select square(7) as Resultado -- QUADRADO DE UM NUMERO (NUMERO X ELE MESMO)
select power (3,3) as Resultado -- 3 x 3 x 3
select power (2,8) as Resultado 

--PORCENTAGEM 
select 100 * 1.1 as Resultado
select 100 + (100 * 0.1) as Resultado

select 100 * 0.9 as Resultado --1 / 100
select 100 * 0.1 as Resultado --1 / 1-0
select 100 * 0.01 as Resultado --1 / 100

--ABS 
select abs(100-999) as Resultado
select abs(-100) as Resultado

--RAIZ QUADRADA
select sqrt(49) as Resultado
select sqrt(7) as Resultado

--PI
select pi() as Resultado

--DATA ATUAL
select GETDATE() as Resultado

--SIGN
select sign(10) as Resultado
select sign(-10) as Resultado
select sign(null) as Resultado
select sign(0) as Resultado