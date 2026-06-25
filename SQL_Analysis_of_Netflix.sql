CREATE TABLE Netflix (
    Title_ID VARCHAR(20) PRIMARY KEY,
    Title VARCHAR(255),
    Type VARCHAR(20),
    Country VARCHAR(100),
    Genre VARCHAR(100),
    Rating VARCHAR(20),
    Release_Year INT,
    Date_Added DATE,
    Duration_Minutes INT,
    IMDb_Rating DECIMAL(3,1)
);




  SELECT *FROM Netflix
LIMIT 10;



SELECT COUNT(*)
FROM Netflix;



-- Movies vs TV Shows

SELECT Type,
COUNT(*) AS Total_Content
FROM Netflix
GROUP BY Type;




-- Unique Countries

SELECT COUNT(DISTINCT Country) AS Total_Countries
FROM Netflix;



-- Unique Genres

SELECT COUNT(DISTINCT Genre) AS Total_Genres
FROM Netflix;



-- COUNTRY ANALYSIS

SELECT Country,
COUNT(*) AS Content_Count
FROM Netflix
GROUP BY Country
ORDER BY Content_Count DESC
LIMIT 10;



-- Country Wise Average Rating

SELECT Country,
ROUND(AVG(IMDb_Rating),2) AS Avg_Rating
FROM Netflix
GROUP BY Country
ORDER BY Avg_Rating DESC;


-- Country Wise Movies

SELECT Country,
COUNT(*) AS Movies
FROM Netflix
WHERE Type='Movie'
GROUP BY Country
ORDER BY Movies DESC;




-- GENRE ANALYSIS

SELECT Genre,
COUNT(*) AS Total_Content
FROM Netflix
GROUP BY Genre
ORDER BY Total_Content DESC;




-- Genre Wise Average Rating


SELECT Genre,
ROUND(AVG(IMDb_Rating),2) AS Avg_Rating
FROM Netflix
GROUP BY Genre
ORDER BY Avg_Rating DESC;




-- Genre Wise Duration

SELECT Genre,
ROUND(AVG(Duration_Minutes),2) AS Avg_Duration
FROM Netflix
GROUP BY Genre;
