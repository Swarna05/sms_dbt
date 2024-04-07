WITH

skills_src AS (

    SELECT * FROM {{ source('DB_SMS', 'TBL_SKILLS') }}
    

),

skills AS(
    SELECT 
        CAST(SKILL_ID AS INTEGER) AS SKILL_ID,
        CAST(SKILL_NAME AS VARCHAR) AS SKILL_NAME,
    FROM 
        skills_src
)

select * from skills