-- Query break down groups by rating
SELECT 
	CASE
		WHEN rating BETWEEN 1 AND 1.99 THEN "1-1.99"
        WHEN rating BETWEEN 2 AND 2.99 THEN "2-2.99"
        WHEN rating BETWEEN 3 AND 3.99 THEN "3-3.99"
        WHEN rating BETWEEN 4 AND 4.99 THEN "4-4.99"
        WHEN rating = 5 THEN "5"
	END AS rating_category,
    COUNT(group_id) AS group_count
FROM grp
GROUP BY rating_category
ORDER BY rating_category; 

/*How many groups have 5 star ratings?
Of the groups that have been rated, what percent of groups are rated 5 stars?
Is this a reliable measure of the success or popularity of the group?*

- The total amount of groups with 5 star ratings is 745.
- Of the groups that have been rated, 2.67% were rated 5.
- We would need more data and other determining factors to consider this as a measure of success or popularity 
of the group.
*/

-- Find those with the most members with perfect 5 star rating
SELECT
	group_name,
    members,
    rating
FROM grp
WHERE rating = 5
ORDER BY members DESC
LIMIT 5;

-- Adjust query to include the city for each group 
SELECT
	group_name,
    members,
    rating,
    city
FROM grp
JOIN city ON grp.city_id = city.city_id
WHERE rating = 5
ORDER BY members DESC;

-- Ensure a wide variey of groups
SELECT
	group_name,
    members,
    city,
    category_name, 
    rating
FROM grp
JOIN city ON grp.city_id = city.city_id
JOIN category ON grp.category_id= category.category_id
WHERE rating = 5
AND city IN ("New York", "Chicago", "San Francisco")
ORDER BY members DESC;

/*Should you only include groups from the most popular categories?
What about including only groups from the least represented category to try and increase the variety of groups 
on LetMeet?*/
