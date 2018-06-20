DROP TABLE status_ext;

CREATE TABLE status_ext (
    status_id   INTEGER,
    status      VARCHAR2(50)
)
ORGANIZATION EXTERNAL ( TYPE oracle_loader
    DEFAULT DIRECTORY f1_data ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
            NOLOGFILE
            SKIP 1
        FIELDS TERMINATED BY ','
    ) LOCATION ( '../data/status.csv' )
) REJECT LIMIT UNLIMITED;
