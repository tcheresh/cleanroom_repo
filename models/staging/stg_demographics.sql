with demographics as (

    select
        cust_id as customer_id,
        p_first_name as first_name,
        p_last_name as last_name,
        p_birthdate as birthdate,
        p_gender as gender,
        p_zip_code as zip_code

    from {{ source('consumer_raw_data', 'customers_raw')}}

)

select * from demographics