{{ config(materialized = 'table', schema = 'prod') }}


with ad_data_aggr as (

    select 

        customer_id as customer_id,
        count(customer_id) as impressions_seen

    from {{ ref('stg_ad_server_json') }}
    group by customer_id
)

select * from ad_data_aggr