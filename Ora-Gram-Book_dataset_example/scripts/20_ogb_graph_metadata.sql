/******************************************
 * Metadata of ORA-GRAM-BOOK graph
 * Author: Karin Patenge
 * Last updated: May 2024
 ******************************************/

select * from user_property_graphs;
select * from user_pg_edge_relationships where graph_name='ORAGRAM_BOOK_GRAPH';
select * from user_pg_elements where graph_name='ORAGRAM_BOOK_GRAPH';
select * from user_pg_element_labels where graph_name='ORAGRAM_BOOK_GRAPH';
select * from user_pg_keys where graph_name='ORAGRAM_BOOK_GRAPH';
select * from user_pg_label_properties where graph_name='ORAGRAM_BOOK_GRAPH';
select * from user_pg_labels where graph_name='ORAGRAM_BOOK_GRAPH';
select * from user_pg_prop_definitions where graph_name='ORAGRAM_BOOK_GRAPH';