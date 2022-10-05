with customers as (

    select
        cust_id as customer_id,
        p_first_name as first_name,
        p_last_name as last_name,
        p_email_address as email

    from provider_data_raw.customer_data_raw.provider_customers

)

select * from customers