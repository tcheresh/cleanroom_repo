with subscriptions as (

    select
        cust_id as customer_id,
        p_subscriber_tier as subscription_tier,
        p_subscription_date as subscription_date

    from provider_data_raw.customer_data_raw.provider_customers
) 

select * from subscriptions