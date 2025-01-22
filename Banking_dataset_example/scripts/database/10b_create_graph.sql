--------------------------------------------------------
-- Create the graph model as a view on TABLES
-- BANK_ACCOUNTS and BANK_TXNS
--------------------------------------------------------
DROP PROPERTY GRAPH IF EXISTS bank_graph;

CREATE PROPERTY GRAPH IF NOT EXISTS bank_graph
  VERTEX TABLES (
    bank_accounts
      KEY (acct_id)
      LABEL account
      PROPERTIES ( acct_id, name, balance )
  )
  EDGE TABLES (
    bank_txns
      KEY (txn_id)
      SOURCE KEY ( from_acct_id ) REFERENCES bank_accounts
      DESTINATION KEY ( to_acct_id ) REFERENCES bank_accounts
      LABEL transfers
      PROPERTIES ( txn_id, from_acct_id, to_acct_id, amount, txn_date )
  )
  OPTIONS (PG_SQL);

