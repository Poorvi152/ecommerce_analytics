
{{ config(materialized='table', schema='silver_ecommerce') }}

SELECT
    CAST(ORDER_ITEM_ID AS INT) AS order_item_id,
    CAST(ORDER_ID AS INT) AS order_id,
    CAST(PRODUCT_ID AS INT) AS product_id,
    CAST(QUANTITY AS INT) AS quantity,
    CAST(LINE_AMOUNT AS DECIMAL(10,2)) AS line_amount,
    (CAST(LINE_AMOUNT AS DECIMAL(10,2)) * 1.10) AS price_with_tax  -- Derived column
FROM {{ source('external_stage_ecommerce', 'order_items') }}

