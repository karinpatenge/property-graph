# General information

The demo is designed for any Oracle Database instance on-premises or in the cloud. The minimum required Oracle Database version is 12.2.

It assumes you have SQLcl installed locally to access your database instance.

To query graphs using SQLcl, you additionally need a plugin that translates the [PGQL](https://pgql-lang.org/spec/latest/) statements into SQL. PGQL is the abbreviation for Property Graph Query language. It is built on top of SQL, bringing graph pattern-matching capabilities to existing SQL users and new users who are interested in graph technology but do not have a SQL background.

* SQLcl
    * [Download page](https://www.oracle.com/database/sqldeveloper/technologies/sqlcl/download/)
    * [Installation instructions](https://docs.oracle.com/en/database/oracle/apex/23.1/aeadm/downloading-and-installing-sqlcl.html)
* PGQL plugin for SQLcl
    * [Instructions for download and installation](https://docs.oracle.com/en/database/oracle/sql-developer-command-line/23.3/sqcug/using-pgql-plug-sqlcl.html)

Then run the scripts located in folder [scripts](https://github.com/karinpatenge/property-graph/tree/main/Banking%20dataset%20example/scripts/database) to:

* [Create a database user](https://github.com/karinpatenge/property-graph/blob/main/Banking%20dataset%20example/scripts/database/00_create_database_user.sql) in your database instance
* [Create the tables](https://github.com/karinpatenge/property-graph/blob/main/Banking%20dataset%20example/scripts/database/01_create_data_set_tables.sql) for the Banking data set
* [Load the data](https://github.com/karinpatenge/property-graph/blob/main/Banking%20dataset%20example/scripts/database/02_load_data_set.sql) into the tables
