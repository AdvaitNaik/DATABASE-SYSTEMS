-- phpMyAdmin SQL
-- version 5.0.3

-- Q2. Find the ratio of likes to views of each video belonging to any of the channels owned by users having the word “Marvel Entertainment” in them. Display the Video Title, channel name and the ratio in the ascending order of the title.

-- The WITH clause creates a temporary table called marvel_users that selects the user_id from the users table where the first name or last name contains the string "Marvel Entertainment". 
-- The SELECT statement then joins this temporary table with the video, channel, and statistics tables to retrieve the desired video statistics. 
-- The ROUND function is used to round the likes to views ratio to two decimal places.

WITH marvel_users AS (
  SELECT user_id
  FROM users
  WHERE first_name LIKE '%Marvel Entertainment%' OR last_name LIKE '%Marvel Entertainment%'
)
SELECT 
  v.title, 
  c.name AS channel_name, 
  ROUND(CAST(s.likes AS DECIMAL) / CAST(s.views AS DECIMAL), 2) AS likes_to_views_ratio
FROM 
  video v
  INNER JOIN channel c 
    ON v.channel_id = c.channel_id
  INNER JOIN marvel_users mu 
    ON c.owner = mu.user_id
  INNER JOIN statistics s 
    ON v.video_id = s.video_id
ORDER BY 
  v.title ASC;
