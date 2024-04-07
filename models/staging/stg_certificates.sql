WITH

certificates_src AS (

    SELECT * FROM {{ source('DB_SMS', 'TBL_CERTIFICATES') }}
    

),

certificates AS(
    SELECT 
        CAST(CERTIFICATE_ID AS INTEGER) AS CERTIFICATE_ID,
        CAST(CERTIFICATE_NAME AS VARCHAR) AS CERTIFICATE_NAME,
    FROM 
        certificates_src
)


select * from certificates