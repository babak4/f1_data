CREATE TABLE status (
    status_id   NUMBER(3),
    status      VARCHAR2(20)
);

INSERT INTO status
SELECT
    *
FROM
    status_ext
ORDER BY
    1;

ALTER TABLE status ADD CONSTRAINT pk_status PRIMARY KEY ( status_id )
    USING INDEX;
