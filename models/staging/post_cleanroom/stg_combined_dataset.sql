with stg_combined_data as (

    select *

    from {{ source('post_dcr', 'customer_details')}}
) 

select * from stg_combined_data