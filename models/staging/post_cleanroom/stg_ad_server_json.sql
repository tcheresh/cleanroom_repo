with stg_ad_server_data_json as (

{% set json_column_query %}
select distinct 
json.key as column_name

from {{ source('ad_servers_json', 'ad_server_data_json')}},
lateral flatten(input=>json_data) json
{% endset %}

{% set results = run_query(json_column_query) %}

{% if execute %}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

select
json_data,

{% for column_name in results_list %}
json_data:{{column_name}} as {{column_name}}{% if not loop.last %},{% endif %} 
{% endfor %}

from {{ source('ad_servers_json', 'ad_server_data_json')}}

) 

select 
        impression_viewed as impressions_viewed,
        customer_id,
        transcation_id as transaction_id

from stg_ad_server_data_json