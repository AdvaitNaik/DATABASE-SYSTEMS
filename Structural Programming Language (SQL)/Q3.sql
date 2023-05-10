-- phpMyAdmin SQL
-- version 5.0.3

-- Q3. Find unique user/s with the total number of paid subscribers greater than 100 for their channel/s created on 01.01.2023. Display the username, email, channel name and the subscriber count.

-- The query joins the User, Channel, and Subscription tables using INNER JOIN
-- Then filters for channels created on 01.01.2023 with paid subscriptions using WHERE clause. 
-- It then groups the results by user_id and channel_id to count the number of subscribers for each channel using COUNT(). 
-- Finally, it filters for results with a subscriber count greater than 100 and selects the relevant fields to display.

SELECT CONCAT(u.first_name, ' ', u.last_name) AS user_name, c.name AS channel_name, c.subscription_count AS subscriber_count
FROM Users u
JOIN Channel c ON u.user_id = c.owner
JOIN Subscription s ON c.channel_id = s.channel_id
WHERE s.subscription_type = TRUE
  AND c.created_date = '2023-01-01'
GROUP BY u.user_id, c.channel_id
HAVING COUNT(*) > 100