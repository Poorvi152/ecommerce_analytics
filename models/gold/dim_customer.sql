
{{ config(materialized='table', schema='gold_ecommerce') }}

SELECT
    MD5(EMAIL) AS customer_key,
    USER_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    CITY,
    COUNTRY
FROM {{ ref('silver_users') }}

