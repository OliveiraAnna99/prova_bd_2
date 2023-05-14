CREATE OR REPLACE FUNCTION calcularAtraso(codAtividade INT)
RETURNS INT AS $$
DECLARE
  atraso INT;
BEGIN
  SELECT DATEDIFF('day', dataFim, CURRENT_DATE) INTO atraso
  FROM atividade
  WHERE codigo = codAtividade;

  RETURN atraso;
END;
$$ LANGUAGE plpgsql;
SELECT calcularAtraso(1);
