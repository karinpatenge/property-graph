--------------------------------------------
-- Connect to your Oracle Database instance
-- using sqlcl with your DB user credentials
--------------------------------------------

set loadformat csv

-- Import data using LOAD
load table cora_cites CORA_CITES_DATA_TABLE.csv
load table cora_contents CORA_CONTENTS_DATA_TABLE.csv

/* Expected result:

Load data into table CORAUSER.CORA_CITES

csv
column_names on
delimiter ,
enclosures ""
double off
encoding UTF8
row_limit off
row_terminator default
skip_rows 0
skip_after_names

#INFO Number of rows processed: 5.429
#INFO Number of rows in error: 0
#INFO Last row processed in final committed batch: 5.429
SUCCESS: Processed without errors

Load data into table CORAUSER.CORA_CONTENTS

csv
column_names on
delimiter ,
enclosures ""
double off
encoding UTF8
row_limit off
row_terminator default
skip_rows 0
skip_after_names

#INFO Number of rows processed: 2.708
#INFO Number of rows in error: 0
#INFO Last row processed in final committed batch: 2.708
SUCCESS: Processed without errors

*/