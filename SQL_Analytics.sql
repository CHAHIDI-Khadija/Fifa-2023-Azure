--Total Players by Nationality
SELECT Nationality, COUNT(*) AS TotalPlayers
FROM player_dim
GROUP BY Nationality
ORDER BY TotalPlayers DESC;

--Average Age of Players by Club
SELECT c.Club_Name, AVG(p.Age) AS AverageAge
FROM fact_player_stat ps
JOIN player_dim p ON ps.KnownAs = p.KnownAs
JOIN club_dim c ON ps.ClubID = c.ClubID
GROUP BY c.Club_Name
ORDER BY AverageAge DESC;

--Top 10 Players by Overall Rating
SELECT Top 10 KnownAs, Overall
FROM fact_player_stat
ORDER BY Overall DESC

--Average Player Age Over Time
SELECT YEAR(f.JoinedOn) AS Year, AVG(d.Age) AS AverageAge
FROM fact_player_stat f
JOIN player_dim d on d.KnownAs=f.KnownAs
GROUP BY YEAR(JoinedOn)
ORDER BY Year;

--Comparison of Players by Nationality:

SELECT p.Nationality, AVG(ps.Overall) AS AverageOverall
FROM fact_player_stat ps
JOIN player_dim p ON ps.KnownAs = p.KnownAs
GROUP BY p.Nationality
ORDER BY AverageOverall DESC;




