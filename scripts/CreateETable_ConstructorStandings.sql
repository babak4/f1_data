DROP TABLE constructors_standings_ext;

CREATE TABLE constructors_standings_ext (
    race_id          INTEGER,
    constructor_id   INTEGER,
    points           INTEGER,
    race_position    INTEGER,
    wins             INTEGER
)
ORGANIZATION EXTERNAL ( TYPE oracle_loader
    DEFAULT DIRECTORY f1_data ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
            NOLOGFILE
            SKIP 1
        FIELDS TERMINATED BY ',' MISSING FIELD VALUES ARE NULL (
            constructorstandingsid,
            race_id,
            constructor_id,
            points,
            race_position,
            positiontext,
            wins
        )
    ) LOCATION ( 'constructorStandings.csv' )
) REJECT LIMIT UNLIMITED;
