
{{ config(materialized='table', schema='silver_ecommerce') }}

SELECT
    CAST(ORDER_ID AS INT) AS order_id,
    CAST(USER_ID AS INT) AS user_id,
    CAST(ORDER_DATE AS DATE) AS order_date,
    CAST(TOTAL_AMOUNT AS DECIMAL(10,2)) AS total_amount
FROM {{ source('external_stage_ecommerce', 'orders') }}
