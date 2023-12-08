--------------------------------------------------------
--  Create Autonomous Database user
--------------------------------------------------------

-- Log into your ADB instance using ADMIN
create user graphuser identified by Welcome2PG_1234#;
grant resource, connect to graphuser;
alter user graphuser quota unlimited on data;

-- Change the password for user GRAPHUSER !!