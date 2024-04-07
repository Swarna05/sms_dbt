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
        us.*,
        s.CERTIFICATE_NAME
    FROM
        stg_userCertificate AS us
    LEFT JOIN
        stg_certificates AS s
    ON
        us.CERTIFICATE_ID = s.CERTIFICATE_ID
),
certificate_user_counts AS (
    SELECT
        CERTIFICATE_NAME,
        COUNT(user_id) AS user_count
    FROM
        joined_data
    GROUP BY
        CERTIFICATE_NAME
    ORDER BY 
        user_count
    DESC
)

SELECT * FROM certificate_user_counts
