with ad_data_aggr as (

    select *

    from {{ source('ad_servers', 'ad_server_data')}}
)

select * from ad_data_aggr