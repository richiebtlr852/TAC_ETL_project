/*
defines the file format Snowpipe will use when reading files from S3 bucket. 
*/

CREATE OR REPLACE FILE FORMAT snowpipe_db.csv_file_format
TYPE = 'CSV'
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
SKIP_HEADER = 1
FIELD_DELIMITER = ','
NULL_IF = ('NULL', 'null', '');
