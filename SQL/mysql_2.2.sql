-- CASE-1  Que-1   Write an SQL query to report the first login date for each player. Return the result table in any order.

CREATE TABLE Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,
    PRIMARY KEY (player_id, event_date)
);

INSERT INTO Activity (player_id, device_id, event_date, games_played)
VALUES
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-05-02', 6),
    (2, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);

SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;

--Que-2   Write an SQL query to report the device that is first logged in for each player. Return the result table in any order.

SELECT player_id, MIN(device_id) AS first_login FROM Activity GROUP BY player_id;

--Que-3  Write an SQL query to report the device that is first logged in for each player. Return the result table in any order.


CASE -2 

CREATE TABLE Course (
    student VARCHAR(255),
    class VARCHAR(255)
);

INSERT INTO Course (student, class)
VALUES
    ('A', 'Math'),
    ('B', 'English'),
    ('C', 'Math'),
    ('D', 'Biology'),
    ('E', 'Math'),
    ('F', 'Computer'),
    ('G', 'Math'),
    ('H', 'Math'),
    ('I', 'Math');

    SELECT class from course GROUP by class HAVING COUNT(class)>1;

-- CASE - 3 Write an SQL query to report the name, population, and area of the big countries.

    CREATE TABLE World (
    name VARCHAR(255) PRIMARY KEY,
    continent VARCHAR(255),
    area INT,
    population INT,
    gdp INT
);

INSERT INTO World (name, continent, area, population, gdp)
VALUES
    ('Afghanistan', 'Asia', 652230, 25500100, 20343000000),
    ('Albania', 'Europe', 28748, 2831741, 12960000000),
    ('Algeria', 'Africa', 2381741, 37100000, 188681000000),
    ('Andorra', 'Europe', 468, 78115, 3712000000),
    ('Angola', 'Africa', 1246700, 20609294, 100990000000);

    SELECT name, population, area FROM World WHERE area >= 3000000 OR population >= 25000000;