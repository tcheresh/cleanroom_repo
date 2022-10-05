with subscriptions as (

    select
        cust_id as customer_id,
        p_subscriber_tier as subscription_tier,
        p_subscription_date as subscription_date

    from {{ source('provider_raw_data', 'provider_customers')}}
) 

select * from subscriptions