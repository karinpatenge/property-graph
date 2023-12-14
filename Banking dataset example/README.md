# General information

The demo is designed to be used with any Oracle Database instance running on-premise or in the cloud. The minimum required Database version is 12.2.  
It assumes, you have SQLcl installed locally to access your database instance. If not, please follow the steps described [here] to download and install:

* SQLcl
* PGQL plugin for SQLcl

Then run the scripts located in folder [scripts](https://github.com/karinpatenge/property-graph/tree/main/Banking%20dataset%20example/scripts/database) to:

* [Create a database user](https://github.com/karinpatenge/property-graph/blob/main/Banking%20dataset%20example/scripts/database/00_create_database_user.sql) in your database instance
* [Create the tables](https://github.com/karinpatenge/property-graph/blob/main/Banking%20dataset%20example/scripts/database/01_create_data_set_tables.sql) for the Banking data set
* [Load the data](https://github.com/karinpatenge/property-graph/blob/main/Banking%20dataset%20example/scripts/database/02_load_data_set.sql) into the tables

After that login to your database instance with user *graphuser* using SQLcl

* ...
