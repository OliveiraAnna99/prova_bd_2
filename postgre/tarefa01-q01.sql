SELECT nome 
FROM funcionario 
WHERE salario > (SELECT salario FROM funcionario WHERE cod_depto = 2);