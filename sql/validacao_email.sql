SELECT *,
       CASE 
           WHEN email IS NULL THEN 'EMAIL AUSENTE'
           
           WHEN email NOT LIKE '%@%' THEN 'FORMATO INVALIDO'
           
           WHEN LOWER(email) LIKE '%naotem%' THEN 'EMAIL PLACEHOLDER'
           WHEN LOWER(email) LIKE '%teste%' THEN 'EMAIL TESTE'
           WHEN LOWER(email) LIKE '%fake%' THEN 'EMAIL INVALIDO'
           
           ELSE 'EMAIL VALIDO'
       END AS status_email
FROM contatos;