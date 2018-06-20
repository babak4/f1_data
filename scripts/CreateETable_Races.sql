DROP TABLE races_ext;

CREATE TABLE races_ext (
    race_id      INTEGER,
    race_year    INTEGER,
    round        INTEGER,
    circuit_id   INTEGER,
    race_name    VARCHAR2(100),
    race_date    DATE
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
        race_Id,
    race_year,
    round,
    circuit_id,
    race_name,
    race_date
DATE "YYYY-MM-DD",
    race_time,
    url
    ) ) location('../data/races.csv') ) reject limit unlimited;
