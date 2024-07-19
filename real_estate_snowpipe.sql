DROP DATABASE IF EXISTS redfin_database;

CREATE DATABASE redfin_database;

-- CREATE WAREHOUSE redfin_warehouse;

CREATE SCHEMA redfin_schema;

TRUNCATE TABLE redfin_database.redfin_schema.redfin_table;

CREATE OR REPLACE TABLE redfin_database.redfin_schema.redfin_table (
period_duration INT,
city STRING,
state STRING,
property_type STRING,
median_sale_price FLOAT,
median_ppsf FLOAT,
homes_sold FLOAT,
inventory FLOAT,
months_of_supply FLOAT,
median_dom FLOAT,
sold_above_list FLOAT,
period_end_yr INT,
period_end_month STRING
);

SELECT *
FROM redfin_database.redfin_schema.redfin_table LIMIT 50;

SELECT COUNT(*) FROM redfin_database.redfin_schema.redfin_table;

-- DESC TABLE redfin_database.redfin_schema.redfin_table;

-- Create file format object
  
CREATE SCHEMA file_format_schema;

CREATE OR REPLACE file format redfin_database.file_format_schema.format_parquet
type = 'PARQUET'
compression = 'SNAPPY';

-- Create staging schema

CREATE SCHEMA external_stage_schema;

-- Create staging

-- DROP STAGE redfin_database.external_stage_schema.redfin_ext_stage_yml;

CREATE OR REPLACE STAGE redfin_database.external_stage_schema.redfin_ext_stage_yml
url="s3://sundar28/redfin-transform-zone-yml/redfin_data.parquet/"
credentials=(aws_key_id='AKIA2UC3A6Y7W25YVKEG'
aws_secret_key='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')
FILE_FORMAT = redfin_database.file_format_schema.format_parquet;

list @redfin_database.external_stage_schema.redfin_ext_stage_yml;

-- Create schema for snowpipe

-- DROP SCHEMA redfin_database.snowpipe_schema;

CREATE OR REPLACE SCHEMA redfin_database.snowpipe_schema;

-- Create Pipe

CREATE OR REPLACE PIPE redfin_database.snowpipe_schema.redfin_snowpipe
auto_ingest = TRUE
AS
COPY INTO redfin_database.redfin_schema.redfin_table
FROM @redfin_database.external_stage_schema.redfin_ext_stage_yml
FILE_FORMAT = (TYPE = 'PARQUET')
MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE;


DESC PIPE redfin_database.snowpipe_schema.redfin_snowpipe;
