CREATE TABLE drivers (
    driver_id       NUMBER(3),
    driver_number   NUMBER(2),
    driver_code     VARCHAR2(3),
    forename        VARCHAR2(20),
    surname         VARCHAR2(25),
    dob             DATE,
    nationality     VARCHAR2(20)
);

INSERT INTO drivers
SELECT
    *
FROM
    drivers_ext
ORDER BY 1;

ALTER TABLE drivers ADD CONSTRAINT pk_driver PRIMARY KEY ( driver_id )
    USING INDEX;
