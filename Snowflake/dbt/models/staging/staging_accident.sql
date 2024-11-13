/*
loads data from the landing.accident table into staging.staging_accident, applying any required transformations.
*/


WITH accident_data AS (
    SELECT
        ACCIDENT_NO,
        TO_DATE(ACCIDENTDATE, 'YYYY-MM-DD') AS ACCIDENTDATE,
        TO_TIME(ACCIDENTTIME, 'HH24:MI:SS') AS ACCIDENTTIME,
        CAST(ACCIDENT_TYPE AS INTEGER) AS ACCIDENT_TYPE,
        REPLACE(ACCIDENT_TYPE_DESC, ' (Rigid) <= 4.5 Tonnes GVM', '') AS ACCIDENT_TYPE_DESC,
        DAY_OF_WEEK,
        DAY_WEEK_DESC,
        LIGHT_CONDITION,
        LIGHT_CONDITION_DESC,
        NO_OF_VEHICLES,
        NO_PERSONS,
        NO_PERSONS_KILLED,
        SEVERITY,
        SPEED_ZONE
    FROM {{ ref('landing_accident') }}
)

SELECT * FROM accident_data;
