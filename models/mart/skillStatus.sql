{{ config(materialized='table') }}

WITH
stg_userSkill AS (
    SELECT
        *
    FROM {{ ref('stg_userSkill') }}
),
status_counts AS (
    SELECT
        STATUS AS Skill_Status,
        COUNT(ID) AS COUNT
    FROM
        stg_userSkill
    GROUP BY
        STATUS
)

SELECT * FROM status_counts
