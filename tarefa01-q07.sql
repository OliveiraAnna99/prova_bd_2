select d.descricao as nome_departamento, f.nome as nome_gerente,  from funcionario as f
inner join departamento as d
where d.codGerente = f.codigo, count(select * from funcionario as fun
                                         inner join departamento as dep
        where fun.codDepto = dep.codigo ) as qtdFunc;