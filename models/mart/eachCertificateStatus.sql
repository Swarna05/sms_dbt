{{ config(materialized='table') }}

WITH
stg_userCertificate AS (
    SELECT
        *
    FROM {{ ref('stg_userCertificate') }}
),
stg_certificates AS (
    SELECT
        *
    FROM {{ ref('stg_certificates') }}
),
joined_data AS (
    SELECT
        uc.*,
        c.CERTIFICATE_NAME
       
    FROM
        stg_userCertificate AS uc
    LEFT JOIN
        stg_certificates AS c
    ON
        uc.CERTIFICATE_ID = c.CERTIFICATE_ID
),

status_counts AS (
    SELECT
    
        CERTIFICATE_NAME,
        COUNT(CASE WHEN STATUS = 'Approved' THEN 1 END) AS Approved_Count,
        COUNT(CASE WHEN STATUS = 'Rejected' THEN 1 END) AS Rejected_Count,
        COUNT(CASE WHEN STATUS = 'Pending' THEN 1 END) AS Pending_Count
       
    FROM
        joined_data
    WHERE
        STATUS IN ('Approved', 'Rejected', 'Pending')
    GROUP BY
        CERTIFICATE_NAME
    ORDER BY
        Approved_Count DESC
)

SELECT * FROM status_counts
