CREATE TABLE results (
    race_id            NUMBER(3),
    driver_id          NUMBER(3),
    constructor_id     NUMBER(3),
    driver_number      NUMBER(3),
    race_position      NUMBER(2),
    laps               NUMBER(3),
    milliseconds       NUMBER(8),
    fastestlap         NUMBER(2),
    fastestlap_rank    NUMBER(2),
    fastestlap_time    VARCHAR2(7),
    fastestlap_speed   NUMBER,
    status_id          NUMBER(3)
);

INSERT INTO results
SELECT
    *
FROM
    results_ext de
WHERE
    EXISTS (
        SELECT
            NULL
        FROM
            drivers
        WHERE
            driver_id = de.driver_id
    )
ORDER BY
    1,
    2;

ALTER TABLE results
    ADD CONSTRAINT fk_results_race FOREIGN KEY ( race_id )
        REFERENCES races ( race_id );

ALTER TABLE results
    ADD CONSTRAINT fk_results_driver FOREIGN KEY ( driver_id )
        REFERENCES drivers ( driver_id );

ALTER TABLE results
    ADD CONSTRAINT fk_results_constructor FOREIGN KEY ( constructor_id )
        REFERENCES constructors ( constructor_id );

ALTER TABLE results
    ADD CONSTRAINT fk_results_status FOREIGN KEY ( status_id )
        REFERENCES status ( status_id );
