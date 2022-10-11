{{ config(materialized = 'table', schema = 'prod') }}

with stg_combined_data as (

    select *

    from {{ ref('stg_combined_dataset')}}
) 

select * from stg_combined_data
