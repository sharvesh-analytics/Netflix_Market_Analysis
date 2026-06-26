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


-- RATING ANALYSIS

SELECT Rating,
COUNT(*) AS Total_Content
FROM Netflix
GROUP BY Rating
ORDER BY Total_Content DESC;


SELECT *
FROM Netflix
ORDER BY IMDb_Rating DESC
LIMIT 10;


SELECT *
FROM Netflix
ORDER BY IMDb_Rating ASC
LIMIT 10;



-- RELEASE YEAR ANALYSIS

SELECT Release_Year,
COUNT(*) AS Total_Content
FROM Netflix
GROUP BY Release_Year
ORDER BY Release_Year;


SELECT Release_Year,
COUNT(*) AS Total_Content
FROM Netflix
GROUP BY Release_Year
ORDER BY Total_Content DESC
LIMIT 1;



-- MOVIES VS TV SHOWS

SELECT
Type,
COUNT(*)*100.0/
(SELECT COUNT(*) FROM Netflix)
AS Percentage
FROM Netflix
GROUP BY Type;


-- ADVANCED ANALYSIS

SELECT Country,
Genre,
COUNT(*) AS Total_Content
FROM Netflix
GROUP BY Country,Genre
ORDER BY Country,Total_Content DESC;


SELECT Country,
Genre,
COUNT(*) AS Content_Count
FROM Netflix
GROUP BY Country,Genre
ORDER BY Content_Count DESC;



-- WINDOW FUNCTIONS

SELECT
Title,
IMDb_Rating,
RANK() OVER(
ORDER BY IMDb_Rating DESC
) AS Ranking
FROM Netflix;


SELECT
Title,
IMDb_Rating,
DENSE_RANK() OVER(
ORDER BY IMDb_Rating DESC
) AS Ranking
FROM Netflix;

SELECT
Title,
ROW_NUMBER() OVER(
ORDER BY IMDb_Rating DESC
) AS Row_No
FROM Netflix;


-- CASE WHEN

SELECT
Title,
IMDb_Rating,
CASE
WHEN IMDb_Rating >= 8 THEN 'Excellent'
WHEN IMDb_Rating >= 7 THEN 'Good'
ELSE 'Average'
END AS Category
FROM Netflix;



-- SUBQUERY

SELECT *
FROM Netflix
WHERE IMDb_Rating >
(
SELECT AVG(IMDb_Rating)
FROM Netflix
);



-- HAVING

SELECT Genre,
COUNT(*) AS Total_Content
FROM Netflix
GROUP BY Genre
HAVING COUNT(*) > 100;








