import zipfile
import io
import requests
import boto3
import logging

# Initialize logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

# Initialize the S3 client
s3 = boto3.client('s3')
RAW_BUCKET_NAME = 'richiebtlr-raw-s3-bucket'  

def web_accident_file_download(URI):
    logger.info("Starting download from URI: %s", URI)
    r = requests.get(URI)
    if r.status_code != 200:
        logger.error('HTTP error occurred, status code: %s', r.status_code)
        raise ValueError('Failed to fetch the data from the website.')
    logger.info("Download successful.")
    z = zipfile.ZipFile(io.BytesIO(r.content))
    return z

def identify_files_in_zip(zip_file):
    file_list = zip_file.namelist()
    logger.info("Identified files in the ZIP archive: %s", file_list)
    return file_list

def upload_to_s3(content, file_name):
    try:
        logger.info("Uploading file %s to S3 bucket %s", file_name, RAW_BUCKET_NAME)
        s3.put_object(Bucket=RAW_BUCKET_NAME, Key=f'raw/{file_name}', Body=content)
        logger.info("Successfully uploaded %s to S3.", file_name)
    except Exception as e:
        logger.error("Failed to upload %s to S3: %s", file_name, e)

def process_and_upload_files(downloaded_zip):
    file_list = identify_files_in_zip(downloaded_zip)
    for file_name in file_list:
        logger.info("Processing file: %s", file_name)
        with downloaded_zip.open(file_name) as f:
            content = f.read()
            upload_to_s3(content, file_name)

def lambda_handler(event, context):
    URI = 'https://vicroadsopendatastorehouse.vicroads.vic.gov.au/opendata/Road_Safety/ACCIDENT.zip'
    logger.info("Lambda function started.")
    
    try:
        downloaded_zip = web_accident_file_download(URI)
        process_and_upload_files(downloaded_zip)
        logger.info("Files downloaded and uploaded to S3 successfully.")
        
        return {
            'statusCode': 200,
            'body': 'Files downloaded and uploaded to S3 successfully.'
        }
    except Exception as e:
        logger.error("Error processing files: %s", e)
        
        return {
            'statusCode': 500,
            'body': f"Failed to download or upload files: {e}"
        }
