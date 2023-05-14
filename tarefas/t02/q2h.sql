CREATE OR REPLACE FUNCTION calcular_porcentagem_atividades(codEquipe INT, codMembro INT)
RETURNS DECIMAL(5,2)
AS $$
DECLARE
  total_atividades INT;
  atividades_concluidas INT;
  porcentagem DECIMAL(5,2);
BEGIN
  SELECT COUNT(*) INTO total_atividades
  FROM atividade_membro am
  INNER JOIN atividade_projeto ap ON am.codAtividade = ap.codAtividade
  INNER JOIN projeto p ON ap.codProjeto = p.codigo
  WHERE am.codEquipe = codEquipe AND am.codMembro = codMembro;

  SELECT COUNT(*) INTO atividades_concluidas
  FROM atividade_membro am
  INNER JOIN atividade_projeto ap ON am.codAtividade = ap.codAtividade
  INNER JOIN projeto p ON ap.codProjeto = p.codigo
  WHERE am.codEquipe = codEquipe AND am.codMembro = codMembro
  AND situacao = 'Concluído';

  IF total_atividades > 0 THEN
    porcentagem := (atividades_concluidas * 100.0) / total_atividades;
  ELSE
    porcentagem := 0.0;
  END IF;

  RETURN porcentagem;
END;
$$ LANGUAGE plpgsql;
SELECT calcular_porcentagem_atividades(1, 1);
