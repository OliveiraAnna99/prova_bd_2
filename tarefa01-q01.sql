select nome from funcionario as f
where f.salario > ALL(select salario from funcionario as func
inner join departamento as d
 where f.codDepto = 2);

 