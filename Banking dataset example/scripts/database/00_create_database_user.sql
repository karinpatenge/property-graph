--------------------------------------------------------
--  Create a database user
--------------------------------------------------------

-- Log into your Oracle Database instance using SYSTEM
create user graphuser identified by Welcome2PG_1234#;
grant resource, connect, graph_developer to graphuser;
alter user graphuser quota unlimited on users;

-- Change the password for user GRAPHUSER !!