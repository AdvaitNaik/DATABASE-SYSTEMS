-- phpMyAdmin SQL
-- version 5.0.3

-- Q2. Find the ratio of likes to views of each video belonging to any of the channels owned by users having the word “Marvel Entertainment” in them. Display the Video Title, channel name and the ratio in the ascending order of the title.

-- The query retrieves video statistics from a database for videos owned by users with "Marvel Entertainment" in their first or last names. 
-- The SELECT statement retrieves the video title, channel name, and ratio of likes to views for each video. 
-- The AS keyword is used to assign aliases to the column names for better readability.
-- The FROM clause specifies the tables that the query will be using: video, channel, user, and statistics.
-- The video table is joined with the channel table using the channel_id field, the channel table is joined with the user table using the owner field, and the video table is joined with the statistics table using the video_id field.
-- The WHERE clause specifies the condition that the query should filter on. In this case, it selects videos where the user's first name or last name contains the string "Marvel Entertainment". 
-- The % characters are used as wildcards to match any character before or after the string.
-- The ORDER BY clause specifies how the query should sort the results. In this case, it sorts the results by video title in ascending order.

SELECT v.title AS video_title, c.name AS channel_name, ROUND(CAST(s.likes AS DECIMAL) / CAST(s.views AS DECIMAL), 2) AS ratio_likes_views
FROM video v
JOIN channel c ON v.channel_id = c.channel_id
JOIN users u ON c.owner = u.user_id
JOIN statistics s ON v.video_id = s.video_id
WHERE u.first_name LIKE '%Marvel Entertainment%' OR u.last_name LIKE '%Marvel Entertainment%'
ORDER BY v.title ASC;