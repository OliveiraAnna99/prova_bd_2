select f.nome from projeto as p
inner join funcionario as f
inner join departamento as d
where f.codigo = p.codResponsavel
AND f.codigo = d.codGerente
OR f.salario > ALL(select salario from funcionario as func
                   inner join departamento as dep
                  where func.codigo = dep.codGerente
)
group by f.codigo;