-- schema.sql
-- YouTube Engagement and User Growth Analysis

-- 1. User Table: Stores demographic and membership information
CREATE TABLE user (
    user_id INTEGER PRIMARY KEY,
    name VARCHAR(200),
    gender VARCHAR(200),
    age INTEGER,
    country VARCHAR(200),
    premium_membership BOOLEAN
);

-- 2. Channel Table: Stores channel ownership and creation details
CREATE TABLE channel (
    channel_id INTEGER PRIMARY KEY,
    name VARCHAR(200),
    owner_id INTEGER,
    created_datetime DATETIME
);

-- 3. Video Table: Stores metadata for all hosted content
CREATE TABLE video (
    video_id INTEGER PRIMARY KEY,
    name VARCHAR(200),
    duration_in_secs INTEGER,
    published_datetime DATETIME,
    no_of_views INTEGER,
    channel_id INTEGER,
    FOREIGN KEY (channel_id) REFERENCES channel(channel_id)
);

-- 4. Channel_User Table: Tracks channel subscriptions (Many-to-Many)
CREATE TABLE channel_user (
    channel_id INTEGER,
    user_id INTEGER,
    subscribed_datetime DATETIME,
    PRIMARY KEY (channel_id, user_id),
    FOREIGN KEY (channel_id) REFERENCES channel(channel_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- 5. User_Likes Table: Tracks user engagement (Likes/Dislikes)
CREATE TABLE user_likes (
    user_id INTEGER,
    video_id INTEGER,
    reaction_type VARCHAR(200), -- 'LIKE' or 'DISLIKE'
    reacted_at DATETIME,
    PRIMARY KEY (user_id, video_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (video_id) REFERENCES video(video_id)
);

-- 6. Genre Table: Categorizes types of content
CREATE TABLE genre (
    genre_id INTEGER PRIMARY KEY,
    genre_type VARCHAR(200)
);

-- 7. Video_Genre Table: Maps videos to multiple genres (Many-to-Many)
CREATE TABLE video_genre (
    video_id INTEGER,
    genre_id INTEGER,
    PRIMARY KEY (video_id, genre_id),
    FOREIGN KEY (video_id) REFERENCES video(video_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);