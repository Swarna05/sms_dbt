{{ config(materialized='table') }}
with
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

assigned_user AS(
    SELECT
     u.USER_ID ,
     u.FULL_NAME,
     u.EMAIL
    FROM stg_approverUser AS a
    INNER JOIN stg_user AS u
    ON a.USER_ID = u.USER_ID
)


select * from assigned_User


