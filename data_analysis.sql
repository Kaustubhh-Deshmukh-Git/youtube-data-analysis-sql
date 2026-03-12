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



-- 1. Total number of users
SELECT COUNT(*) AS users_count 
FROM user;

-- 2. Total number of distinct countries
SELECT COUNT(DISTINCT country) AS countries_count 
FROM user;

-- 3. Number of videos uploaded by each channel
SELECT channel_id, COUNT(video_id) AS videos_count
FROM video
GROUP BY channel_id;

-- 4. Channels with at least 50 videos
SELECT channel_id
FROM video
GROUP BY channel_id
HAVING COUNT(video_id) >= 50
ORDER BY channel_id ASC;

-- 5. Views represented in thousands
SELECT video_id, name, (no_of_views / 1000.0) AS no_of_views_in_thousands
FROM video
ORDER BY no_of_views_in_thousands DESC, name ASC;

-- 6. Sum of durations per channel in hours
SELECT channel_id, SUM(duration_in_secs) / 3600.0 AS no_of_hours
FROM video
GROUP BY channel_id
ORDER BY no_of_hours DESC;

-- 7. Categorize performance for "Motivation grid" (ID 350)
SELECT name, no_of_views,
    CASE 
        WHEN no_of_views <= 10000 THEN 'poor'
        WHEN no_of_views <= 100000 THEN 'average'
        ELSE 'good'
    END AS category
FROM video
WHERE channel_id = 350
ORDER BY published_datetime ASC;

-- 8. Number of videos released in each year
SELECT CAST(strftime('%Y', published_datetime) AS INT) AS year, 
       COUNT(video_id) AS no_of_videos
FROM video
GROUP BY year
ORDER BY year ASC;

-- 9. Marvel channel (ID 351) monthly subscribers in 2020
SELECT CAST(strftime('%m', subscribed_datetime) AS INT) AS month_of_year,
       COUNT(user_id) AS no_of_subscribers
FROM channel_user
WHERE channel_id = 351 AND strftime('%Y', subscribed_datetime) = '2020'
GROUP BY month_of_year
ORDER BY month_of_year ASC;

-- 10. Reactions per hour in 2020
SELECT CAST(strftime('%H', reacted_at) AS INT) AS hour_of_day,
       COUNT(*) AS no_of_reactions
FROM user_likes
WHERE strftime('%Y', reacted_at) = '2020'
GROUP BY hour_of_day
ORDER BY hour_of_day ASC;

-- 11. Channels with AI/ML or Robotics videos (2018-2021)
SELECT DISTINCT channel_id
FROM video
WHERE (name LIKE '%AI/ML%' OR name LIKE '%Robotics%')
  AND strftime('%Y', published_datetime) BETWEEN '2018' AND '2021'
ORDER BY channel_id ASC;

-- 12. Channels with 20+ tech-specific videos (2018-2021)
SELECT channel_id
FROM video
WHERE (name LIKE '%AI/ML%' OR name LIKE '%Cyber Security%' 
       OR name LIKE '%Data Science%' OR name LIKE '%Robotics%')
  AND strftime('%Y', published_datetime) BETWEEN '2018' AND '2021'
GROUP BY channel_id
HAVING COUNT(video_id) >= 20
ORDER BY channel_id ASC;