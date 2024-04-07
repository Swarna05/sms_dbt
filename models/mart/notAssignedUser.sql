{{ config(materialized='table') }}
with
    stg_approveruser as (select * from {{ ref('stg_approverUser') }}),
    stg_user as (select * from {{ ref('stg_user') }}),

    notassigned_user as (
        select u.user_id, u.full_name, u.email
        from stg_user as u
        left join stg_approveruser as a on u.user_id = a.user_id
        where a.user_id is null
    )

select *
from notassigned_user
