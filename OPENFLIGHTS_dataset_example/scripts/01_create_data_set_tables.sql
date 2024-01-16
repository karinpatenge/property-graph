--------------------------------------------------------
--  Create tables to store the OPENFLIGHTS dataset
--------------------------------------------------------
CREATE TABLE OPENFLIGHTS_AIRPORTS (
  ID number,
  NAME varchar2 (100),
  IATA varchar2 (10),
  ICAO varchar2 (10),
  LATITUDE number,
  LONGITUDE number,
  ALTITUDE number,
  TIMEZONE number,
  DST varchar2 (10),
  TZDBTIME varchar2 (100),
  AIRPORT_TYPE varchar2 (100),
  SOURCE varchar2 (100),
  CITY_ID number
);

CREATE TABLE OPENFLIGHTS_CITIES (
  ID number,
  COUNTRY varchar(100),
  CITY varchar(100)
);

CREATE TABLE OPENFLIGHTS_ROUTES (
  ID number,
  AIRLINE_ID number,
  SRC_AIRPORT_ID number,
  DEST_AIRPORT_ID number,
  CODESHARE varchar(100),
  STOPS number,
  EQUIPMENT varchar(100),
  DISTANCE_IN_KM number,
  DISTANCE_IN_MI number
);