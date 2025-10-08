/* Create Database and Schemas */

/* Script Purpose:
    -This script creates a new database named 'DataWarehouse' after 
    checking if it already exists.
    
    -the script sets up three schemas within the database: 
    'bronze', 'silver', and 'gold'.
*/


## Drop "DataWarehouse" if it already exist
DROP DATABASE IF EXISTS DataWarehouse;

## this creates a database called "DataWarehouse"
CREATE DATABASE DataWarehouse;
USE DataWarehouse;

## Create Schemas
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
