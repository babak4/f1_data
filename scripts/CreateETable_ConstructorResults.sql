DROP TABLE constructors_Results_ext;

CREATE TABLE constructors_Results_ext (
    race_id          INTEGER,
    constructor_id   INTEGER,
    points           INTEGER
)
ORGANIZATION EXTERNAL ( TYPE oracle_loader
    DEFAULT DIRECTORY f1_data ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
            NOLOGFILE
            SKIP 1
        FIELDS TERMINATED BY ',' MISSING FIELD VALUES ARE NULL (
            constructorresultsid,
            race_id,
            constructor_id,
            points,
            status
        )
    ) LOCATION ( '../data/constructorResults.csv' )
) REJECT LIMIT UNLIMITED;
