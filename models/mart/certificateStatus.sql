{{ config(materialized='table') }}

WITH
stg_userCertificate AS (
    SELECT
        *
    FROM {{ ref('stg_userCertificate') }}
),
status_counts AS (
    SELECT
        STATUS AS Certificate_Status,
        COUNT(ID) AS COUNT
    FROM
        stg_userCertificate
    GROUP BY
        STATUS
)

SELECT * FROM status_counts
