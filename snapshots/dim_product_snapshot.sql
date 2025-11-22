
{% snapshot dim_product_snapshot %}
{{ config(
    target_schema='gold_ecommerce',
    unique_key='PRODUCT_ID',
    strategy='timestamp',
    updated_at='UPDATED_AT'
) }}

SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    CATEGORY,
    PRICE,
    CURRENT_TIMESTAMP() AS UPDATED_AT
FROM {{ ref('silver_products') }}
{% endsnapshot %}
