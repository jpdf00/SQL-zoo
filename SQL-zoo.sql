-- Tutorial 0: SELECT Basics
  -- Exercise 0.1:
  SELECT population FROM world
  WHERE name = 'Germany'

  -- Exercise 0.2:
  SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

  -- Exercise 0.3:
  SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

-- Tutorial 1: SELECT Names
  -- Exercise 1.1:
  SELECT name FROM world
  WHERE name LIKE 'Y%'

  -- Exercise 1.2:
  SELECT name FROM world
  WHERE name LIKE '%y'

  -- Exercise 1.3:
  SELECT name FROM world
  WHERE name LIKE '%x%'

  -- Exercise 1.4:
  SELECT name FROM world
  WHERE name LIKE '%land'

  -- Exercise 1.5:
  SELECT name FROM world
  WHERE name LIKE 'c%ia'

  -- Exercise 1.6:
  SELECT name FROM world
  WHERE name LIKE '%oo%'

  -- Exercise 1.7:
  SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

  -- Exercise 1.8:
  SELECT name FROM world
  WHERE name LIKE '_t%'
  ORDER BY name

  -- Exercise 1.9:
  SELECT name FROM world
  WHERE name LIKE '%o__o%'

  -- Exercise 1.10:
  SELECT name FROM world
  WHERE name LIKE '____'

  -- Exercise 1.11:
  SELECT name
  FROM world
  WHERE name = capital

  -- Exercise 1.12:
  SELECT name
  FROM world
  WHERE capital LIKE '%City'

  -- Exercise 1.13:
  SELECT capital, name
  FROM world
  WHERE capital LIKE CONCAT('%', name, '%')

  -- Exercise 1.14:
  SELECT capital, name
  FROM world
  WHERE capital LIKE CONCAT(name, '_', '%')

  -- Exercise 1.15:
  SELECT name, REPLACE(capital, name, '') AS extension
  FROM world
  WHERE capital LIKE CONCAT(name, '_', '%')
