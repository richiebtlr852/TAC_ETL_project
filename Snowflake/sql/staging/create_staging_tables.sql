CREATE OR REPLACE TABLE staging.staging_accident (
    ACCIDENT_NO STRING,
    ACCIDENTDATE DATE,
    ACCIDENTTIME TIME,
    ACCIDENT_TYPE INTEGER,
    ACCIDENT_TYPE_DESC STRING,
    DAY_OF_WEEK INTEGER,
    DAY_WEEK_DESC STRING,
    LIGHT_CONDITION INTEGER,
    LIGHT_CONDITION_DESC STRING,
    NO_OF_VEHICLES INTEGER,
    NO_PERSONS INTEGER,
    NO_PERSONS_KILLED INTEGER,
    SEVERITY INTEGER,
    SPEED_ZONE INTEGER
);


CREATE OR REPLACE TABLE staging.staging_vehicle (
    ACCIDENT_NO STRING,
    VEHICLE_ID STRING,
    VEHICLE_YEAR_MANUF INTEGER,
    INITIAL_DIRECTION STRING,
    ROAD_SURFACE_TYPE INTEGER,
    ROAD_SURFACE_TYPE_DESC STRING,
    VEHICLE_BODY_STYLE STRING,
    VEHICLE_MAKE STRING,
    VEHICLE_MODEL STRING,
    VEHICLE_TYPE INTEGER,
    VEHICLE_TYPE_DESC STRING,
    TARE_WEIGHT INTEGER,
    TOTAL_NO_OCCUPANTS INTEGER,
    LEVEL_OF_DAMAGE INTEGER,
    OWNER_POSTCODE INTEGER
);