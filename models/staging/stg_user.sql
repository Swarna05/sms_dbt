WITH
user_src AS (
    SELECT * FROM {{ source('DB_SMS', 'TBL_USER') }}
),
user_casting AS (
   SELECT 
        CAST(USER_ID AS INTEGER) AS USER_ID,
        CAST(FIRST_NAME AS VARCHAR) AS FIRST_NAME,
        CAST(LAST_NAME AS VARCHAR) AS LAST_NAME,
        CAST(EMAIL AS VARCHAR) AS EMAIL,
        CAST(PASSWORD AS VARCHAR) AS PASSWORD,
        CAST(PHONE_NUMBER AS BIGINT) AS PHONE_NUMBER,
        CAST(ROLE AS VARCHAR) AS ROLE,
        CAST(CHANGE_PASSWORD AS BOOLEAN) AS CHANGE_PASSWORD
    FROM 
        user_src
),
user AS (
    SELECT 
        USER_ID,
        CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME,
        EMAIL,
        PASSWORD,
        PHONE_NUMBER,
        ROLE,
        CHANGE_PASSWORD
        
    FROM 
        user_casting
)

SELECT * FROM user
