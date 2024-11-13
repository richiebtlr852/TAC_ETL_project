/* This script creates a dedicated database for Snowpipe, 
if prefer to separate Snowpipe-related objects from other data processing.
*/

CREATE DATABASE IF NOT EXISTS snowpipe_db;
USE DATABASE snowpipe_db;
