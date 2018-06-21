CREATE TABLE qualifying (
    race_id               NUMBER(3),
    driver_id             NUMBER(3),
    constructor_id        NUMBER(3),
    driver_number         NUMBER(2),
    qualifying_position   NUMBER(2),
    q1                    VARCHAR2(8),
    q2                    VARCHAR2(8),
    q3                    VARCHAR2(9)
);

INSERT INTO qualifying
SELECT
    *
FROM
    qualifying_ext
ORDER BY
    1,
    2;

ALTER TABLE qualifying
    ADD CONSTRAINT pk_qualifying PRIMARY KEY ( race_id,
                                               driver_id )
        USING INDEX;

ALTER TABLE qualifying
    ADD CONSTRAINT fk_qualifying_race FOREIGN KEY ( race_id )
        REFERENCES races ( race_id );

ALTER TABLE qualifying
    ADD CONSTRAINT fk_qualifying_driver FOREIGN KEY ( driver_id )
        REFERENCES drivers ( driver_id );

ALTER TABLE qualifying
    ADD CONSTRAINT fk_qualifying_constructor FOREIGN KEY ( constructor_id )
        REFERENCES constructors ( constructor_id );
