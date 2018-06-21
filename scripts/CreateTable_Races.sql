CREATE TABLE races (
    race_id      NUMBER(4),
    race_year    NUMBER(4),
    round        NUMBER(2),
    circuit_id   NUMBER(2),
    race_name    VARCHAR2(30),
    race_date    DATE
);

INSERT INTO races
SELECT
    *
FROM
    races_ext
ORDER BY 1;

ALTER TABLE races ADD CONSTRAINT pk_race PRIMARY KEY ( race_id )
    USING INDEX;

ALTER TABLE races
    ADD CONSTRAINT fk_circuit FOREIGN KEY ( circuit_id )
        REFERENCES circuits ( circuit_id );

ALTER TABLE races ADD CONSTRAINT uq_race_date UNIQUE ( race_date )
    USING INDEX;
