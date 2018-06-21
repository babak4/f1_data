CREATE TABLE laptimes (
    race_id           NUMBER(3),
    driver_id         NUMBER(3),
    lap               NUMBER(2),
    position_in_lap   NUMBER(2),
    milliseconds       NUMBER(7)
);

INSERT INTO laptimes
SELECT
    *
FROM
    laptimes_ext
ORDER BY
    1,
    2,
    3;

ALTER TABLE laptimes
    ADD CONSTRAINT pk_laptimes PRIMARY KEY ( race_id,
                                             driver_id,
                                             lap )
        USING INDEX;

ALTER TABLE laptimes
    ADD CONSTRAINT fk_laptimes_race FOREIGN KEY ( race_id )
        REFERENCES races ( race_id );

ALTER TABLE laptimes
    ADD CONSTRAINT fk_laptimes_driver FOREIGN KEY ( driver_id )
        REFERENCES drivers ( driver_id );
