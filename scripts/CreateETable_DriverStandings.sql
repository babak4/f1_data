DROP TABLE driver_standing_ext;

CREATE TABLE driver_standing_ext (
    race_id         INTEGER,
    driver_id       INTEGER,
    points          INTEGER,
    race_position   INTEGER,
    wins            INTEGER
)
ORGANIZATION EXTERNAL ( TYPE oracle_loader
    DEFAULT DIRECTORY f1_data ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
            NOLOGFILE
            SKIP 1
        FIELDS TERMINATED BY ',' MISSING FIELD VALUES ARE NULL (
            driverstandingsid,
            race_id,
            driver_id,
            points,
            race_position,
            positiontext,
            wins
        )
    ) LOCATION ( '../data/driverStandings.csv' )
) REJECT LIMIT UNLIMITED;
