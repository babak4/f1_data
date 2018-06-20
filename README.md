# Formula1 Data (1950 - 2017)

This repository can be used to import Formula1 Race Data (from 1950 to 2017) into Oracle database.

The source of the data is the following *Kaggle* dataset:

https://www.kaggle.com/cjgdev/formula-1-race-data-19502017

The SQL scripts generate *External Tables* which can be used to import data.

**Note:** The deployment script does not persist the data inside the database, so that user is free to enforce a schema and the required constraints. 

## Deployment

The external tables rely on a directory object named "f1_data."

The directory object can be created (using SYS/SYSTEM accounts or any other privileged account) using the following command:

```
CREATE OR REPLACE DIRECTORY f1_data AS '{path to the directory which contains the CSV files}';
```

Afterwards you can create all the external tables using *install.sql*

```
$sqlplus *scott/oracle@db_tnsname* @install.sql
```
