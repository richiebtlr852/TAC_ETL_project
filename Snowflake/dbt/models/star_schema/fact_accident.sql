/*
 loads data into the star_schema.accident_fact fact table, joining with dimension tables if necessary
*/

-- models/star_schema/accident_fact.sql

WITH accident_data AS (
    SELECT
        ACCIDENT_NO,
        ACCIDENTDATE,
        ACCIDENTTIME,
        ACCIDENT_TYPE,
        DAY_OF_WEEK,
        LIGHT_CONDITION,
        NO_OF_VEHICLES,
        NO_PERSONS,
        NO_PERSONS_KILLED,
        SEVERITY,
        SPEED_ZONE
    FROM {{ ref('staging_accident') }}
)

SELECT
    ACCIDENT_NO,
    ACCIDENTDATE,
    ACCIDENTTIME,
    ACCIDENT_TYPE,
    DAY_OF_WEEK,
    LIGHT_CONDITION,
    NO_OF_VEHICLES,
    NO_PERSONS,
    NO_PERSONS_KILLED,
    SEVERITY,
    SPEED_ZONE
FROM accident_data;
