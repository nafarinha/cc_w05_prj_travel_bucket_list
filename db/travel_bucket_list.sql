/*
Terminal commands:
createdb travel_bucket_list
psql -d travel_bucket_list -f db/travel_bucket_list.sql
*/

DROP TABLE destinations;
DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE countries
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  continent VARCHAR(20)
);

CREATE TABLE cities
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  lat FLOAT,
  long FLOAT,
  country_id INT8 REFERENCES countries(id)
);

CREATE TABLE destinations
(
  id SERIAL8 PRIMARY KEY,
  is_visited BOOLEAN,
  city_id INT8 REFERENCES cities(id)

);
