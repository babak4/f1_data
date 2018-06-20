DROP TABLE circuits_ext;

CREATE TABLE circuits_ext (
    circuit_id     INTEGER,
    circuit_ref    VARCHAR2(50),
    circuit_name   VARCHAR2(50),
    location       VARCHAR2(50),
    country        VARCHAR2(50),
    lat            NUMBER,
    lng            NUMBER
)
ORGANIZATION EXTERNAL ( TYPE oracle_loader
    DEFAULT DIRECTORY f1_data ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
            NOLOGFILE
            SKIP 1
        FIELDS TERMINATED BY ',' MISSING FIELD VALUES ARE NULL (
            circuit_id,
            circuit_ref,
            circuit_name,
            location,
            country,
            lat,
            lng,
            alt,
            url
        )
    ) LOCATION ( 'circuits.csv' )
) REJECT LIMIT UNLIMITED;
