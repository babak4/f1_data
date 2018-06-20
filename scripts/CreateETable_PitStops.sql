DROP TABLE pitstops_ext;

CREATE TABLE pitstops_ext (
    race_id        INTEGER,
    driver_id      INTEGER,
    stop           INTEGER,
    lap            INTEGER,
    pitstop_time   VARCHAR2(10),
    milliseconds   INTEGER
)
ORGANIZATION EXTERNAL ( TYPE oracle_loader
    DEFAULT DIRECTORY f1_data ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
            SKIP 1
        FIELDS TERMINATED BY ',' MISSING FIELD VALUES ARE NULL (
            race_id,
            driver_id,
            stop,
            lap,
            pitstop_time,
            pitsop_duration,
            milliseconds
        )
    ) LOCATION ( 'pitStops.csv' )
) REJECT LIMIT UNLIMITED;
