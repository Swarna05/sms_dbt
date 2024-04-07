{{ config(materialized='table') }}

WITH
stg_userSkill AS (
    SELECT
        *
    FROM {{ ref('stg_userSkill') }}
),
stg_skills AS (
    SELECT
        *
    FROM {{ ref('stg_skills') }}
),
joined_data AS (
    SELECT
        us.*,
        s.skill_name
    FROM
        stg_userSkill AS us
    LEFT JOIN
        stg_skills AS s
    ON
        us.skill_id = s.skill_id
),
skill_user_counts AS (
    SELECT
        skill_name,
        COUNT(user_id) AS user_count
    FROM
        joined_data
    GROUP BY
        skill_name
    ORDER BY 
        user_count
    DESC
)

SELECT * FROM skill_user_counts
