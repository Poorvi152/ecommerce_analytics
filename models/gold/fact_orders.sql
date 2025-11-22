
{{ config(
    materialized='incremental',
    unique_key='ORDER_ID'
) }}

SELECT
    MD5(ORDER_ID || USER_ID) AS ORDER_KEY,
    ORDER_ID,
    USER_ID,
    ORDER_DATE,
    YEAR(ORDER_DATE) AS ORDER_YEAR,
    MONTH(ORDER_DATE) AS ORDER_MONTH,
    TOTAL_AMOUNT
FROM {{ ref('silver_orders') }}
{% if is_incremental() %}
WHERE ORDER_DATE > (SELECT MAX(ORDER_DATE) FROM {{ this }})
{% endif %}
