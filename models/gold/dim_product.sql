
{{ config(materialized='table', schema='gold_ecommerce') }}

SELECT
    MD5(PRODUCT_ID || PRODUCT_NAME) AS product_key,
    PRODUCT_ID,
    PRODUCT_NAME,
    CATEGORY,
    PRICE
FROM {{ ref('silver_products') }}

