WITH

approverUser_src AS (

    SELECT * FROM {{ source('DB_SMS', 'TBL_APPROVER_USER') }}
    

),
approverUser AS(
    SELECT

        CAST(ID AS INTEGER) AS ID,
        CAST(APPROVER_ID AS INTEGER) AS APPROVER_ID,
        CAST(USER_ID AS INTEGER) AS USER_ID
        
    FROM 
        approverUser_src
)


select * from approverUser