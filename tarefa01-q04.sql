select nome, salario, sigla from funcionario as f
inner join departamento as d
where d.codGerente <> f.codigo
order by d.codigo;