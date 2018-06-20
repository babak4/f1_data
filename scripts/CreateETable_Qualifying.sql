DROP TABLE qualifying_ext;

CREATE TABLE qualifying_ext (
    race_id               INTEGER,
    driver_id             INTEGER,
    constructor_id        INTEGER,
    driver_number         INTEGER,
    qualifying_position   INTEGER,
    q1                    VARCHAR2(8),
    q2                    VARCHAR2(8),
    q3                    VARCHAR2(10)
)
ORGANIZATION EXTERNAL ( TYPE oracle_loader
    DEFAULT DIRECTORY f1_data ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
            NOLOGFILE
            SKIP 1
        FIELDS TERMINATED BY ',' MISSING FIELD VALUES ARE NULL (
            qualify_id,
            race_id,
            driver_id,
            constructor_id,
            driver_number,
            qualifying_position,
            q1,
            q2,
            q3
        )
    ) LOCATION ( 'qualifying.csv' )
) REJECT LIMIT UNLIMITED;
