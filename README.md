# TAC_ETL_project
ETL project that pulls files from TAC website which are then loaded into Snowflake


<img width="505" alt="image" src="https://github.com/user-attachments/assets/238f2ce5-6b2a-4cab-86e5-10172dc50a0c">

<img width="448" alt="tac_star schema" src="https://github.com/user-attachments/assets/ffa91e3c-eb7d-46de-8cb0-e96989c3ba75" />



**Summary of project**

Snowflake landing, staging, and star schema are setup, using AWS CodeBuild

SnowPipe is setup using AWS CodeBuild, to collect files from S3 bucket and load them into Snowflake landing

Lambda function pulls files ('accident', 'vehicle') from TAC Website and copies them into S3 raw bucket

S3 raw bucket sends event trigger to SnowPipe. Snowpipe loads the files into landing stage within Snowflake.

Data is then populated, using DBT, through the different Snowflake stages - landing, staging, star schema. 
DBT models are manually executed locally using venv (virtual environment). Normally use orchestration tool to automate the execution of the models (i.e Airflow, DBT Cloud)

End result is star schema within Snowflake (FACT_ACCIDENT & DIM tables) are populated and can be used for analytics and insights

