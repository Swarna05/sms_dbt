{{ config(materialized='table') }}
WITH
stg_approverUser AS (
    SELECT
        *
    FROM {{ ref('stg_approverUser') }}
),
stg_user AS (
    SELECT
        *
    FROM {{ ref('stg_user') }}
),

approver_user_count AS (
    SELECT
        APPROVER_ID,
        COUNT(USER_ID) AS User_Count
    FROM
        stg_approverUser
    GROUP BY
        APPROVER_ID

),
approver_user AS (
    SELECT
     a.APPROVER_ID,u.FULL_NAME,u.EMAIL,a.User_Count
    FROM
        approver_user_count AS a
    INNER JOIN
        stg_user AS u
    ON
        a.APPROVER_ID = u.USER_ID
    ORDER BY
        User_Count
        DESC
)


SELECT * FROM approver_user
