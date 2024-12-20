/*
sets up an external stage and defines an S3 storage integration, allowing Snowflake to securely access  S3 
bucket for loading data through Snowpipe
*/

-- Create the storage integration
CREATE OR REPLACE STORAGE INTEGRATION my_s3_integration
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = 'S3'
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = '<arn:aws:iam::423jkbaubcd12:user/omkar'  
STORAGE_ALLOWED_LOCATIONS = ('s3://richiebtlr-test-bucket/test-etl-bucket/');  

-- Grant usage on the integration
GRANT USAGE ON INTEGRATION my_s3_integration TO ROLE richiebtlr-snowflake-role>;  
