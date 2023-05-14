CREATE OR REPLACE FUNCTION calcular_atraso_projeto(projeto_id INT) RETURNS INT AS $$
DECLARE
  data_fim_projeto DATE;
  data_conclusao_projeto DATE;
  atraso_dias INT;
BEGIN
  SELECT dataFim, dataConclusao INTO data_fim_projeto, data_conclusao_projeto
  FROM projeto
  WHERE codigo = projeto_id;
  
  IF data_conclusao_projeto IS NULL OR data_fim_projeto IS NULL THEN
    RETURN 0; -- Não há atraso se não houver data de conclusão ou data de término do projeto
  ELSE
    atraso_dias := data_conclusao_projeto - data_fim_projeto;
    RETURN atraso_dias;
  END IF;
END;
$$ LANGUAGE plpgsql;
SELECT calcular_atraso_projeto(1); -- Passando o ID do projeto como parâmetro
