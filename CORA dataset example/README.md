# General information

The demo is designed to be used with an Oracle Autonomous Database that includes [Graph Studio](https://www.oracle.com/database/graph/graph-faq/).
Check out [Oracle Cloud Free Tier](https://www.oracle.com/cloud/free/), if you don´t have access to an Autonomous Database yet. It includes two Oracle Autonomous Databases with powerful tools like Oracle APEX, Oracle SQL Developer Web, Graph Studio or Machine Learning.

Steps to follow:

1. Run the scripts located in folder [scripts](https://github.com/karinpatenge/property-graph/tree/main/CORA%20dataset%20example/scripts) to

    * Create a database user in your Autonomous Database
    * Create the tables for the CORA data set
    * Load the data into the tables

2. Login to OCI and start Graph Studio for your Autonomous Database instance

    * Import the [Graph Studio visualization template for the CORA graph](https://github.com/karinpatenge/property-graph/blob/main/CORA%20dataset%20example/scripts/graph_studio/graphstudio_cora_graphml_notebook_template.json) located in folder [scripts/graph-studio](https://github.com/karinpatenge/property-graph/tree/main/CORA%20dataset%20example/scripts/graph_studio)
    * Import the [CORA notebook for Graph Studio](https://github.com/karinpatenge/property-graph/blob/main/CORA%20dataset%20example/scripts/graph_studio/graphstudio_cora_graphml_notebook.dsnb) located in folder [scripts/graph-studio](https://github.com/karinpatenge/property-graph/tree/main/CORA%20dataset%20example/scripts/graph_studio)
