-- phpMyAdmin SQL
-- version 5.0.3

-- Q5. Find the minimum and maximum age of viewers who watched the most commented on video on Taylor Swift’s channel. Display the video title, minimum age and the maximum age.

-- The query first selects the user ID of Taylor Swift and uses it to filter the channels owned by her. 
-- It then joins the Video, Comment and User tables to find the comments associated with each video and the age of the user who made the comment. 
-- It groups the result by video ID, counts the number of comments for each video and selects the video with the highest number of comments (i.e. the video with the most commented) using the ORDER BY COUNT(c.comment_id) DESC LIMIT 1 clause. 
-- Finally, it selects the video title, minimum age and maximum age for the selected video.


SELECT v.title AS video_title, MIN(u.age) AS minimum_age, MAX(u.age) AS maximum_age
FROM Video v
INNER JOIN comment c ON v.video_id = c.video_id
INNER JOIN users u ON c.user_id = u.user_id
INNER JOIN channel ch ON v.channel_id = ch.channel_id
WHERE ch.owner = (
  SELECT user_id 
  FROM users 
  WHERE first_name = 'Taylor' AND last_name = 'Swift'
)
GROUP BY v.video_id
ORDER BY COUNT(c.comment_id) DESC
LIMIT 1;
