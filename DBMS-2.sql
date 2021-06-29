CREATE DATABASE SPORTS;
USE SPORTS;

CREATE TABLE GAME(ID INT PRIMARY KEY IDENTITY(1001,1),
				  MDATE DATE NOT NULL DEFAULT '8-JUNE-2012',
				  STADIUM VARCHAR(50) NOT NULL,
				  TEAM1 VARCHAR(30) FOREIGN KEY REFERENCES ETEAM(ID),
				  TEAM2 VARCHAR(30) FOREIGN KEY REFERENCES ETEAM(ID));

CREATE TABLE GOAL (MATCHID INT FOREIGN KEY REFERENCES GAME(ID),
				   TEAMID VARCHAR(30) FOREIGN KEY REFERENCES ETEAM(ID),
				   PLAYER VARCHAR(50) NOT NULL,
				   GTIME INT NOT NULL,
				   PRIMARY KEY(MATCHID,GTIME));

CREATE TABLE ETEAM (ID VARCHAR(30) PRIMARY KEY,
					TEAMNAME VARCHAR(50) NOT NULL,
					COACH VARCHAR(50) NOT NULL);

INSERT INTO ETEAM VALUES('POL','POLAND','FRANCISZEK SMUDA'),
						('RUS','RUSSIA','DICK ADVOCAAT'),
						('CZE','CZECH REPUBLIC','MICHAL BILEK'),
						('GRE','GREECE','FERNANDO SANTOS');

DROP TABLE GAME
DROP TABLE ETEAM
DROP TABLE GOAL

INSERT INTO GAME (MDATE,STADIUM,TEAM1,TEAM2) 
VALUES('8-JUNE-2012','NATIONAL STADIUM, WARSAW','POL','GRE'),
		('8-JUNE-2012','STADION MIEJSKI (WROCLAW)','RUS','CZE'),
		('8-JUNE-2012','STADION MIEJSKI (WROCLAW)','GRE','CZE'),
		('8-JUNE-2012','NATIONAL STADIUM, WARSAW','POL','RUS');

INSERT INTO GOAL VALUES(1001,'POL','ROBET LEWANDOWSKI',17),
						(1001,'GRE','DIMITRIS SALPINGGIDIS',51),
						(1002,'RUS','ALAN DZAGOEV',15),
						(1002,'RUS','ROMAN PAVLYUCHENKO',17);

SELECT *FROM GAME;
SELECT *FROM GOAL;
SELECT *FROM ETEAM;

--QUERY-1 = Write a query that shows the goal scored by a player with the last name Bender;.
SELECT matchid, player FROM goal
WHERE teamid = 'GRE';

--QUERY-2 = Write a query for that shows teams were playing in the match.
SELECT TEAMNAME FROM ETEAM; 												

--QUERY3 = Write code that shows the player (from the goal) and stadium name (from the game table) for every goal scored.
SELECT O.PLAYER, G.STADIUM FROM GOAL AS O INNER JOIN GAME AS G ON O.MATCHID = G.ID;

--QUERY4 = Show the team1, team2 and player for every goal scored by a player called Mario player LIKE Mario%;
SELECT G.TEAM1,G.TEAM2,O.PLAYER FROM GAME G INNER JOIN GOAL O ON O.MATCHID = G.ID AND PLAYER LIKE 'Mario%';

--QUERY5 = Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime is less or equal to 10.
SELECT O.PLAYER, O.GTIME, O.TEAMID, E.COACH FROM GOAL AS O INNER JOIN ETEAM AS E ON O.TEAMID = E.ID WHERE O.GTIME <= 10;

--QUERY6 = List the dates of the matches and the name of the team in which Fernando Santos was the team1 coach.
SELECT G.MDATE, G.TEAM1, E.COACH FROM GAME G INNER JOIN ETEAM E ON G.TEAM1 = E.ID WHERE E.COACH = 'Fernando Santos';

--QUERY7 = List the player for every goal scored in a game where the stadium was National Stadium, Warsaw;
SELECT O.PLAYER, G.STADIUM FROM GAME G INNER JOIN GOAL O ON O.MATCHID = G.ID WHERE G.STADIUM = 'National Stadium, Warsaw';

--QUERY8 = Show all goals scored in the Germany-Greece quarterfinal.

--EXPECTED QUERY 1
SELECT *FROM GOAL WHERE TEAMID = 'GRE';
--EXPECTED QUERY 2
SELECT DISTINCT player
FROM goal INNER JOIN game ON matchid = id
WHERE (team1 = 'GRE' OR team2 = 'GRE') AND teamid != 'GRE'

--QUERY9 = Show teamname and the total number of goals scored
SELECT TEAMNAME,COUNT(TEAMID) AS GOALS
FROM eteam INNER JOIN goal ON ID=teamid
GROUP BY TEAMNAME;

--QUERY10 = For every match involving POL, show the matchid, date and the number of goals scored.
SELECT ID,MDATE,COUNT(MATCHID) AS GOALS
FROM goal INNER JOIN GAME ON matchid=id
WHERE team1='POL' OR team2='POL'
GROUP BY GAME.ID,GAME.MDATE