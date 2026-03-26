WITH base_tratada AS (

    SELECT 
        cliente_id,
        
        -- Limpeza
        REGEXP_REPLACE(telefone, '[^0-9]', '') AS telefone_limpo,
        LOWER(email) AS email_normalizado,

        -- Status Email
        CASE 
            WHEN email IS NULL THEN 'EMAIL_AUSENTE'
            WHEN email NOT LIKE '%@%' THEN 'FORMATO_INVALIDO'
            WHEN LOWER(email) LIKE '%naotem%' THEN 'PLACEHOLDER'
            WHEN LOWER(email) LIKE '%teste%' THEN 'TESTE'
            WHEN LOWER(email) LIKE '%fake%' THEN 'INVALIDO'
            ELSE 'VALIDO'
        END AS status_email,

        -- Status Telefone
        CASE 
            WHEN telefone IS NULL THEN 'TELEFONE_AUSENTE'
            
            WHEN NOT (
                REGEXP_LIKE(REGEXP_REPLACE(telefone, '[^0-9]', ''), '^[0-9]{10,11}$')
                AND SUBSTRING(REGEXP_REPLACE(telefone, '[^0-9]', ''), 1, 1) <> '0'
                AND SUBSTRING(REGEXP_REPLACE(telefone, '[^0-9]', ''), 2, 1) <> '0'
                AND SUBSTRING(REGEXP_REPLACE(telefone, '[^0-9]', ''), 3, 1) <> '0'
            )
            THEN 'INVALIDO'
            
            ELSE 'VALIDO'
        END AS status_telefone

    FROM contatos
)

SELECT
    COUNT(*) AS total_registros,

    -- EMAIL
    SUM(CASE WHEN status_email <> 'VALIDO' THEN 1 ELSE 0 END) AS emails_invalidos,
    ROUND(100.0 * SUM(CASE WHEN status_email <> 'VALIDO' THEN 1 ELSE 0 END) / COUNT(*), 2) AS perc_email_invalido,

    -- TELEFONE
    SUM(CASE WHEN status_telefone <> 'VALIDO' THEN 1 ELSE 0 END) AS telefones_invalidos,
    ROUND(100.0 * SUM(CASE WHEN status_telefone <> 'VALIDO' THEN 1 ELSE 0 END) / COUNT(*), 2) AS perc_tel_invalido,

    -- CONTATOS TOTALMENTE VÁLIDOS
    SUM(CASE 
        WHEN status_email = 'VALIDO' 
         AND status_telefone = 'VALIDO' 
        THEN 1 ELSE 0 END) AS contatos_validos,

    ROUND(100.0 * SUM(CASE 
        WHEN status_email = 'VALIDO' 
         AND status_telefone = 'VALIDO' 
        THEN 1 ELSE 0 END) / COUNT(*), 2) AS perc_contatos_validos,

    -- SEM NENHUM CONTATO VÁLIDO 
    SUM(CASE 
        WHEN status_email <> 'VALIDO' 
         AND status_telefone <> 'VALIDO' 
        THEN 1 ELSE 0 END) AS sem_contato_valido,

    ROUND(100.0 * SUM(CASE 
        WHEN status_email <> 'VALIDO' 
         AND status_telefone <> 'VALIDO' 
        THEN 1 ELSE 0 END) / COUNT(*), 2) AS perc_sem_contato

FROM base_tratada;