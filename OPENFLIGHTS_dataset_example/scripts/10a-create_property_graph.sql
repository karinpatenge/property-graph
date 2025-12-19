--------------------------------------------------------
--  Create SQL Property Graph for the OPENFLIGHTS tables
--------------------------------------------------------

-- Use any SQL client to connect to your database user

-- Drop the graph if it exists already
drop property graph if exists openflights_graph;

-- Create the graph
create property graph if not exists openflights_graph
  vertex tables (
    openflights_airports as airports
      key ( id )
      label airport
      properties (
          name,
          iata,
          icao,
          airport_type,
          longitude,
          latitude,
          altitude,
          timezone,
          tzdbtime,
          dst
      ),
    openflights_cities as cities
      key ( id )
      label city
      properties (
          city,
          country
      )
  )
  edge tables (
    openflights_routes as routes
      source key ( src_airport_id ) references airports (id)
      destination key ( dest_airport_id ) references airports (id)
      label route
      properties (
        codeshare,
        airline_id,
        equipment,
        stops,
        distance_in_mi,
        distance_in_km
      ),
    openflights_airports as airports_in_cities
      source key ( id ) references airports (id)
      destination key ( city_id ) references cities (id)
      label located_in
      no properties
  );
