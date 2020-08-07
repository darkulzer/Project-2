/*CREATE TABLE beers (
  index INT PRIMARY KEY,
  abv INT,
  id INT,
  name VARCHAR(200),
  style VARCHAR(200),
  brewery_id INT,
  ounces INT
);
CREATE TABLE breweries (
  brewery_id INT PRIMARY KEY,
  brewery_name VARCHAR(200),
  city VARCHAR(200),
  state VARCHAR(200)
  );
*/
SELECT * FROM beers;
SELECT * FROM breweries;
DELETE FROM beers;

--Alter table to change column type
ALTER TABLE beers 
ALTER COLUMN abv TYPE REAL
USING abv::REAL
;

--Join tables to compare alcohol content by state
SELECT beers.abv, breweries.state
FROM beers
INNER JOIN breweries
ON (beers.brewery_id=breweries.brewery_id)
;

--AVERAGE ABV BY STATE
SELECT breweries.state,
AVG(beers.abv)::NUMERIC(10,3)
FROM beers,breweries
WHERE beers.brewery_id=breweries.brewery_id
GROUP BY breweries.state
ORDER BY AVG(beers.abv)DESC;

--

