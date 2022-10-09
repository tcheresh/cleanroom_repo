with subscriptions as (

    select
        cust_id as customer_id,
        p_subscriber_tier as subscription_tier,
        p_subscription_date as subscription_date

    from {{ source('consumer_raw_data', 'customers_raw')}}
) 

select * from subscriptions