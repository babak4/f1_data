# Formula1 Data (1950 - 2017)

This repository can be used to import Formula1 Race Data (from 1950 to 2017) into Oracle database.

The source of the data is the following *Kaggle* dataset:

https://www.kaggle.com/cjgdev/formula-1-race-data-19502017

The SQL scripts generate *External Tables* which can be used to import data.

**Note:** The deployment script does not persist the data inside the database, so that user is free to enforce a schema and the required constraints, and create other persisted data structures such as indices. 

## Deployment

The external tables rely on a directory object named "f1_data."

The directory object can be created using any account which has CREATE ANY DIRECTORY privilege using the following command in an Oracle SQL client, such as SQL*Plus, SQLcl, or SQLDeveloper:

```
SQL>DEFINE path_to_csv_files = '{path to the directory which contains the CSV files}'

SQL>DEFINE f1_data_schema = '{name of the schema that the external tables will reside in it}'

SQL>CREATE OR REPLACE DIRECTORY f1_data AS '&&path_to_csv_files';

SQL>GRANT READ,WRITE TO DIRECTORY f1_data to '&&f1_data_schema';
```

example:

```
SQL>DEFINE path_to_csv_files = '/home/oracle/data/f1'

SQL>DEFINE f1_data_schema = 'scott'

SQL>CREATE OR REPLACE DIRECTORY f1_data AS '&&path_to_csv_files';

SQL>GRANT READ,WRITE TO DIRECTORY f1_data to '&&f1_data_schema';
```

Afterwards you can create all the external tables using *install.sql*

```
$sqlplus username/password@db_tnsname_OR_connection_string @install.sql
```

example using a "Developer Day Appliance" (can be downloaded from http://www.oracle.com/technetwork/database/enterprise-edition/databaseappdev-vm-161299.html):

```
$sqlplus scott/oracle@localhost:1521/orcl @install.sql
```

