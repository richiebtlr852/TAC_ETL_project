{{ config(
    materialized='table'
) }}

WITH base_data AS (
    SELECT
        VEHICLE_TYPE,
        CASE
            -- Remove leading zeros for normalization
            WHEN VEHICLE_TYPE LIKE '0%' THEN CAST(SUBSTRING(VEHICLE_TYPE, 2) AS INTEGER)
            ELSE CAST(VEHICLE_TYPE AS INTEGER)
        END AS NORMALIZED_VEHICLE_TYPE,
        VEHICLE_TYPE_DESC,
        CASE
            -- Simplify vehicle type descriptions
            WHEN VEHICLE_TYPE_DESC = 'Light Commercial Vehicle (Rigid) <= 4.5 Tonnes GVM' THEN 'Light Commercial Vehicle'
            ELSE VEHICLE_TYPE_DESC
        END AS SIMPLIFIED_VEHICLE_TYPE_DESC
    FROM
        {{ ref('staging_vehicle') }}
),

unique_vehicle_types AS (
    SELECT
        NORMALIZED_VEHICLE_TYPE AS VEHICLE_TYPE_ID,
        SIMPLIFIED_VEHICLE_TYPE_DESC AS VEHICLE_TYPE_NAME
    FROM
        base_data
    GROUP BY
        NORMALIZED_VEHICLE_TYPE, SIMPLIFIED_VEHICLE_TYPE_DESC
)

SELECT
    VEHICLE_TYPE_ID,
    VEHICLE_TYPE_NAME
FROM
    unique_vehicle_types
ORDER BY
    VEHICLE_TYPE_ID;
