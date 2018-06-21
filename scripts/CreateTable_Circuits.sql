CREATE TABLE circuits (
    circuit_id     NUMBER(2),
    circuit_ref    VARCHAR2(15),
    circuit_name   VARCHAR2(40),
    location       VARCHAR2(25),
    country        VARCHAR2(15),
    lat            NUMBER,
    lng            NUMBER
);

INSERT INTO circuits
SELECT *
FROM circuits_ext
ORDER BY 1;

ALTER TABLE circuits ADD CONSTRAINT pk_circuit PRIMARY KEY ( circuit_id )
    USING INDEX;
