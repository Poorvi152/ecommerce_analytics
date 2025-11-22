
{{ config(materialized='table', schema='silver_ecommerce') }}

SELECT
    CAST(PRODUCT_ID AS INT) AS product_id,
    CAST(PRODUCT_NAME AS STRING) AS product_name,
    CAST(CATEGORY AS STRING) AS category,
    CAST(PRICE AS DECIMAL(10,2)) AS price
FROM {{ source('external_stage_ecommerce', 'products') }}


