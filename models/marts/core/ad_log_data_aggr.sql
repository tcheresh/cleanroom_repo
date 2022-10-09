{{ config(materialized = 'table', schema = 'prod') }}

with ad_data_aggr as (

    select 

        customer_id as customer_id,
        count(customer_id) as impressions_seen

    from {{ source('ad_servers', 'ad_server_data')}}
    group by customer_id
)

select * from ad_data_aggr