-------------------------------------------------
--  Check data quality. Clean up inconsistencies.
-------------------------------------------------

-- Check if there are any duplicate rows in the OPENFLIGHT_CITIES table
select id, count(*) from openflights_cities
group by id
having count(*) > 1;

-- If so, remove the duplicate rows first
delete from openflights_cities
where  rowid not in (
  select min(rowid)
  from   openflights_cities
  group  by id
);
commit;

-- Check if there are any duplicate rows in the OPENFLIGHT_AIPORTS table
select id, count(*) from openflights_airports
group by id
having count(*) > 1;

-- If so, remove the duplicate rows first
delete from openflights_airports
where rowid not in (
  select min(rowid)
  from   openflights_airports
  group  by id
);
commit;

-- Check if there are any duplicate rows in the OPENFLIGHT_ROUTES table
select id, count(*) from openflights_routes
group by id
having count(*) > 1;

-- If so, remove the duplicate rows first
delete from openflights_routes
where  rowid not in (
  select min(rowid)
  from   openflights_routes
  group  by id
);
commit;

-- Check if there are missing source or destination airport keys
select * from openflights_routes
where src_airport_id is null or dest_airport_id is null;

-- If so, remove those routes
delete from openflights_routes
where src_airport_id is null or dest_airport_id is null;
commit;

-- Check, if there are references to airports missing
select * from openflights_routes r
where
    r.src_airport_id not in (select id from openflights_airports) or
    r.dest_airport_id not in (select id from openflights_airports);

-- If so, remove unrelated routes
delete from openflights_routes r
where
    r.src_airport_id not in (select id from openflights_airports) or
    r.dest_airport_id not in (select id from openflights_airports);
commit;