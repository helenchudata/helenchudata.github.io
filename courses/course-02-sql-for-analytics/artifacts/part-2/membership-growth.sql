-- The growth of LetsMeet over the years based on the number of members who joined each year
SELECT 
	join_yr,
    COUNT(join_yr)
FROM
	(SELECT member_id, YEAR(MIN(joined)) AS join_yr
    FROM grp_member
GROUP BY member_id) AS yr
GROUP BY join_yr
ORDER BY join_yr DESC; 
    
-- Rename the smaller cities to the name of their larger urban areas Chicago, San Francisco, and/or New York
SET SQL_SAFE_UPDATES = 0;

UPDATE grp_member
	SET city = "Chicago"
WHERE city IN ("East Chicago", "West Chicago", "North Chicago", "Chicago Heights", "Chicago Ridge");

UPDATE grp_member
	SET city = "San Francisco"
WHERE city IN ("South San Francisco");

UPDATE grp_member
	SET city = "New York"
WHERE city IN ("West New York");

-- The annual growth of LetsMeet for the larger geographical areas of Chicago, San Francisco, and New York
SELECT
	join_yr,
    COUNT(join_yr)
FROM 
	(SELECT 
		member_id,
		YEAR(MIN(joined)) AS join_yr
	FROM grp_member
    WHERE city = "Chicago"
    GROUP BY member_id) AS yr
    GROUP BY join_yr
    ORDER BY join_yr DESC;

SELECT
	join_yr,
    COUNT(join_yr)
FROM 
	(SELECT 
		member_id,
		YEAR(MIN(joined)) AS join_yr
	FROM grp_member
    WHERE city = "San Francisco"
    GROUP BY member_id) AS yr
    GROUP BY join_yr
    ORDER BY join_yr DESC;

SELECT
	join_yr,
    COUNT(join_yr)
FROM 
	(SELECT 
		member_id,
		YEAR(MIN(joined)) AS join_yr
	FROM grp_member
    WHERE city = "New York"
    GROUP BY member_id) AS yr
    GROUP BY join_yr
    ORDER BY join_yr DESC;

-- Month by month growth for LetsMeet in 2017
SELECT
	join_mnth,
    COUNT(join_mnth)
FROM
	(SELECT 
		member_id, 
        MONTH(MIN(joined)) AS join_mnth
	FROM grp_member
    WHERE YEAR(joined) = 2017
    GROUP BY member_id) AS mnth
    GROUP BY join_mnth
    ORDER BY join_mnth;