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

-- Tutorial 7: More JOIN
  -- Exercise 7.1: 1962 movies
  SELECT id, title FROM movie
  WHERE yr = 1962

  -- Exercise 7.2: When was Citizen Kane released?
  SELECT yr FROM movie
  WHERE title = 'Citizen Kane'

  -- Exercise 7.3: Star Trek movies
  SELECT id, title, yr FROM movie
  WHERE title LIKE 'Star Trek%'
  ORDER BY yr

  -- Exercise 7.4: id for actor Glenn Close
  SELECT id FROM actor
  WHERE name = 'Glenn Close'

  -- Exercise 7.5: id for Casablanca
  SELECT id FROM movie
  WHERE title = 'Casablanca'

  -- Exercise 7.6: Cast list for Casablanca
  SELECT name FROM movie
  JOIN casting
    ON movie.id = movieid
  JOIN actor
    ON actorid = actor.id
  WHERE title = 'Casablanca'

  -- Exercise 7.7: Alien cast list
  SELECT name FROM movie
  JOIN casting
    ON movie.id = movieid
  JOIN actor
    ON actorid = actor.id
  WHERE title = 'Alien'

  -- Exercise 7.8: Harrison Ford movies
  SELECT title FROM movie
  JOIN casting
    ON movie.id = movieid
  JOIN actor
    ON actorid = actor.id
  WHERE name = 'Harrison Ford'

  -- Exercise 7.9: Harrison Ford as a supporting actor
  SELECT title FROM movie
  JOIN casting
    ON movie.id = movieid
  JOIN actor
    ON actorid = actor.id
  WHERE name = 'Harrison Ford'
    AND ord != 1

  -- Exercise 7.10: Lead actors in 1962 movies
  SELECT title, name FROM movie
  JOIN casting
    ON movie.id = movieid
  JOIN actor
    ON actorid = actor.id
  WHERE yr = 1962
    AND ord = 1

  -- Exercise 7.11: Busy years for Rock Hudson[Harder Questions]
  SELECT yr, COUNT(title) FROM movie
  JOIN casting
    ON movie.id = movieid
  JOIN actor
    ON actorid = actor.id
  WHERE name = 'Rock Hudson'
  GROUP BY yr
  HAVING COUNT(title) > 2

  -- Exercise 7.12: Lead actor in Julie Andrews movies[Harder Questions]
  SELECT title, name FROM movie
  JOIN casting
    ON movie.id = movieid
  JOIN actor
    ON actorid = actor.id
  WHERE movie.id IN
    (SELECT movieid FROM casting
    WHERE actorid IN
      (SELECT actor.id FROM actor
      WHERE name = 'Julie Andrews'))
  AND ord = 1

  -- Exercise 7.13: Actors with 15 leading roles[Harder Questions]
  SELECT name FROM actor
  JOIN casting
    ON id = actorid
  WHERE ord = 1
  GROUP BY name
  HAVING COUNT(name) >= 15

  -- Exercise 7.14: 1978 movies[Harder Questions]
  Select title, COUNT(actorid) AS num_actors FROM movie
  JOIN casting
    ON id = movieid
  WHERE yr = 1978
  GROUP BY title
  ORDER BY num_actors DESC, title

  -- Exercise 7.15: Art Garfunkel[Harder Questions]
  SELECT name FROM movie
  JOIN casting
    ON movie.id = movieid
  JOIN actor
    ON actorid = actor.id
  WHERE movie.id IN
    (SELECT movieid FROM casting
    WHERE actorid IN
      (SELECT actor.id FROM actor
      WHERE name = 'Art Garfunkel'))
  AND name != 'Art Garfunkel'

--

-- Tutorial 8: Using Null
  -- Exercise 8.1: NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN
  SELECT teacher.name FROM teacher
  LEFT JOIN dept
    ON teacher.dept = dept.id
  WHERE dept.name IS NULL

  -- Exercise 8.2: NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN
  SELECT teacher.name, dept.name FROM teacher
  INNER JOIN dept
    ON teacher.dept = dept.id

  -- Exercise 8.3: NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN
  SELECT teacher.name, dept.name
  FROM teacher
  LEFT JOIN dept
    ON teacher.dept = dept.id

  -- Exercise 8.4: NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN
  SELECT teacher.name, dept.name
  FROM teacher
  RIGHT JOIN dept
    ON teacher.dept = dept.id

  -- Exercise 8.5: NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN
  SELECT name, COALESCE(mobile, '07986 444 2266') AS mobile FROM teacher

  -- Exercise 8.6: NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN
  SELECT teacher.name, COALESCE(dept.name, 'None')
  FROM teacher
  LEFT JOIN dept
    ON teacher.dept = dept.id

  -- Exercise 8.7: NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN
  SELECT COUNT(name), COUNT(mobile) FROM teacher

  -- Exercise 8.8: NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN
  SELECT dept.name, COUNT(teacher.name)
  FROM teacher
  RIGHT JOIN dept
    ON teacher.dept = dept.id
  GROUP BY dept.name

  -- Exercise 8.9: NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN
  SELECT name, CASE WHEN dept = 1 THEN 'Sci'
                    WHEN dept = 2 THEN 'Sci'
                    ELSE 'Art'
                    END
  FROM teacher

  -- Exercise 8.10: NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN
  SELECT name, CASE WHEN dept = 1 THEN 'Sci'
                    WHEN dept = 2 THEN 'Sci'
                    WHEN dept = 3 THEN 'Art'
                    ELSE 'None'
                    END
  FROM teacher

--

-- Tutorial 8+: NSS Tutorial
  -- Exercise 8+.1: Check out one row
  SELECT A_STRONGLY_AGREE FROM nss
  WHERE question = 'Q01'
    AND institution = 'Edinburgh Napier University'
    AND subject = '(8) Computer Science'

  -- Exercise 8+.2: Calculate how many agree or strongly agree
  SELECT institution, subject FROM nss
  WHERE question = 'Q15'
    AND score >= 100

  -- Exercise 8+.3: Unhappy Computer Students
  SELECT institution, score FROM nss
  WHERE question = 'Q15'
    AND score < 50
    AND subject='(8) Computer Science'

  -- Exercise 8+.4: More Computing or Creative Students?
  SELECT subject, SUM(response) FROM nss
  WHERE question = 'Q22'
    AND (subject = '(8) Computer Science'
    OR subject = '(H) Creative Arts and Design')
  GROUP BY subject

  -- Exercise 8+.5: Strongly Agree Numbers
  SELECT subject, SUM(response*A_STRONGLY_AGREE/100) FROM nss
  WHERE question = 'Q22'
    AND (subject = '(8) Computer Science'
    OR subject = '(H) Creative Arts and Design')
  GROUP BY subject

  -- Exercise 8+.6: Strongly Agree, Percentage
  SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE/100)/SUM(response)*100) FROM nss
  WHERE question = 'Q22'
    AND (subject = '(8) Computer Science'
    OR subject = '(H) Creative Arts and Design')
  GROUP BY subject

  -- Exercise 8+.7: Scores for Institutions in Manchester
  SELECT institution, ROUND(SUM(response*score/100)/SUM(response)*100) FROM nss
  WHERE question = 'Q22'
    AND institution LIKE '%Manchester%'
  GROUP BY institution

  -- Exercise 8+.8: Number of Computing Students in Manchester
  SELECT institution, sum(sample),
    (SELECT sample FROM nss y
     WHERE subject = '(8) Computer Science'
       AND x.institution = y.institution
       AND question = 'Q01') AS comp
  FROM nss x
  WHERE question = 'Q01'
    AND (institution LIKE '%Manchester%')
  GROUP BY institution

--

-- Tutorial 9-: Window functions
  -- Exercise 9-.1: Warming up
  SELECT lastName, party, votes FROM ge
  WHERE constituency = 'S14000024' AND yr = 2017
  ORDER BY votes DESC

  -- Exercise 9-.2: Who won?
  SELECT party, votes,
    RANK() OVER (ORDER BY votes DESC) as posn
  FROM ge
  WHERE constituency = 'S14000024' AND yr = 2017
  ORDER BY party

  -- Exercise 9-.3: PARTITION BY
  SELECT yr, party, votes,
    RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
  FROM ge
  WHERE constituency = 'S14000021'
  ORDER BY party,yr

  -- Exercise 9-.4: Edinburgh Constituency
  SELECT constituency, party, votes,
    RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
  FROM ge
  WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
    AND yr  = 2017
  ORDER BY posn, constituency

  -- Exercise 9-.5: Winners Only
  SELECT constituency, party FROM ge x
  WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
    AND yr  = 2017
    AND votes >= ALL(SELECT votes FROM ge y
                     WHERE x.constituency = y.constituency
                       AND y.yr = 2017)
  ORDER BY constituency, votes DESC

  -- Exercise 9-.6: Scottish seats
  SELECT party, COUNT(*) FROM ge x
  WHERE constituency LIKE 'S%'
    AND yr  = 2017
    AND votes >= ALL(SELECT votes FROM ge y
                     WHERE x.constituency = y.constituency
                       AND y.yr = 2017)
  GROUP BY party

--

-- Tutorial 9+: Window LAG
  -- Exercise 9+.1: Introducing the covid table
  SELECT name, DAY(whn), confirmed, deaths, recovered FROM covid
  WHERE name = 'Spain'
    AND MONTH(whn) = 3
  ORDER BY whn

  -- Exercise 9+.2: Introducing the LAG function
  SELECT name, DAY(whn), confirmed,
    LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) AS dbf
  FROM covid
  WHERE name = 'Italy'
    AND MONTH(whn) = 3
  ORDER BY whn

  -- Exercise 9+.3: Number of new cases
  SELECT name, DAY(whn),
    confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) AS new FROM covid
  WHERE name = 'Italy'
    AND MONTH(whn) = 3
  ORDER BY whn

  -- Exercise 9+.4: Weekly changes
  SELECT name, DATE_FORMAT(whn,'%Y-%m-%d'),
    confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) AS new
  FROM covid
  WHERE name = 'Italy'
    AND WEEKDAY(whn) = 0
  ORDER BY whn

  -- Exercise 9+.5: LAG using a JOIN
  SELECT tw.name, DATE_FORMAT(tw.whn,'%Y-%m-%d'), tw.confirmed - lw.confirmed FROM covid tw
  LEFT JOIN covid lw ON
    DATE_ADD(lw.whn, INTERVAL 1 WEEK) = tw.whn
    AND tw.name = lw.name
  WHERE tw.name = 'Italy'
  AND WEEKDAY(tw.whn) = 0.
  ORDER BY tw.whn

  -- Exercise 9+.6: RANK()
  SELECT name, confirmed,
    RANK() OVER (ORDER BY confirmed DESC) rc,
    deaths,
    RANK() OVER (ORDER BY deaths DESC) rc
  FROM covid
  WHERE whn = '2020-04-20'
  ORDER BY confirmed DESC

  -- Exercise 9+.7: Infection rate
  SELECT world.name,
    ROUND(100000*confirmed/population, 0),
    RANK() OVER (ORDER BY confirmed/population ASC) rc
  FROM covid JOIN world ON covid.name = world.name
  WHERE whn = '2020-04-20'
    AND population > 10000000
  ORDER BY population DESC


--

-- Tutorial 9: Self JOIN
  -- Exercise 9.1:
  SELECT COUNT(*) FROM stops

  -- Exercise 9.2:
  SELECT id FROM stops
  WHERE name = 'Craiglockhart'

  -- Exercise 9.3:
  SELECT id, name FROM stops
  JOIN route
    ON id = stop
  WHERE num = '4'
    AND company = 'LTR'

  -- Exercise 9.4:
  SELECT company, num, COUNT(*)
  FROM route WHERE stop=149 OR stop=53
  GROUP BY company, num
  HAVING COUNT(*) = 2

  -- Exercise 9.5:
  SELECT a.company, a.num, a.stop, b.stop
  FROM route a JOIN route b ON
    (a.company=b.company AND a.num=b.num)
  WHERE a.stop = 53
    AND b.stop = 149

  -- Exercise 9.6:
  SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a JOIN route b ON
    (a.company=b.company AND a.num=b.num)
    JOIN stops stopa ON (a.stop=stopa.id)
    JOIN stops stopb ON (b.stop=stopb.id)
  WHERE stopa.name='Craiglockhart'
    AND stopb.name = 'London Road'

  -- Exercise 9.7:
  SELECT DISTINCT a.company, a.num
  FROM route a JOIN route b ON
    (a.company=b.company AND a.num=b.num)
  WHERE a.stop = 115
    AND b.stop = 137

  -- Exercise 9.8:
  SELECT a.company, a.num
  FROM route a JOIN route b ON
    (a.company=b.company AND a.num=b.num)
    JOIN stops stopa ON (a.stop=stopa.id)
    JOIN stops stopb ON (b.stop=stopb.id)
  WHERE stopa.name='Craiglockhart'
    AND stopb.name = 'Tollcross'

  -- Exercise 9.9:
  SELECT stopb.name, a.company, a.num
  FROM route a JOIN route b ON
    (a.company = b.company AND a.num = b.num)
    JOIN stops stopa ON (a.stop = stopa.id)
    JOIN stops stopb ON (b.stop = stopb.id)
  WHERE stopa.name = 'Craiglockhart'

--
