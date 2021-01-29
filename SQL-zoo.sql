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
--

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
  SELECT name FROM world
  WHERE name = capital

  -- Exercise 1.12:
  SELECT name FROM world
  WHERE capital LIKE '%City'

  -- Exercise 1.13:
  SELECT capital, name FROM world
  WHERE capital LIKE CONCAT('%', name, '%')

  -- Exercise 1.14:
  SELECT capital, name FROM world
  WHERE capital LIKE CONCAT(name, '_', '%')

  -- Exercise 1.15:
  SELECT name, REPLACE(capital, name, '') AS extension
  FROM world
  WHERE capital LIKE CONCAT(name, '_', '%')
--

-- Tutorial 2: SELECT from Noble
  -- Exercise 2.1:
  SELECT * FROM nobel
  WHERE yr = 1950

  -- Exercise 2.2:
  SELECT winner FROM nobel
  WHERE yr = 1962
   AND subject = 'Literature'

  -- Exercise 2.3:
  SELECT yr, subject FROM nobel
  WHERE winner = 'Albert Einstein'

  -- Exercise 2.4:
  SELECT winner FROM nobel
  WHERE subject = 'Peace'
    AND yr >= 2000

  -- Exercise 2.5:
  SELECT * FROM nobel
  WHERE subject = 'Literature'
    AND yr BETWEEN 1980 AND 1989

  -- Exercise 2.6:
  SELECT * FROM nobel
  WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

  -- Exercise 2.7:
  SELECT winner FROM nobel
  WHERE winner LIKE 'John%'

  -- Exercise 2.8:
  SELECT * FROM nobel
  WHERE (subject = 'Physics' AND yr = 1980)
    OR (subject = 'Chemistry' AND yr = 1984)

  -- Exercise 2.9:
  SELECT * FROM nobel
  WHERE subject NOT IN ('Chemistry', 'Medicine')
    AND yr = 1980

  -- Exercise 2.10:
  SELECT * FROM nobel
  WHERE (subject = 'Medicine' AND yr < 1910)
    OR (subject = 'Literature' AND yr >= 2004)

  -- Exercise 2.11:
  SELECT * FROM nobel
  WHERE winner = 'Peter Grünberg'

  -- Exercise 2.12:
  SELECT * FROM nobel
  WHERE winner = 'Eugene O\'Neill'

  -- Exercise 2.13:
  SELECT winner, yr, subject FROM nobel
  WHERE winner LIKE 'Sir%' ORDER BY yr DESC

  -- Exercise 2.14:
  SELECT winner, subject FROM nobel
  WHERE yr=1984
  ORDER BY subject IN ('Physics','Chemistry'), subject, winner

  -- Exercise 2.15:
  SELECT name, REPLACE(capital, name, '') AS extension
  FROM world
  WHERE capital LIKE CONCAT(name, '_', '%')
--
