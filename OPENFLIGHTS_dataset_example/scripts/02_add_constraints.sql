-------------------------------------------------------
--  Add PK and FK constraints to the OPENFLIGHTS tables
-------------------------------------------------------

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

-- Add primary keys
alter table openflights_airports add constraint openflights_airports_pk primary key (id);
alter table openflights_cities add constraint openflights_cities_pk primary key (id);
alter table openflights_routes add constraint openflights_routes_pk primary key (id);

-- Check, if there references to airports missing
select * from openflights_routes r
where
    r.src_airport_id not in (select id from openflights_airports) or
    r.dest_airport_id not in (select id from openflights_airports);

-- If so, remove them
delete from openflights_routes r
where
    r.src_airport_id not in (select id from openflights_airports) or
    r.dest_airport_id not in (select id from openflights_airports);
commit;

-- Add foreign keys
alter table openflights_airports add constraint openflights_airports_city_fk foreign key (city_id) references openflights_cities(id);
alter table openflights_routes add constraint openflights_routes_src_airport_fk foreign key (src_airport_id) references openflights_airports(id);
alter table openflights_routes add constraint openflights_routes_dest_airport_fk foreign key (dest_airport_id) references openflights_airports(id);