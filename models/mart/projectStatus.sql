{{ config(materialized='table') }}

WITH
stg_userProject AS (
    SELECT
        *
    FROM {{ ref('stg_userProject') }}
),
status_counts AS (
    SELECT
        STATUS AS Project_Status,
        COUNT(ID) AS COUNT
    FROM
        stg_userProject
    GROUP BY
        STATUS
)

SELECT * FROM status_counts
