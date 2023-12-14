# General information

The demo is designed to be used with any Oracle Database instance running on-premise or in the cloud. The minimum required Database version is 12.2.
It assumes, you have created a database user named *graphuser* with necessary privileges.


Steps to follow:

1. Run the scripts located in folder [scripts](https://github.com/karinpatenge/property-graph/tree/main/CORA%20dataset%20example/scripts/database) to

    * [Create a database user](https://github.com/karinpatenge/property-graph/blob/main/CORA%20dataset%20example/scripts/database/00_create_database_user.sql) in your Autonomous Database
    * [Create the tables](https://github.com/karinpatenge/property-graph/blob/main/CORA%20dataset%20example/scripts/database/01_create_data_set_tables.sql) for the CORA data set
    * [Load the data](https://github.com/karinpatenge/property-graph/blob/main/CORA%20dataset%20example/scripts/database/02_load_modified_data_set.sql) into the tables

2. Login to OCI and start Graph Studio for your Autonomous Database instance

    * Import the [Graph Studio visualization template for the CORA graph](https://github.com/karinpatenge/property-graph/blob/main/CORA%20dataset%20example/scripts/graph_studio/graphstudio_cora_graphml_notebook_template.json) located in folder [scripts/graph-studio](https://github.com/karinpatenge/property-graph/tree/main/CORA%20dataset%20example/scripts/graph_studio)
    * Import the [CORA notebook for Graph Studio](https://github.com/karinpatenge/property-graph/blob/main/CORA%20dataset%20example/scripts/graph_studio/graphstudio_cora_graphml_notebook.dsnb) located in folder [scripts/graph-studio](https://github.com/karinpatenge/property-graph/tree/main/CORA%20dataset%20example/scripts/graph_studio)
