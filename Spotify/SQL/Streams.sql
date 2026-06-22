CREATE TABLE Streams (
    Stream_ID INT PRIMARY KEY,
    User_ID INT,
    Song_ID INT,
    Stream_Date DATE,
    Minutes_Listened DECIMAL(5,2),
    Device VARCHAR(20),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Song_ID) REFERENCES Songs(Song_ID)
);
select * from Streams;
---Total Streams---
SELECT COUNT(*) AS Total_Streams
FROM Streams;
---Device Usage Analysis---
SELECT
    Device,
    COUNT(*) AS Total_Streams
FROM Streams
GROUP BY Device
ORDER BY Total_Streams DESC;
---Monthly Listening Trend---
SELECT
    extract(MONTH from Stream_Date) AS Month_No,
    COUNT(*) AS Streams
FROM Streams
GROUP BY extract(MONTH from Stream_Date)
ORDER BY Month_No;
---Most Streamed Song---
SELECT s.Song_Name, COUNT(*) AS Streams
FROM Streams st
JOIN Songs s ON st.Song_ID = s.Song_ID
GROUP BY s.Song_Name
ORDER BY Streams DESC
LIMIT 1;
---Streams by Device---
SELECT Device, COUNT(*) AS Streams
FROM Streams
GROUP BY Device;
---Favorite Artist per User---
SELECT User_ID,
Song_ID,
COUNT(*) AS Streams
FROM Streams
GROUP BY User_ID, Song_ID;
---Most Active User---
SELECT User_ID, COUNT(*) AS Streams
FROM Streams
GROUP BY User_ID
ORDER BY Streams DESC
LIMIT 1;
---Total Listening Minutes---
SELECT SUM(Minutes_Listened) AS Total_Minutes
FROM Streams;
---Average Listening Time---
SELECT
    ROUND(AVG(Minutes_Listened),2) AS Avg_Listening_Time
FROM Streams;
---Top Songs by Listening Time---
SELECT
    s.Song_Name,
    SUM(st.Minutes_Listened) AS Total_Minutes
FROM Streams st
JOIN Songs s
ON st.Song_ID = s.Song_ID
GROUP BY s.Song_Name
ORDER BY Total_Minutes DESC;
---Top Device by Listening Minutes---
SELECT Device,
SUM(Minutes_Listened) AS Minutes
FROM Streams
GROUP BY Device
ORDER BY Minutes DESC;