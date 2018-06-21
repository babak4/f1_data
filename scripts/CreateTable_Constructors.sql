CREATE TABLE constructors (
    constructor_id     NUMBER(3),
    constructor_ref    VARCHAR2(20),
    constructor_name   VARCHAR2(30),
    nationality        VARCHAR2(20)
);

INSERT INTO constructors (
    constructor_id,
    constructor_ref,
    constructor_name,
    nationality
)
SELECT
    constructor_id,
    constructorref,
    name,
    nationality
FROM
    constructors_ext
ORDER BY 1;

ALTER TABLE constructors ADD CONSTRAINT pk_constructor PRIMARY KEY ( constructor_id )
    USING INDEX;
