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

-- REST enable the schema if you want to connect via ADB Database Actions
BEGIN
    ORDS_ADMIN.ENABLE_SCHEMA(
        p_enabled => TRUE,
        p_schema => 'GRAPHUSER',
        p_url_mapping_type => 'BASE_PATH',
        p_url_mapping_pattern => 'opg',
        p_auto_rest_auth=> FALSE
    );
    -- ENABLE DATA SHARING
    C##ADP$SERVICE.DBMS_SHARE.ENABLE_SCHEMA(
            SCHEMA_NAME => 'GRAPHUSER',
            ENABLED => TRUE
    );
    commit;
END;
/

-- Don´t forget to change the password for user GRAPHUSER with a password of your choice !!
