SET SQLBLANKLINES ON

PROMPT Creating External Tables
@@scripts/CreateETable_Circuits.sql
@@scripts/CreateETable_Constructors.sql
@@scripts/CreateETable_ConstructorResults.sql
@@scripts/CreateETable_ConstructorStandings.sql
@@scripts/CreateETable_LapTimes.sql
@@scripts/CreateETable_Drivers.sql
@@scripts/CreateETable_DriverStandings.sql
@@scripts/CreateETable_PitStops.sql
@@scripts/CreateETable_Qualifying.sql
@@scripts/CreateETable_Races.sql
@@scripts/CreateETable_Results.sql
@@scripts/CreateETable_Status.sql

PROMPT Creating Sample Schema
@@scripts/CreateTable_Circuits.sql
@@scripts/CreateTable_Constructors.sql
@@scripts/CreateTable_Races.sql
@@scripts/CreateTable_ConstructorResults.sql
@@scripts/CreateTable_ConstructorStandings.sql
@@scripts/CreateTable_Drivers.sql
@@scripts/CreateTable_DriverStandings.sql
@@scripts/CreateTable_LapTimes.sql
@@scripts/CreateTable_PitStops.sql
@@scripts/CreateTable_Qualifying.sql
@@scripts/CreateTable_Status.sql
@@scripts/CreateTable_Results.sql

PROMPT Gathering Schema Statistics
EXEC DBMS_STATS.GATHER_SCHEMA_STATS(user);
PROMPT Gathering Schema Statistics - Done!
exit
