/* Create Database/Schemas */

/* Script Purpose:
    -the script creates and sets up three schemas within the database and 
    checking if it already exists.: 
    'bronze', 'silver', and 'gold'.
*/

--CREATE SCHEMA/DATABASE.

DROP DATABASE IF EXISTS bronze;
DROP DATABASE IF EXISTS silver;
DROP DATABASE IF EXISTS gold;

CREATE DATABASE bronze;
CREATE DATABASE silver;
CREATE DATABASE gold;
