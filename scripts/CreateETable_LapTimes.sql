DROP TABLE laptimes_ext;

CREATE TABLE laptimes_ext (
    race_id           INTEGER,
    driver_id         INTEGER,
    lap               INTEGER,
    position_in_lap   INTEGER,
    miliseconds       INTEGER
)
ORGANIZATION EXTERNAL ( TYPE oracle_loader
    DEFAULT DIRECTORY f1_data ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
            NOLOGFILE
            SKIP 1
        FIELDS TERMINATED BY ',' MISSING FIELD VALUES ARE NULL (
            race_id,
            driver_id,
            lap,
            position_in_lap,
            lap_time,
            miliseconds
        )
    ) LOCATION ( 'lapTimes.csv' )
) REJECT LIMIT UNLIMITED;