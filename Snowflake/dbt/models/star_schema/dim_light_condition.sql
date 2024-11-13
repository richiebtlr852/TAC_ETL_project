/*
creates the star_schema.light_condition_dim dimension table, storing light condition descriptions.
*/

-- models/star_schema/light_condition_dim.sql

SELECT DISTINCT
    LIGHT_CONDITION,
    LIGHT_CONDITION_DESC
FROM {{ ref('staging_accident') }};
