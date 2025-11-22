
{{ config(
    materialized='incremental',
    unique_key='ORDER_ITEM_ID'
) }}

SELECT
    MD5(ORDER_ITEM_ID || ORDER_ID || PRODUCT_ID) AS ORDER_ITEM_KEY,
    ORDER_ITEM_ID,
    ORDER_ID,
    PRODUCT_ID,
    QUANTITY,
    LINE_AMOUNT,
    PRICE_WITH_TAX
FROM {{ ref('silver_order_items') }}
{% if is_incremental() %}
WHERE ORDER_ITEM_ID > (SELECT MAX(ORDER_ITEM_ID) FROM {{ this }})
{% endif %}

