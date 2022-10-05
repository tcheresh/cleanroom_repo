with customers as (
    select * from {{ ref('stg_customers') }}
), 

customer_lifetime as (
    select * from {{ ref('stg_customer_lifetime') }}
),

demographics as (
    select * from {{ ref('stg_demographics') }}
),

subscriptions as (
    select * from {{ ref('stg_subscriptions') }}
),

final as (

    select
        c.customer_id,
        c.first_name,
        c.last_name,
        c.email,
        d.birthdate,
        d.gender,
        d.zip_code,
        s.subscription_tier,
        s.subscription_date,
        cl.Total_Months

    from 
        customers c
    inner join 
        demographics d on d.customer_id = c.customer_id
    inner join 
        subscriptions s on s.customer_id = c.customer_id
    inner join 
        customer_lifetime cl on cl.customer_id = c.customer_id
)

select * from final