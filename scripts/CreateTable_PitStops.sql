CREATE TABLE pitstops (
    race_id        NUMBER(3),
    driver_id      NUMBER(3),
    stop           NUMBER(1),
    lap            NUMBER(2),
    pitstop_time   VARCHAR2(8),
    milliseconds   NUMBER(7)
);

INSERT INTO pitstops
SELECT
    *
FROM
    pitstops_ext
ORDER BY
    1,
    2,
    3;

ALTER TABLE pitstops
    ADD CONSTRAINT pk_pitstop PRIMARY KEY ( race_id,
                                            driver_id,
                                            stop )
        USING INDEX;

ALTER TABLE pitstops
    ADD CONSTRAINT fk_pitstop_race FOREIGN KEY ( race_id )
        REFERENCES races ( race_id );

ALTER TABLE pitstops
    ADD CONSTRAINT fk_pitstop_driver FOREIGN KEY ( driver_id )
        REFERENCES drivers ( driver_id );
