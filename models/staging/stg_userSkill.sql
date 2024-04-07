WITH
userSkill_src AS (
    SELECT * FROM {{ source('DB_SMS', 'TBL_USER_SKILL') }}
),
userSkill AS (
    SELECT 
        CAST(ID AS INTEGER) AS ID,
        CAST(SKILL_ID AS INTEGER) AS SKILL_ID,
        CAST(USER_ID AS INTEGER) AS USER_ID,
        CAST(SKILL_LEVEL AS VARCHAR) AS SKILL_LEVEL
    FROM 
        userSkill_src
)

SELECT * FROM userSkill
