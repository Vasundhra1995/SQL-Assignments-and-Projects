-- Question 1 -- 

SELECT name, address
FROM business;

SELECT *
FROM business
INNER JOIN review ON business.id = review.business_id;

SELECT name, COUNT(*) AS review_count
FROM business
JOIN review ON business.id = review.business_id
GROUP BY name
ORDER BY review_count DESC
LIMIT 10;

SELECT business_id, MAX(stars) AS highest_rating
FROM review
GROUP BY business_id;

SELECT b.name, CHAR_LENGTH(r.text) AS average_review_length
FROM business b
JOIN review r ON b.id = r.business_id;

-- Question 2 --

SELECT (COUNT(*) * 100 / (SELECT COUNT(*) FROM review)) AS percentage
FROM review
WHERE stars = 5;

SELECT name, AVG(stars) AS average_rating
FROM business
JOIN review ON business.id = review.business_id
GROUP BY name
ORDER BY average_rating DESC;

-- Question 3 --

WITH CTE AS (
  SELECT
    review.business_id,
    AVG(review.stars) AS stars,
    MAX(review.date) AS latest_review_date,
    business.name AS business_name,
    business.address,
    CASE
      WHEN AVG(review.stars) > 3 THEN 'Good Business'
      WHEN AVG(review.stars) < 3 THEN 'Poor Business'
      ELSE 'No Business'
    END AS Final_Result
  FROM review
  INNER JOIN business ON review.business_id = business.id
  GROUP BY review.business_id, business.name, business.address
)
SELECT *
FROM CTE

-- Question 4 --

WITH CTE AS (
  SELECT
    review.business_id,
    AVG(review.stars) AS stars,
    MIN(review.date) AS latest_review_date,
    business.name AS business_name,
    business.address,
    CASE
      WHEN AVG(review.stars) = 5 THEN 'Good Business'
      ELSE 'No Business'
    END AS Final_Result
  FROM review
  INNER JOIN business ON review.business_id = business.id
  GROUP BY review.business_id, business.name, business.address
)
SELECT *
FROM CTE
WHERE Final_Result = 'Good Business';

-- Question 5 --

SELECT DAYNAME(date) AS day_name, COUNT(*) AS review_count, AVG(stars) AS average_rating
FROM review
INNER JOIN business ON review.business_id = business.id
GROUP BY DAYNAME(date)
ORDER BY average_rating DESC
;

