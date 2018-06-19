DROP TABLE drivers_ext;

CREATE TABLE drivers_ext (
    driver_id       INTEGER,
    driver_number   INTEGER,
    driver_code     VARCHAR2(3),
    forename        VARCHAR2(50),
    surname         VARCHAR2(50),
    dob             DATE,
    nationality     VARCHAR2(20)
)

organization EXTERNAL (
  TYPE ORACLE_LOADER
    DEFAULT DIRECTORY f1_data
ACCESS PARAMETERS (
    RECORDS DELIMITED BY NEWLINE
        NOLOGFILE
        SKIP 1
    FIELDS TERMINATED BY ',' MISSING FIELD VALUES ARE NULL
(
        driver_Id,
    driver_ref,
    driver_number,
    driver_code,
    forename,
    surname,
    dob
DATE "DD/MM/YYYY",
    nationality,
    url
    ) ) location('drivers.csv') ) reject limit unlimited;
