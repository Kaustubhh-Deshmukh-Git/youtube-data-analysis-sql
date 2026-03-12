-- data_analysis.sql
-- Generating Business Insights from YouTube Engagement Data

-- 1. Get all videos with more than 1 lakh views (Alphabetical order)
SELECT video_id, name, duration_in_secs, published_datetime, no_of_views, channel_id
FROM video
WHERE no_of_views > 100000
ORDER BY name;

-- 2. Get videos from TEDx channel (id=353) with > 50k views
SELECT video_id, name, duration_in_secs, no_of_views
FROM video
WHERE channel_id = 353 AND no_of_views > 50000
ORDER BY no_of_views DESC, name ASC;

-- 3. Top 10 most viewed videos till date
SELECT name, channel_id, no_of_views
FROM video
ORDER BY no_of_views DESC, published_datetime DESC
LIMIT 10;

-- 4. Recent movie trailers (> 1 lakh views)
SELECT name, channel_id, no_of_views, published_datetime
FROM video
WHERE name LIKE '%trailer%' AND no_of_views > 100000
ORDER BY no_of_views DESC, published_datetime DESC;

-- 5. Videos released in the year 2018
SELECT video_id, name, duration_in_secs, no_of_views
FROM video
WHERE strftime('%Y', published_datetime) = '2018'
ORDER BY published_datetime DESC, name ASC;

-- 6. Distinct video IDs for Comedy, Action, Thriller, and Scifi
SELECT DISTINCT video_id
FROM video_genre
WHERE genre_id IN (201, 202, 203, 211)
ORDER BY video_id DESC;

-- 7. Esport videos (> 1L views) released between 2018 and 2020
SELECT name, published_datetime, no_of_views
FROM video
WHERE name LIKE '%esport%' 
  AND no_of_views > 100000 
  AND strftime('%Y', published_datetime) BETWEEN '2018' AND '2020'
ORDER BY no_of_views DESC, published_datetime DESC;

-- 8. Total number of channels
SELECT COUNT(*) AS channels_count
FROM channel;

-- 9. Highest and least number of views
SELECT MAX(no_of_views) AS highest_number_of_views, 
       MIN(no_of_views) AS least_number_of_views
FROM video;

-- 10. Average views for "Single Shot" Channel (id = 373)
SELECT AVG(no_of_views) AS avg_views
FROM video
WHERE channel_id = 373;

-- 11. Total count of premium users
SELECT COUNT(*) AS premium_users_count
FROM user
WHERE premium_membership = 1;

-- 12. Number of male and female premium users
SELECT gender, COUNT(*) AS total_users
FROM user
WHERE premium_membership = 1
GROUP BY gender;