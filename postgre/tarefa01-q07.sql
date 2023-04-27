CREATE VIEW vw_tot_func_dep AS
SELECT d.codigo, d.descricao, COUNT(f.codigo) AS total_funcionarios
FROM departamento AS d
LEFT JOIN funcionario AS f ON f.cod_depto = d.codigo
GROUP BY d.codigo, d.descricao;
