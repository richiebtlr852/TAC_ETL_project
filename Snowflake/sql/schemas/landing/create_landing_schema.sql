-- Create the database if it does not already exist
CREATE DATABASE IF NOT EXISTS tac_landing;

-- Use the database
USE DATABASE tac_landing;

-- Create the landing schema if it does not already exist
CREATE SCHEMA IF NOT EXISTS landing;

-- Verify the schema creation
SHOW SCHEMAS LIKE 'landing';

