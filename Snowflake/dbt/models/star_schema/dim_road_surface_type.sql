/*
creates the star_schema.road_surface_type_dim dimension table, storing road surface type descriptions.
*/

-- models/star_schema/road_surface_type_dim.sql

SELECT DISTINCT
    ROAD_SURFACE_TYPE,
    ROAD_SURFACE_TYPE_DESC
FROM {{ ref('staging_vehicle') }};
