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
        s.SKILL_NAME
       
    FROM
        stg_userSkill AS us
    LEFT JOIN
        stg_skills AS s
    ON
        us.SKILL_ID = s.SKILL_ID
),

status_counts AS (
    SELECT
    
        SKILL_NAME,
        COUNT(CASE WHEN STATUS = 'Approved' THEN 1 END) AS Approved_Count,
        COUNT(CASE WHEN STATUS = 'Rejected' THEN 1 END) AS Rejected_Count,
        COUNT(CASE WHEN STATUS = 'Pending' THEN 1 END) AS Pending_Count
       
    FROM
        joined_data
    WHERE
        STATUS IN ('Approved', 'Rejected', 'Pending')
    GROUP BY
        SKILL_NAME
    ORDER BY
        Approved_Count DESC
)

SELECT * FROM status_counts
