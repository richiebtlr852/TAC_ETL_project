/*
creates the Snowpipe that monitors an S3 bucket and loads new files into the landing schema. 
The Snowpipe leverages the my_s3_stage stage (pointing to the S3 bucket),
*/

-- Create an external stage for the S3 bucket, linking it to the storage integration and file format
CREATE OR REPLACE STAGE my_s3_stage
URL = 's3://your-bucket-name/path-to-folder/'  -- Replace with your actual S3 bucket path
STORAGE_INTEGRATION = my_s3_integration
FILE_FORMAT = snowpipe_db.csv_file_format;

-- Create the Snowpipe
CREATE OR REPLACE PIPE snowpipe_db.my_snowpipe
AUTO_INGEST = TRUE
AS
COPY INTO landing.accident
FROM @my_s3_stage
ON_ERROR = 'CONTINUE';
