create table constructor_standings
(
    RACE_ID              NUMBER(3),
    CONSTRUCTOR_ID       NUMBER(3),
    POINTS               NUMBER(3),
    RACE_POSITION        NUMBER(2),
    WINS                 NUMBER(2)
);

insert into constructor_standings
select *
from CONSTRUCTOR_STANDINGS_EXT
ORDER BY 1, 2;

alter table constructor_standings add constraint pk_constructor_standing primary key(race_id, constructor_id) using index;
alter table constructor_standings add constraints fk_constructor_standing_race foreign key(race_id) references races(race_id);
alter table constructor_standings add constraints fk_constructor_standing_constrct foreign key ( constructor_id ) references constructors(constructor_id);
