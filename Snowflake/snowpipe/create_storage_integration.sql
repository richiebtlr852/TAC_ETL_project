/*
sets up an external stage and defines an S3 storage integration, allowing Snowflake to securely access  S3 
bucket for loading data through Snowpipe
*/

-- Create the storage integration
CREATE OR REPLACE STORAGE INTEGRATION my_s3_integration
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = 'S3'
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = '<YOUR_AWS_ROLE_ARN>'  -- Replace with your AWS IAM role ARN
STORAGE_ALLOWED_LOCATIONS = ('s3://your-bucket-name/path-to-folder/');  -- Replace with your S3 bucket and folder path

-- Grant usage on the integration
GRANT USAGE ON INTEGRATION my_s3_integration TO ROLE <YOUR_ROLE>;  -- Replace <YOUR_ROLE> with the appropriate Snowflake role
