/*
creates the star_schema.accident_type_dim dimension table, which stores accident types and descriptions.
*/


-- models/star_schema/accident_type_dim.sql

SELECT DISTINCT
    ACCIDENT_TYPE,
    ACCIDENT_TYPE_DESC
FROM {{ ref('staging_accident') }};
