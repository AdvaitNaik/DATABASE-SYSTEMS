-- phpMyAdmin SQL
-- version 5.0.3

-- Q4. Find the average sentiment score for each keyword category. Display the keyword name along with average score such that the highest score is displayed first.

-- The query selects the keyword column from the Keyword table and the average sentiment score from the Comment table using the AVG() function.
-- Then, it uses an INNER JOIN to join the Keyword table with the Video table on the video_id column to get the video associated with each keyword.
-- Next, it uses another INNER JOIN to join the Video table with the Comment table on the video_id column to get all the comments associated with each video.
-- The results are then grouped by the keyword column using the GROUP BY clause.
-- Finally, the results are sorted in descending order of the average score using the ORDER BY clause with the DESC keyword.


SELECT k.keyword AS keyword_name, AVG(c.sentiment_score) AS average_score
FROM keyword k
INNER JOIN video v ON k.video_id = v.video_id
INNER JOIN comment c ON v.video_id = c.video_id
GROUP BY k.keyword
ORDER BY average_score DESC;