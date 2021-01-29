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

-- Tutorial 2: SELECT from World
  -- Exercise 2.1:
  SELECT name, continent, population FROM world

  -- Exercise 2.2:
  SELECT name FROM world
  WHERE population > 200000000

  -- Exercise 2.3:
  SELECT name, gdp/population FROM world
  WHERE population > 200000000

  -- Exercise 2.4:
  SELECT name, population/1000000 FROM world
  WHERE continent = 'South America'

  -- Exercise 2.5:
  SELECT name, population FROM world
  WHERE name IN ('France', 'Germany', 'Italy')

  -- Exercise 2.6:
  SELECT name FROM world
  WHERE name LIKE '%United%'

  -- Exercise 2.7:
  SELECT name, population, area FROM world
  WHERE area > 3000000
    OR population > 250000000

  -- Exercise 2.8:
  SELECT name, population, area FROM world
  WHERE area > 3000000
    XOR population > 250000000

  -- Exercise 2.9:
  SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world
  WHERE continent = 'South America'

  -- Exercise 2.10:
  SELECT name, ROUND(gdp/population, -3) FROM world
  WHERE gdp >= 1000000000000

  -- Exercise 2.11:
  SELECT name, capital FROM world
  WHERE LENGTH(name) = LENGTH(capital)

  -- Exercise 2.12:
  SELECT name, capital FROM world
  WHERE (LEFT(name,1) = LEFT(capital,1)) AND (name <> capital)

  -- Exercise 2.13:
  SELECT name FROM world
  WHERE name LIKE '%a%'
    AND name LIKE '%e%'
    AND name LIKE '%i%'
    AND name LIKE '%o%'
    AND name LIKE '%u%'
    AND name NOT LIKE '% %'

--

-- Tutorial 3: SELECT from Noble
  -- Exercise 2.1:
  SELECT * FROM nobel
  WHERE yr = 1950

  -- Exercise 3.2:
  SELECT winner FROM nobel
  WHERE yr = 1962
   AND subject = 'Literature'

  -- Exercise 3.3:
  SELECT yr, subject FROM nobel
  WHERE winner = 'Albert Einstein'

  -- Exercise 3.4:
  SELECT winner FROM nobel
  WHERE subject = 'Peace'
    AND yr >= 2000

  -- Exercise 3.5:
  SELECT * FROM nobel
  WHERE subject = 'Literature'
    AND yr BETWEEN 1980 AND 1989

  -- Exercise 3.6:
  SELECT * FROM nobel
  WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

  -- Exercise 3.7:
  SELECT winner FROM nobel
  WHERE winner LIKE 'John%'

  -- Exercise 3.8:
  SELECT * FROM nobel
  WHERE (subject = 'Physics' AND yr = 1980)
    OR (subject = 'Chemistry' AND yr = 1984)

  -- Exercise 3.9:
  SELECT * FROM nobel
  WHERE subject NOT IN ('Chemistry', 'Medicine')
    AND yr = 1980

  -- Exercise 3.10:
  SELECT * FROM nobel
  WHERE (subject = 'Medicine' AND yr < 1910)
    OR (subject = 'Literature' AND yr >= 2004)

  -- Exercise 3.11:
  SELECT * FROM nobel
  WHERE winner = 'Peter Grünberg'

  -- Exercise 3.12:
  SELECT * FROM nobel
  WHERE winner = 'Eugene O\'Neill'

  -- Exercise 3.13:
  SELECT winner, yr, subject FROM nobel
  WHERE winner LIKE 'Sir%' ORDER BY yr DESC

  -- Exercise 3.14:
  SELECT winner, subject FROM nobel
  WHERE yr=1984
  ORDER BY subject IN ('Physics','Chemistry'), subject, winner
  
--
