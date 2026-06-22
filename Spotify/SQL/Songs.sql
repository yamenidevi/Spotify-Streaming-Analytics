CREATE TABLE Songs (
    Song_ID INT PRIMARY KEY,
    Song_Name VARCHAR(150),
    Artist_ID INT,
	Duration VARCHAR(10),
    Release_Year INT,
    FOREIGN KEY (Artist_ID) REFERENCES Artists(Artist_ID)
);
select*from Songs;
---Top 10 Most Streamed Songs---
SELECT
    s.Song_Name,
    COUNT(*) AS Total_Streams
FROM Streams st
JOIN Songs s
ON st.Song_ID = s.Song_ID
GROUP BY s.Song_Name
ORDER BY Total_Streams DESC
LIMIT 10;
---Songs Released per Year---
SELECT Release_Year,
COUNT(*) AS Songs
FROM Songs
GROUP BY Release_Year
ORDER BY Release_Year;
---Longest Song---
SELECT Song_Name, Duration
FROM Songs
ORDER BY Duration DESC
LIMIT 1;
---Shortest Song---
SELECT Song_Name, Duration
FROM Songs
ORDER BY Duration
LIMIT 1;