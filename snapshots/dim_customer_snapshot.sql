
{% snapshot dim_customer_snapshot %}
{{ config(
    target_schema='gold_ecommerce',
    unique_key='EMAIL',
    strategy='timestamp',
    updated_at='UPDATED_AT'
) }}

SELECT
    USER_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    CITY,
    COUNTRY,
    CURRENT_TIMESTAMP() AS UPDATED_AT
FROM {{ ref('silver_users') }}
{% endsnapshot %}
