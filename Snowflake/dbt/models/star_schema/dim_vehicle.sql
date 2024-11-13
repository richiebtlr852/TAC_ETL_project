/*
creates the star_schema.vehicle_dim dimension table.
*/

-- models/star_schema/vehicle_dim.sql

WITH vehicle_data AS (
    SELECT
        VEHICLE_ID,
        ACCIDENT_NO,
        VEHICLE_YEAR_MANUF,
        INITIAL_DIRECTION,
        ROAD_SURFACE_TYPE,
        VEHICLE_BODY_STYLE,
        VEHICLE_MAKE,
        VEHICLE_MODEL,
        VEHICLE_TYPE,
        TARE_WEIGHT,
        TOTAL_NO_OCCUPANTS,
        LEVEL_OF_DAMAGE,
        OWNER_POSTCODE
    FROM {{ ref('staging_vehicle') }}
)

SELECT * FROM vehicle_data;
