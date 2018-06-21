DROP TABLE driver_standings;

CREATE TABLE driver_standings (
    race_id         NUMBER(3),
    driver_id       NUMBER(3),
    points          NUMBER(3),
    race_position   NUMBER(3),
    wins            NUMBER(2)
);

INSERT INTO driver_standings
SELECT
    *
FROM
    driver_standings_ext
ORDER BY 1, 2;

ALTER TABLE driver_standings ADD CONSTRAINT pk_driver_standing PRIMARY KEY ( race_id,
                                                                             driver_id );

ALTER TABLE driver_standings
    ADD CONSTRAINT fk_driver_standing FOREIGN KEY ( race_id )
        REFERENCES races ( race_id );
