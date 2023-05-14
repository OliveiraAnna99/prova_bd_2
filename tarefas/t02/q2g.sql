CREATE OR REPLACE FUNCTION calcularAtividadesMembro(codMembro INT)
RETURNS INT AS $$
DECLARE
   totalAtividades INT;
BEGIN
   SELECT COUNT(*)
   INTO totalAtividades
   FROM atividade_membro
   WHERE codMembro = codMembro;
   
   RETURN totalAtividades;
END;
$$ LANGUAGE plpgsql;
SELECT calcularAtividadesMembro(1);
