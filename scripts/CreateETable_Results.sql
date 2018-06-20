DROP TABLE results_ext;

CREATE TABLE results_ext (
    race_id            INTEGER,
    driver_id          INTEGER,
    constructor_id     INTEGER,
    driver_number      INTEGER,
    race_position      INTEGER,
    laps               INTEGER,
    milliseconds       INTEGER,
    fastestlap         INTEGER,
    fastestlap_rank    INTEGER,
    fastestlap_time    VARCHAR2(8),
    fastestlap_speed   NUMBER,
    status_id          INTEGER
)
ORGANIZATION EXTERNAL ( TYPE oracle_loader
    DEFAULT DIRECTORY f1_data ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
            NOLOGFILE
            SKIP 1
        FIELDS TERMINATED BY ',' MISSING FIELD VALUES ARE NULL (
            resultid,
            race_id,
            driver_id,
            constructor_id,
            driver_number,
            grid,
            race_position,
            positiontext,
            positionorder,
            points,
            laps,
            race_time,
            milliseconds,
            fastestlap,
            fastestlap_rank,
            fastestlap_time,
            fastestlap_speed,
            status_id
        )
    ) LOCATION ( '../data/results.csv' )
) REJECT LIMIT UNLIMITED;
