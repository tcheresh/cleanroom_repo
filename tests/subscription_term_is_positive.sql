with customer_lifetime as (
    select * from {{ ref('stg_customer_lifetime')}}
)

select 
    total_months
from customer_lifetime
having total_months < 0