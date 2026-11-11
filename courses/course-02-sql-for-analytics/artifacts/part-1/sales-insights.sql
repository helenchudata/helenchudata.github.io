-- Answer the questions from the Sales team in this file.


-- Active Cities
SELECT 
    DISTINCT city
FROM grp_member
WHERE member_status = "active";

SELECT 
    DISTINCT city,
    state
FROM city 
WHERE city NOT IN
	(SELECT 
		DISTINCT city
	FROM grp_member
	WHERE member_status = "active");

/*What cities have active members?
Are there any cities listed in the city table with no active memebers? If so, what state are those cities in?

LetsMeet have active members within many cities. Active members are located in San Francisco, New York, Chicago, West New York, West Chicago, South San Francisco, North Chicago, Chicago Heights, East Chicago, Chicago Ridge.
However, there are some cities listed on here with no active members. Cities and states with no active members include New York Mills, New York, New York Mills, Minnesota, as well as Chicago Park, California. 
The number of cities with no active members would be considered relatively small if you're comparing to the number of cities with active members.
*/

-- Groups
SELECT 
	join_mode,
    COUNT(*)
FROM grp
GROUP BY join_mode;

/*How many groups are currently open, waiting for approval, and/or closed?

LetsMeet is made up of many groups. There are 3602 groups that are open, 723 wating for approval, and 15 groups that are closed. 
LetsMeet can be considered successful as there are more groups that are currently open than closed.*/

-- Categories
SELECT
	category.category_id,
    category_name,
    COUNT(group_name) AS total_categories
FROM category
JOIN grp ON category.category_id = grp.category_id
GROUP BY category_name
ORDER BY total_categories DESC
LIMIT 5;

SELECT
	category.category_id,
    category_name,
    COUNT(group_name) AS total_categories
FROM category
JOIN grp ON category.category_id = grp.category_id
GROUP BY category_name
ORDER BY total_categories 
LIMIT 5;

/*What are the five categories that contain the most groups? 
What are the five categories that contain the least number of groups?

LetsMeet have many categories of groups. Tech, Career & Business, Socializing, Health & Wellbeing, and Language & Ethnic Identity are the five categories that contain the most groups.
Whereas, Paranormal, Cars & Motorcycles, Sci-Fi & Fantasy, Lifestyle, and Hobbies & Crafts are the five categories that contain the least number of groups.
Tech, Career & Business, Socializing, Health & Wellbeing, and Language & Ethnic Identity could be considered as more popular amoung LetsMeet users compared to the categories with the least amount of groups.*/

-- Members
SELECT 
    COUNT(DISTINCT member_id) AS total_members
FROM grp_member;

SELECT 
    (SELECT 
            COUNT(DISTINCT member_id)
        FROM grp_member
        WHERE city = 'Chicago') / (SELECT COUNT(DISTINCT member_id)
        FROM grp_member) * 100 AS chicago_percentage
        	
/*How many members are there?
What percentage of members are in Chicago?

There are 39980 members using LetsMeet.
Of those members, 21.19% of them are members in Chicago.
This is less than a quarter of the total of LetsMeet users. 
This could indicate there are a lot more other members in different cities outside of Chicago.*/