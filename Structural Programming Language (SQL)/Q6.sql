-- phpMyAdmin SQL
-- version 5.0.3

-- Q6. Find all the content creators living in the US who have consistently posted at least 1 video each week of the last month. Display their username, channel/s they own and their total subscriber count.

-- Query use the JOIN keyword to join the User, Channel, and Video tables on their corresponding foreign keys.
-- Filter the result set to only include content creators living in the US by using the WHERE clause with the condition u.country = 'US'.
-- Filter the result set to only include videos uploaded in the last month by using the v.uploaded_date BETWEEN condition with the start date set to the 1st day of the month one month ago and the end date set to the last day of the month one month ago. 
-- The DATE_FORMAT() function to get the 1st day of the month one month ago and the LAST_DAY() function to get the last day of the month one month ago.
-- The result set by user ID and channel ID using the GROUP BY clause.
-- The HAVING clause to filter out any content creators who have not posted at least 1 video each week of the last month. 
-- Count the number of distinct weeks in which videos were uploaded using the WEEK() function and filter for a count of at least 4.
-- Order the result set by total subscribers in descending order using the ORDER BY clause.


SELECT CONCAT(u.first_name, ' ', u.last_name) AS user_name,
       c.name AS channel_name,
       c.subscription_count AS total_subscribers
FROM Users u
JOIN Channel c ON u.user_id = c.owner
JOIN Video v ON c.channel_id = v.channel_id
WHERE u.country = 'US'
  AND v.uploaded_date BETWEEN DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 1 MONTH), '%Y-%m-01') AND LAST_DAY(DATE_SUB(NOW(), INTERVAL 1 MONTH))
GROUP BY u.user_id, c.channel_id
HAVING COUNT(DISTINCT WEEK(v.uploaded_date)) >= 4
ORDER BY total_subscribers DESC; 

-- Bit.io

/*
SELECT CONCAT(u.first_name, ' ', u.last_name) AS user_name,
       c.name AS channel_name,
       c.subscription_count AS total_subscribers
FROM Users u
JOIN Channel c ON u.user_id = c.owner
JOIN Video v ON c.channel_id = v.channel_id
WHERE u.country = 'US'
  AND v.uploaded_date BETWEEN DATE_TRUNC('MONTH', CURRENT_DATE - INTERVAL '1 month') AND DATE_TRUNC('MONTH', CURRENT_DATE - INTERVAL '1 month') + INTERVAL '1 month - 1 day'
GROUP BY u.user_id, c.channel_id
HAVING COUNT(DISTINCT EXTRACT(WEEK FROM v.uploaded_date)) >= 4
ORDER BY total_subscribers DESC; 
*/
