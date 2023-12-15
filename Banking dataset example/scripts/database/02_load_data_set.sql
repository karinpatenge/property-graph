--------------------------------------------
-- Connect to your Oracle Database instance
-- using sqlcl with your DB user credentials
--------------------------------------------

set loadformat csv

-- Import data using LOAD
load table bank_accounts BANK_ACCOUNTS.csv
load table bank_txns_temp BANK_TXNS.csv new

/* Expected result:

Load data into table GRAPHUSER.BANK_TXNS

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

#ERROR Omitted columns must be nullable
#INFO Number of rows processed: 0
#INFO Number of rows in error: 0
#INFO No rows committed
SEVERE: Load terminated

Create new table and load data into table GRAPHUSER.BANK_TXNS_TEMP

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

#INFO COLUMN 1: from_acct_id => FROM_ACCT_ID
#INFO COLUMN 2: to_acct_id => TO_ACCT_ID
#INFO COLUMN 3: txn_date => TXN_DATE
#INFO COLUMN 4: amount => AMOUNT
#INFO COLUMN 5: Currency => CURRENCY
#INFO TIMESTAMP format detected: YYYY-MM-DD HH24:MI:SS.FF


CREATE TABLE GRAPHUSER.BANK_TXNS_TEMP
 (
  FROM_ACCT_ID VARCHAR2(26),
  TO_ACCT_ID VARCHAR2(26),
  TXN_DATE TIMESTAMP,
  AMOUNT NUMBER(9),
  CURRENCY VARCHAR2(26)
 )
;

#INFO Table created
#INFO Number of rows processed: 50.000
#INFO Number of rows in error: 0
#INFO Last row processed in final committed batch: 50.000
SUCCESS: Processed without errors
*/

-- Move data from BANK_TXNS_TEMP table into BANK_TxNS
insert into bank_txns (from_acct_id, to_acct_id, txn_date, amount, currency)(
    select from_acct_id, to_acct_id, txn_date, amount, currency from bank_txns_temp);

commit;

-- Drop table BANK_TXNS_TEMP
drop table bank_txns_temp purge;
