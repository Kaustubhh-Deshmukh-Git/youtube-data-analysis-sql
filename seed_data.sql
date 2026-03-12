-- seed_data.sql
-- Populating the YouTube Analysis Database

-- 1. Users
INSERT INTO user (user_id, name, gender, age, country, premium_membership) VALUES
(2000, 'John White', 'M', 63, 'AUSTRALIA', 1),
(2001, 'John Andrews', 'M', 67, 'AUSTRALIA', 1),
(2002, 'April Robinson', 'F', 60, 'SRILANKA', 1),
(2003, 'Kathy Ryan', 'F', 81, 'SRILANKA', 0),
(2004, 'Megan Bradshaw', 'F', 53, 'AUSTRALIA', 1);

-- 2. Channels
INSERT INTO channel (channel_id, name, owner_id, created_datetime) VALUES
(350, 'Motivation grid', 1011, '2014-10-05 17:32:00'),
(353, 'Tedx', 1013, '2016-10-05 17:32:00'),
(362, 'Marques Brownlee', 1012, '2018-09-10 12:32:00'),
(373, 'Single Shot', 2828, '2018-11-20 21:38:00');

-- 3. Videos
INSERT INTO video (video_id, name, duration_in_secs, published_datetime, no_of_views, channel_id) VALUES
(1001, 'Apple iPhone X Review: The Best Yet!', 4556, '2021-01-19 20:12:00', 140012, 362),
(1002, 'Victoria Beckham Fashion Advice', 836, '2021-01-19 20:12:00', 75609, 353),
(1003, '4 Reasons I Don''t Like Thanksgiving', 1751, '2017-05-05 17:32:00', 279351, 350);

-- 4. Genres
INSERT INTO genre (genre_id, genre_type) VALUES
(201, 'ACTION'),
(202, 'COMEDY'),
(207, 'GAMING'),
(211, 'SCI-FI');

-- 5. Video-Genre Mappings
INSERT INTO video_genre (video_id, genre_id) VALUES
(1001, 211), -- iPhone review as Sci-Fi/Tech
(1002, 202); -- Fashion advice as Comedy/Lifestyle

-- 6. User Reactions (Likes/Dislikes)
INSERT INTO user_likes (user_id, video_id, reaction_type, reacted_at) VALUES
(2002, 1001, 'LIKE', '2012-04-10 16:53:00'),
(2118, 1001, 'LIKE', '2012-04-24 08:32:00');

-- 7. Subscriptions
INSERT INTO channel_user (channel_id, user_id, subscribed_datetime) VALUES
(376, 2521, '2018-02-06 20:43:00'),
(395, 2734, '2017-01-12 12:20:00');