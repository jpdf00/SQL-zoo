-- Tutorial 0: SELECT Basics
  -- Exercise 0.1: Introducing the world table of countries
  SELECT population FROM world
  WHERE name = 'Germany'

  -- Exercise 0.2: Scandinavia
  SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

  -- Exercise 0.3: Just the right size
  SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

--

-- Tutorial 1: SELECT Names
  -- Exercise 1.1: Pattern Matching Strings
  SELECT name FROM world
  WHERE name LIKE 'Y%'

  -- Exercise 1.2: Pattern Matching Strings
  SELECT name FROM world
  WHERE name LIKE '%y'

  -- Exercise 1.3: Pattern Matching Strings
  SELECT name FROM world
  WHERE name LIKE '%x%'

  -- Exercise 1.4: Pattern Matching Strings
  SELECT name FROM world
  WHERE name LIKE '%land'

  -- Exercise 1.5: Pattern Matching Strings
  SELECT name FROM world
  WHERE name LIKE 'c%ia'

  -- Exercise 1.6: Pattern Matching Strings
  SELECT name FROM world
  WHERE name LIKE '%oo%'

  -- Exercise 1.7: Pattern Matching Strings
  SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

  -- Exercise 1.8: Pattern Matching Strings
  SELECT name FROM world
  WHERE name LIKE '_t%'
  ORDER BY name

  -- Exercise 1.9: Pattern Matching Strings
  SELECT name FROM world
  WHERE name LIKE '%o__o%'

  -- Exercise 1.10: Pattern Matching Strings
  SELECT name FROM world
  WHERE name LIKE '____'

  -- Exercise 1.11: Pattern Matching Strings[Harder Questions]
  SELECT name FROM world
  WHERE name = capital

  -- Exercise 1.12: Pattern Matching Strings[Harder Questions]
  SELECT name FROM world
  WHERE capital LIKE '%City'

  -- Exercise 1.13: Pattern Matching Strings[Harder Questions]
  SELECT capital, name FROM world
  WHERE capital LIKE CONCAT('%', name, '%')

  -- Exercise 1.14: Pattern Matching Strings[Harder Questions]
  SELECT capital, name FROM world
  WHERE capital LIKE CONCAT(name, '_', '%')

  -- Exercise 1.15: Pattern Matching Strings[Harder Questions]
  SELECT name, REPLACE(capital, name, '') AS extension
  FROM world
  WHERE capital LIKE CONCAT(name, '_', '%')

--

-- Tutorial 2: SELECT from World
  -- Exercise 2.1: Introduction
  SELECT name, continent, population FROM world

  -- Exercise 2.2: Large Countries
  SELECT name FROM world
  WHERE population > 200000000

  -- Exercise 2.3: Per capita GDP
  SELECT name, gdp/population FROM world
  WHERE population > 200000000

  -- Exercise 2.4: South America In millions
  SELECT name, population/1000000 FROM world
  WHERE continent = 'South America'

  -- Exercise 2.5: France, Germany, Italy
  SELECT name, population FROM world
  WHERE name IN ('France', 'Germany', 'Italy')

  -- Exercise 2.6: United
  SELECT name FROM world
  WHERE name LIKE '%United%'

  -- Exercise 2.7: Two ways to be big
  SELECT name, population, area FROM world
  WHERE area > 3000000
    OR population > 250000000

  -- Exercise 2.8: One or the other (but not both)
  SELECT name, population, area FROM world
  WHERE area > 3000000
    XOR population > 250000000

  -- Exercise 2.9: Rounding
  SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world
  WHERE continent = 'South America'

  -- Exercise 2.10: Trillion dollar economies
  SELECT name, ROUND(gdp/population, -3) FROM world
  WHERE gdp >= 1000000000000

  -- Exercise 2.11: Name and capital have the same length
  SELECT name, capital FROM world
  WHERE LENGTH(name) = LENGTH(capital)

  -- Exercise 2.12: Matching name and capital
  SELECT name, capital FROM world
  WHERE (LEFT(name,1) = LEFT(capital,1)) AND (name <> capital)

  -- Exercise 2.13: All the vowels
  SELECT name FROM world
  WHERE name LIKE '%a%'
    AND name LIKE '%e%'
    AND name LIKE '%i%'
    AND name LIKE '%o%'
    AND name LIKE '%u%'
    AND name NOT LIKE '% %'

--

-- Tutorial 3: SELECT from Noble
  -- Exercise 3.1: Winners from 1950
  SELECT * FROM nobel
  WHERE yr = 1950

  -- Exercise 3.2: 1962 Literature
  SELECT winner FROM nobel
  WHERE yr = 1962
   AND subject = 'Literature'

  -- Exercise 3.3: Albert Einstein
  SELECT yr, subject FROM nobel
  WHERE winner = 'Albert Einstein'

  -- Exercise 3.4: Recent Peace Prizes
  SELECT winner FROM nobel
  WHERE subject = 'Peace'
    AND yr >= 2000

  -- Exercise 3.5: Literature in the 1980's
  SELECT * FROM nobel
  WHERE subject = 'Literature'
    AND yr BETWEEN 1980 AND 1989

  -- Exercise 3.6: Only Presidents
  SELECT * FROM nobel
  WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

  -- Exercise 3.7: John
  SELECT winner FROM nobel
  WHERE winner LIKE 'John%'

  -- Exercise 3.8: Chemistry and Physics from different years
  SELECT * FROM nobel
  WHERE (subject = 'Physics' AND yr = 1980)
    OR (subject = 'Chemistry' AND yr = 1984)

  -- Exercise 3.9: Exclude Chemists and Medics
  SELECT * FROM nobel
  WHERE subject NOT IN ('Chemistry', 'Medicine')
    AND yr = 1980

  -- Exercise 3.10: Early Medicine, Late Literature
  SELECT * FROM nobel
  WHERE (subject = 'Medicine' AND yr < 1910)
    OR (subject = 'Literature' AND yr >= 2004)

  -- Exercise 3.11: Umlaut[Harder Questions]
  SELECT * FROM nobel
  WHERE winner = 'Peter Grünberg'

  -- Exercise 3.12: Apostrophe[Harder Questions]
  SELECT * FROM nobel
  WHERE winner = 'Eugene O\'Neill'

  -- Exercise 3.13: Knights of the realm[Harder Questions]
  SELECT winner, yr, subject FROM nobel
  WHERE winner LIKE 'Sir%' ORDER BY yr DESC

  -- Exercise 3.14: Chemistry and Physics last[Harder Questions]
  SELECT winner, subject FROM nobel
  WHERE yr=1984
  ORDER BY subject IN ('Physics','Chemistry'), subject, winner

--

-- Tutorial 4: SELECT within SELECT
  -- Exercise 4.1: Bigger than Russia
  SELECT name FROM world
  WHERE population > (SELECT population FROM world
                      WHERE name='Russia')

  -- Exercise 4.2: Richer than UK
  SELECT name FROM world
  WHERE continent = 'Europe'
    AND (gdp/population) > (SELECT gdp/population FROM world
                            WHERE name = 'United Kingdom')

  -- Exercise 4.3: Neighbours of Argentina and Australia
  SELECT name, continent FROM world
  WHERE continent IN (SELECT continent FROM world
                      WHERE name IN ('Argentina', 'Australia'))
  ORDER BY name

  -- Exercise 4.4: Between Canada and Poland
  SELECT name, population FROM world
  WHERE population >(SELECT population FROM world WHERE name = 'Canada')
    AND population < (SELECT population FROM world WHERE name = 'Poland')

  -- Exercise 4.5: Percentages of Germany
  SELECT name,
    CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany')*100), '%')
      AS percentage
  FROM world
  WHERE continent = 'Europe'

  -- Exercise 4.6: Bigger than every country in Europe
  SELECT name FROM world
  WHERE gdp > ALL(SELECT gdp FROM world
                  WHERE gdp > 0
                    AND continent = 'Europe')

  -- Exercise 4.7: Largest in each continent
  SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent = x.continent
          AND area>0)

  -- Exercise 4.8: First country of each continent (alphabetically)
  SELECT continent, name FROM world x
  WHERE name <= ALL(SELECT name FROM world y
                    WHERE y.continent = x.continent)

  -- Exercise 4.9: Difficult Questions That Utilize Techniques Not Covered In Prior Sections
  SELECT name, continent, population FROM world x
  WHERE 25000000 >= ALL(SELECT population FROM world y
                        WHERE y.continent = x.continent)

  -- Exercise 4.10: Difficult Questions That Utilize Techniques Not Covered In Prior Sections
  SELECT name, continent FROM world x
  WHERE population/3 >= ALL(SELECT population FROM world y
                            WHERE y.continent = x.continent
                              AND y.name <> x.name)

--

-- Tutorial 5: SUM and COUNT
  -- Exercise 5.1: Total world population
  SELECT SUM(population) FROM world

  -- Exercise 5.2: List of continents
  SELECT DISTINCT(continent) FROM world

  -- Exercise 5.3: GDP of Africa
  SELECT SUM(gdp) FROM world
  WHERE continent = 'AFRICA'

  -- Exercise 5.4: Count the big countries
  SELECT COUNT(name) FROM world
  WHERE area >= 1000000

  -- Exercise 5.5: Baltic states population
  SELECT SUM(population) FROM world
  WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

  -- Exercise 5.6: Counting the countries of each continent
  SELECT continent, COUNT(name) FROM world
  GROUP BY continent

  -- Exercise 5.7: Counting big countries in each continent
  SELECT continent, COUNT(name) FROM world
  WHERE population > 10000000
  GROUP BY continent

  -- Exercise 5.8: Counting big continents
  SELECT continent FROM world
  GROUP BY continent
  HAVING SUM(population) > 100000000

--

-- Tutorial 6: JOIN
  -- Exercise 6.1: JOIN and UEFA EURO 2012
  SELECT matchid, player FROM goal
  WHERE teamid = 'GER'

  -- Exercise 6.2: JOIN and UEFA EURO 2012
  SELECT id,stadium,team1,team2 FROM game
  WHERE id = 1012

  -- Exercise 6.3: JOIN and UEFA EURO 2012
  SELECT player, teamid, stadium, mdate FROM game
  JOIN goal
    ON id = matchid
  WHERE teamid = 'GER'

  -- Exercise 6.4: JOIN and UEFA EURO 2012
  SELECT team1, team2, player FROM game
  JOIN goal
    ON id = matchid
  WHERE player LIKE 'Mario%'

  -- Exercise 6.5: JOIN and UEFA EURO 2012
  SELECT player, teamid, coach, gtime FROM goal
  JOIN eteam
    ON teamid = id
  WHERE gtime <= 10

  -- Exercise 6.6: JOIN and UEFA EURO 2012
  SELECT mdate, teamname FROM game
  JOIN eteam
    ON team1 = eteam.id
  WHERE coach = 'Fernando Santos'

  -- Exercise 6.7: JOIN and UEFA EURO 2012
  SELECT player FROM game
  JOIN goal
    ON id = matchid
  WHERE stadium = 'National Stadium, Warsaw'

  -- Exercise 6.8: JOIN and UEFA EURO 2012[Harder Questions]
  SELECT DISTINCT player FROM game
  JOIN goal
    ON matchid = id
  WHERE (team1 = 'GER' OR team2='GER')
    AND teamid != 'GER'

  -- Exercise 6.9: JOIN and UEFA EURO 2012[Harder Questions]
  SELECT teamname, COUNT(player) FROM eteam
  JOIN goal
    ON id = teamid
  GROUP BY teamname

  -- Exercise 6.10: JOIN and UEFA EURO 2012[Harder Questions]
  SELECT stadium, COUNT(player) FROM game
  JOIN goal
    ON id = matchid
  GROUP BY stadium
  -- Exercise 6.11: JOIN and UEFA EURO 2012[Harder Questions]
  SELECT matchid, mdate, COUNT(player) FROM goal
  JOIN game
    ON matchid = id
  WHERE team1 = 'POL'
    OR team2 = 'POL'
  GROUP BY matchid, mdate

  -- Exercise 6.12: JOIN and UEFA EURO 2012[Harder Questions]
  SELECT matchid, mdate, COUNT(teamid) FROM goal
  JOIN game
    ON matchid = id
  WHERE (team1 = 'GER' OR team2 = 'GER')
    AND teamid = 'GER'
  GROUP BY matchid, mdate
  -- Exercise 6.13: JOIN and UEFA EURO 2012[Harder Questions]
  SELECT mdate,
    team1, SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) score1,
    team2, SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) score2 FROM game
  LEFT JOIN goal
    ON matchid = id
  GROUP BY mdate, matchid, team1, team2

--
