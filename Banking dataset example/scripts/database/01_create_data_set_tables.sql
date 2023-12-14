--------------------------------------------------------
--  Create table BANK_ACCOUNTS
--------------------------------------------------------
create table bank_accounts (
    acct_id number(10),
    name varchar2(100),
    is_fraud number(1)
)
/

--------------------------------------------------------
--  Add unique index to table BANK_ACCOUNTS
--------------------------------------------------------
create unique index bank_accounts_pk on bank_accounts (acct_id)
/

--------------------------------------------------------
--  Add primary key constraint to table BANK_ACCOUNTS
--------------------------------------------------------
alter table bank_accounts add constraint bank_accounts_pk primary key (acct_id)
/

--------------------------------------------------------
--  Create table BANK_TXNS
--------------------------------------------------------
create table bank_txns (
	txn_id number(10),
	from_acct_id number(10),
	to_acct_id number(10),
	description varchar2(100),
	amount number(13,2),
	txn_date date
)
/

--------------------------------------------------------
--  Add unique index to table BANK_TXNS
--------------------------------------------------------
create unique index bank_txns_pk on bank_txns (txn_id)
/

--------------------------------------------------------
--  Add primary key constraints to table BANK_TXNS
--------------------------------------------------------
alter table bank_txns add constraint bank_txns_pk primary key (txn_id)
/

--------------------------------------------------------
--  Add foreign key constraints to table BANK_TXNS
--------------------------------------------------------
alter table bank_txns add constraint bank_txns_from_acct_fk foreign key (from_acct_id) references bank_accounts(acct_id)
/
alter table bank_txns add constraint bank_txns_to_acct_fk foreign key (to_acct_id) references bank_accounts(acct_id)
/