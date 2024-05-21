/******************************************
 * Analyze ORAGRAM-BOOK graph
 * Author: Karin Patenge
 * Last updated: May 2024
 ******************************************/

select first, last
from graph_table (
    oragram_book_graph
    match (v1)-[is "follows"]->{1,3}(v2)
    where v1.first = 'Denise'
    columns (v2.first as first, v2.last as last)
)
order by 1,2;

select distinct first1, last1, first2, last2
from graph_table (
    oragram_book_graph
    match (v1)-[is "follows"]->{1,5}(v2)
    where v1.id = 1
    columns (v1.first as first1, v1.last as last1, v2.first as first2, v2.last as last2)
)
order by 3,4;

select
    post_id,
    count(distinct e1_id) as num_views,
    count(distinct e2_id) as num_likes_or_comments
from graph_table (
    oragram_book_graph
    match
        (u1) -[e1 is "views"]-> (p),
        (p) <-[e2 is "likes"|"comments_on"]- (u2)
    columns (
        p.id as post_id,
        e1.id as e1_id,
        e2.id as e2_id )
)
group by post_id
having num_likes_or_comments < 5
order by num_views desc;

select
    post_id, first || ' ' || last as created_by,
    count(distinct e1_id) as num_views,
    count(distinct e2_id) as num_likes_or_comments
from graph_table (
    oragram_book_graph
    match
        (u1)-[e1 is "views"]-> (p),
        (p) <-[e2 is "likes"|"comments_on"]- (u2),
        (u3) -[e3 is "creates"]-> (p)
    columns (
        u3.first as first,
        u3.last as last,
        p.id as post_id,
        e1.id as e1_id,
        e2.id as e2_id )
)
group by post_id, created_by
having num_likes_or_comments < 5
order by num_views desc;

select
    v1_id,
    e1_id,
    v2_id,
    e2_id,
    v3_id
from
    graph_table (
        oragram_book_graph
        match (v1 is "user") -[e1]-> (v2) -[e2]-> (v3)
        columns (
            vertex_id(v1) as v1_id,
            edge_id(e1) as e1_id,
            vertex_id(v2) as v2_id,
            edge_id(e2) as e2_id,
            vertex_id(v3) as v3_id)
    );
