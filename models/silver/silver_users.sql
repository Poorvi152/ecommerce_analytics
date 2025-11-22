
{{config(materialized='table', schema='silver_ecommerce') }}

SELECT
    CAST(USER_ID AS INT) AS user_id,
    CAST(FIRST_NAME AS STRING) AS first_name,
    CAST(LAST_NAME AS STRING) AS last_name,
    CAST(EMAIL AS STRING) AS email,
    CAST(CITY AS STRING) AS city,
    CAST(COUNTRY AS STRING) AS country
FROM {{ source('external_stage_ecommerce', 'users') }}
