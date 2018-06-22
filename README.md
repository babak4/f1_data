# Formula1 Data (1950 - 2017)

This repository can be used to import Formula1 Race Data (from 1950 to 2017) into Oracle database.

The source of the data is the following *Kaggle* dataset:

https://www.kaggle.com/cjgdev/formula-1-race-data-19502017

The SQL scripts generate *External Tables* which can be used to import data.

~~**Note:** The deployment script does not persist the data inside the database, so that user is free to enforce a schema and the required constraints, and create other persisted data structures such as indices.~~ 

**Note:**
The script deploys a series of tables in a schema of your choice and enforces referential integrity constraints on them.

The tables are populated using the dataset (csv files) via external tables.

**Expected Anomaly in the data:**
In many races (i.e. *Results* table) you will find multiple drivers per race! 

That is not an issue with the data: for a period of time (1950s mainly) teams were allowed to run multiple drivers in a race (see an example: https://en.wikipedia.org/wiki/1955_Argentine_Grand_Prix) so the car was effectively shared among those drivers.

In that regard there are problems with the data: despite the fact that you can see evidence of "car sharing", but in many instances drivers have the same name (retrieved from *Drivers* table).

## Deployment

The external tables rely on a directory object named "f1_data."

The directory object can be created using any account which has CREATE ANY DIRECTORY privilege using the following command in an Oracle SQL client, such as SQL*Plus, SQLcl, or SQLDeveloper:

```
SQL>DEFINE path_to_csv_files = '{path to the directory which contains the CSV files}'

SQL>DEFINE f1_data_schema = '{name of the schema that the external tables will reside in it}'

SQL>CREATE OR REPLACE DIRECTORY f1_data AS '&&path_to_csv_files';

SQL>GRANT READ,WRITE ON DIRECTORY f1_data to '&&f1_data_schema';
```

example:

```
SQL>DEFINE path_to_csv_files = '/home/oracle/data/f1'

SQL>DEFINE f1_data_schema = 'scott'

SQL>CREATE OR REPLACE DIRECTORY f1_data AS '&&path_to_csv_files';

SQL>GRANT READ,WRITE ON DIRECTORY f1_data to '&&f1_data_schema';
```

Afterwards you can create all the external tables using *install.sql*

```
$sqlplus username/password@db_tnsname_OR_connection_string @install.sql
```

example using a "Developer Day Appliance" (can be downloaded from http://www.oracle.com/technetwork/database/enterprise-edition/databaseappdev-vm-161299.html):

```
$sqlplus scott/oracle@localhost:1521/orcl @install.sql
```

