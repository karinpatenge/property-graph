SELECT src, dst, city, route, located_in
FROM GRAPH_TABLE (
  openflights_graph
  MATCH (v1) -[e1]-> (v2) -[e2 IS located_in]-> (v3)
  COLUMNS (
    vertex_id(v1) AS src,
    edge_id(e1) AS route,
    vertex_id(v2) AS dst,
    edge_id(e2) AS located_in,
    vertex_id(v3) AS city)
)
FETCH FIRST 20 ROWS ONLY;

SELECT *
FROM GRAPH_TABLE (
  openflights_graph
  MATCH (a IS airport) -> (c IS city)
  WHERE c.city='Nuernberg' AND c.country='Germany'
  COLUMNS (a.iata, a.name)
);

SELECT *
FROM GRAPH_TABLE (
  openflights_graph
  MATCH (a IS airport) -[r IS route]-> (d IS airport)
  WHERE a.iata='NUE' AND d.iata='TXL'
  COLUMNS (r.airline_id AS airline)
)
ORDER BY airline;

SELECT DISTINCT airline
FROM GRAPH_TABLE (
  openflights_graph
  MATCH (a IS airport) -[r IS route]- (d IS airport)
  WHERE a.iata='NUE' AND d.iata='TXL'
  COLUMNS (r.airline_id AS airline)
)
ORDER BY airline;

SELECT COUNT(DISTINCT(iata))
FROM GRAPH_TABLE (
  openflights_graph
  MATCH (a IS airport) -[r IS route]->{2} (d IS airport)
  WHERE  a.iata='NUE' AND a.iata <> d.iata
  COLUMNS (d.iata)
);

SELECT *
FROM GRAPH_TABLE (
  openflights_graph
  MATCH (a IS airport) -[r IS route]->{1,2} (d IS airport)
  WHERE a.iata='NUE' AND d.iata <> 'NUE'
  ONE ROW PER STEP (v1, k, v2)
  COLUMNS (
    vertex_id(v1) AS id_v1,
    edge_id(k) AS id_k,
    vertex_id(v2) AS id_v2
  )
)
FETCH FIRST 20 ROWS ONLY;

SELECT *
FROM GRAPH_TABLE (
  openflights_graph
  MATCH (a IS airport) -[r IS route]->{1,2} (d IS airport)
  WHERE a.iata='NUE' AND d.iata <> 'NUE'
  ONE ROW PER STEP (v1, k, v2)
  COLUMNS (
    MATCHNUM() AS matchnum,
    ELEMENT_NUMBER(k) AS elemnum,
    v1.iata AS iata1,
    v2.iata AS iata2,
    k.distance_in_km AS dist
  )
)
FETCH FIRST 20 ROWS ONLY;
