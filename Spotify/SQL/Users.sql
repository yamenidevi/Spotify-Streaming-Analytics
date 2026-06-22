CREATE TABLE Users (
    User_ID INT PRIMARY KEY,
    Country VARCHAR(50),
    Subscription_Type VARCHAR(20),
    Join_Date DATE
);
---Total Users---
SELECT COUNT(*) AS Total_Users
FROM Users;
---Premium vs Free Users---
SELECT
    Subscription_Type,
    COUNT(*) AS Users_Count
FROM Users
GROUP BY Subscription_Type;
---Country-wise Users---
SELECT
    Country,
    COUNT(*) AS Total_Users
FROM Users
GROUP BY Country
ORDER BY Total_Users DESC;
---Top 5 Countries by Listening Minutes---
SELECT u.Country,
SUM(st.Minutes_Listened) AS Minutes
FROM Users u
JOIN Streams st ON u.User_ID=st.User_ID
GROUP BY u.Country
ORDER BY Minutes DESC
LIMIT 5;
---Premium vs Free Streams---
SELECT u.Subscription_Type,
COUNT(*) AS Streams
FROM Users u
JOIN Streams s ON u.User_ID=s.User_ID
GROUP BY u.Subscription_Type;