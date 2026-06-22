CREATE TABLE Artists (
    Artist_ID INT PRIMARY KEY,
    Artist_Name VARCHAR(100),
    Genre VARCHAR(50)
);
select * from Artists;
---Top Artists---
SELECT
    a.Artist_Name,
    COUNT(*) AS Streams
FROM Streams st
JOIN Songs s
ON st.Song_ID = s.Song_ID
JOIN Artists a
ON s.Artist_ID = a.Artist_ID
GROUP BY a.Artist_Name
ORDER BY Streams DESC;
---Genre Popularity---
SELECT
    a.Genre,
    COUNT(*) AS Total_Streams
FROM Streams st
JOIN Songs s
ON st.Song_ID = s.Song_ID
JOIN Artists a
ON s.Artist_ID = a.Artist_ID
GROUP BY a.Genre
ORDER BY Total_Streams DESC;
---Top Artist in Each Genre---
SELECT Genre, Artist_Name
FROM Artists;
---Artist Popularity Rank---
SELECT a.Artist_Name,
COUNT(*) AS Streams,
RANK() OVER(ORDER BY COUNT(*) DESC) AS Rank
FROM Streams st
JOIN Songs s ON st.Song_ID=s.Song_ID
JOIN Artists a ON s.Artist_ID=a.Artist_ID
GROUP BY a.Artist_Name;