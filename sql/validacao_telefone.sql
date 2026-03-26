SELECT *,
       CASE 
           WHEN telefone IS NULL THEN 'TELEFONE AUSENTE'
           
           WHEN NOT (
               REGEXP_LIKE(REGEXP_REPLACE(telefone, '[^0-9]', ''), '^[0-9]{10,11}$')
               AND SUBSTRING(REGEXP_REPLACE(telefone, '[^0-9]', ''), 1, 1) <> '0'
               AND SUBSTRING(REGEXP_REPLACE(telefone, '[^0-9]', ''), 2, 1) <> '0'
               AND SUBSTRING(REGEXP_REPLACE(telefone, '[^0-9]', ''), 3, 1) <> '0'
           )
           THEN 'TELEFONE INVALIDO'
           
           ELSE 'TELEFONE VALIDO'
       END AS status_telefone
FROM contatos;