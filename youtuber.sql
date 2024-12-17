SELECT * FROM youtubers;

DESCRIBE youtubers;

ALTER TABLE youtubers RENAME COLUMN `video views` TO video_views;

ALTER TABLE youtubers
DROP COLUMN Latitude,
DROP COLUMN Longitude;


SELECT COUNT(*) AS total_rows,
       COUNT(subscribers) AS non_null_subscribers,
       COUNT(video_views) AS non_null_video_views,
       COUNT(uploads) AS non_null_uploads
FROM youtubers;

-- top 10 youtubers by subscribers
SELECT Youtuber, subscribers FROM youtubers
ORDER BY subscribers DESC LIMIT 10;


-- SELECT category, SUM(video_views) AS total_views
-- FROM youtubers
-- GROUP BY category
-- ORDER BY total_views DESC;

SELECT Youtuber, 
       (highest_yearly_earnings / video_views) AS earnings_per_view
FROM youtubers 
ORDER BY earnings_per_view DESC LIMIT 20;


-- Top 10 youtubers analysis 
SELECT Youtuber, highest_yearly_earnings
FROM youtubers
ORDER BY highest_yearly_earnings DESC
LIMIT 10;

-- Earning Analysis
-- Highest monthly earnings
SELECT MAX(highest_monthly_earnings) AS max_highest_monthly_earnings,
       MIN(highest_monthly_earnings) AS min_highest_monthly_earnings
FROM youtubers;

-- Highest yearly earnings
SELECT MAX(highest_yearly_earnings) AS max_highest_yearly_earnings,
       MIN(highest_yearly_earnings) AS min_highest_yearly_earnings
FROM youtubers;

-- Country-Based Analysis
SELECT Country, COUNT(*) AS total_youtubers
FROM youtubers
GROUP BY Country
ORDER BY total_youtubers DESC;


-- Category Analysis
SELECT category, SUM(video_views) AS total_video_views
FROM youtubers
GROUP BY category
ORDER BY total_video_views DESC
LIMIT 5;

-- Growth Analysis Over Time 
SELECT created_year, COUNT(*) AS youtuber_count
FROM youtubers
GROUP BY created_year
ORDER BY created_year ASC;

-- Top 10 YouTubers by Average Earnings per Subscriber 
SELECT Youtuber, 
       highest_yearly_earnings / NULLIF(subscribers, 0) AS average_earnings_per_subscriber
FROM youtubers
ORDER BY average_earnings_per_subscriber DESC
LIMIT 10;


-- To check Min and max year for date table in Power BI
SELECT 
    MIN(created_year) AS MinYear,
    MAX(created_year) AS MaxYear
FROM 
    youtubers;



