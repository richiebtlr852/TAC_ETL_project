# TAC_ETL_project
ETL project that pulls files from TAC website which are then loaded into Snowflake


<img width="505" alt="image" src="https://github.com/user-attachments/assets/238f2ce5-6b2a-4cab-86e5-10172dc50a0c">

**Summary of project**

Snowflake landing, staging, and star schema are setup, using AWS CodeBuild

SnowPipe is setup using AWS CodeBuild, to collect files from S3 bucket and load them into Snowflake landing

Lambda function pulls files ('accident', 'vehicle') from TAC Website and copies them into S3 raw bucket

S3 raw bucket sends event trigger to SnowPipe. Snowpipe loads the files into landing.

Data is then populated through the different Snowflake stages - landing, staging, star schema

End result is star schema (FACT_ACCIDENT & DIMS are populated within Snowflake)

