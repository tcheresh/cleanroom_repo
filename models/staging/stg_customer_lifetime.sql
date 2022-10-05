with customer_lifetime as (

    select 

        cust_id as customer_id,
        p_first_name as first_name,
        p_last_name as last_name,
        datediff(month,p_subscription_date,current_date()) as Total_Months 

    from provider_data_raw.customer_data_raw.provider_customers

)

select * from customer_lifetime