CREATE TABLE constructor_results (
    race_id          NUMBER(4),
    constructor_id   NUMBER(3),
    points           NUMBER(2)
);

INSERT INTO constructor_results
SELECT DISTINCT
    race_id,
    constructor_id,
    points
FROM
    constructor_results_ext
ORDER BY
    1,
    2;

ALTER TABLE constructor_results
    ADD CONSTRAINT pk_constructor_result PRIMARY KEY ( race_id,
                                                       constructor_id )
        USING INDEX;

ALTER TABLE constructor_results ADD CONSTRAINT fk_constructor_result_race foreign key(race_id) references races(race_id);
ALTER TABLE constructor_results ADD CONSTRAINT fk_constructor_result_constrct foreign key(constructor_id) references constructors(constructor_id);
