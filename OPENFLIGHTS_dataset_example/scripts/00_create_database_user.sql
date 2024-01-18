--------------------------------------------------------
--  Create Autonomous Database user
--------------------------------------------------------

-- Log into your ADB instance using ADMIN
create user graphuser identified by Welcome2PG_1234#;
alter user graphuser quota unlimited on data;

-- Permissions for 3-tier architecture
grant resource, connect, create session, create table, create view to graphuser;
-- Permissions for 2-tier architecture
grant create session, alter session, create table, create procedure, create type, create sequence, create view, create trigger to graphuser;

-- Grant GRAPH_DEVELOPER role
grant graph_developer to graphuser;

-- Permissions required to work with Graph Studio for Autonomous Database
alter user graphuser grant connect through graph$proxy_user;

-- Don´t forget to change the password for user GRAPHUSER with a password of your choice !!