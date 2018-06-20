DROP TABLE constructors_ext;

CREATE TABLE constructors_ext (
    constructor_id   INTEGER,
    constructorref   VARCHAR2(20),
    name             VARCHAR2(50),
    nationality      VARCHAR2(20)
)
ORGANIZATION EXTERNAL ( TYPE oracle_loader
    DEFAULT DIRECTORY f1_data ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
            NOLOGFILE
            SKIP 1
        FIELDS TERMINATED BY ',' MISSING FIELD VALUES ARE NULL (
            constructor_id,
            constructorref,
            name,
            nationality,
            url
        )
    ) LOCATION ( 'constructors.csv' )
) REJECT LIMIT UNLIMITED;
