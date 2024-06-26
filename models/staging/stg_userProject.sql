WITH
userProject_src AS (
    SELECT * FROM {{ source('DB_SMS', 'TBL_USER_PROJECT') }}
),
userProject AS (
    SELECT 
        CAST(ID AS INTEGER) AS ID,
        CAST(USER_ID AS INTEGER) AS USER_ID,
        CAST(PROJECT_NAME AS VARCHAR) AS PROJECT_NAME,
        CAST(PROJECT_DESCRIPTION AS TEXT) AS PROJECT_DESCRIPTION,
        CAST(STATUS AS VARCHAR) AS STATUS,
        CAST(PROJECT_LINK AS VARCHAR) AS PROJECT_LINK
    FROM 
        userProject_src
)

SELECT * FROM userProject
