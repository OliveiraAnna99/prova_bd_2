select p.nome as nome_projeto, p.dataInicio, p.dataFim, a.descricao, a.dataInicio, a.dataFim from projeto as p
inner join atividade as a 
where DATE(a.dataInicio) < DATE(p.dataInicio) 
OR DATE(a.dataFim) > DATE(p.dataFim) ;