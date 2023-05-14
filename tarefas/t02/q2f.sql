CREATE OR REPLACE FUNCTION exibir_equipe_projeto(projeto_id INT)
  RETURNS TABLE (nome_funcionario VARCHAR(15), sigla_departamento VARCHAR(15))
  AS $$
BEGIN
  RETURN QUERY
    SELECT f.nome, d.sigla
    FROM membro m
    JOIN funcionario f ON m.codFuncionario = f.codigo
    JOIN equipe e ON m.codEquipe = e.codigo
    JOIN projeto p ON e.codigo = p.equipe
    JOIN departamento d ON f.depto = d.codigo
    WHERE p.codigo = projeto_id;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM exibir_equipe_projeto(projeto_id);
