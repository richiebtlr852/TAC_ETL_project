/*
loads data from the landing.vehicle table into staging.staging_vehicle with transformations
*/


WITH vehicle_data AS (
    SELECT
        ACCIDENT_NO,
        VEHICLE_ID,
        VEHICLE_YEAR_MANUF,
        INITIAL_DIRECTION,
        ROAD_SURFACE_TYPE,
        REPLACE(ROAD_SURFACE_TYPE_DESC, 'Unnecessary Detail', '') AS ROAD_SURFACE_TYPE_DESC,
        VEHICLE_BODY_STYLE,
        VEHICLE_MAKE,
        VEHICLE_MODEL,
        TRIM(LEADING '0' FROM VEHICLE_TYPE) AS VEHICLE_TYPE,
        REPLACE(VEHICLE_TYPE_DESC, ' (Rigid) <= 4.5 Tonnes GVM', '') AS VEHICLE_TYPE_DESC,
        TARE_WEIGHT,
        TOTAL_NO_OCCUPANTS,
        LEVEL_OF_DAMAGE,
        OWNER_POSTCODE
    FROM {{ ref('landing_vehicle') }}
)

SELECT * FROM vehicle_data;
