-- phpMyAdmin SQL
-- version 5.0.3

-- Q1. Find the sponsor who has sponsored the highest amount in YouTube. Display the sponsor’s name, phone number and the total amount sponsored.

-- The query joins the two tables based on the sponsor ID, groups the results by sponsor, sums the total amount sponsored by each sponsor and then orders them in descending order based on the total amount. 
-- The LIMIT 1 clause at the end ensures that only the sponsor with the highest total amount sponsored is returned. 
-- The SELECT statement then selects the sponsor's name, phone number, and total amount sponsored.

SELECT sp.name AS sponsor_name, sp.phone AS phone_number, SUM(svm.sponsor_amount) AS total_amount_sponsored
FROM sponsor sp
JOIN sponsor_video_mapping svm ON sp.sponsor_id = svm.sponsor_id
GROUP BY sp.sponsor_id
ORDER BY total_amount_sponsored DESC
LIMIT 1;
