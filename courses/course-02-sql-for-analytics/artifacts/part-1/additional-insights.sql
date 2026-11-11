-- Venue_
SELECT
	city.city,
    COUNT(venue_name) AS total_venues
FROM city
JOIN venue_ ON city.city = venue_.city
GROUP BY city_id
ORDER BY COUNT(venue_name) DESC;

/* Which city has the most venues?

The city with the most venues is New York.
New York has in total 518 venues.
New York hosts the most LetsMeet events compared to Chicago, San Francisco, and South San Francisco */

-- Grp
SELECT 
	group_name,
	created,
    join_mode,
    rating,
    members
FROM grp
ORDER BY created
LIMIT 1;

/*What is the longest running group on LetsMeet? 
How many members do they have?

The longest running group of LetsMeet is New York City Poker Group.
New York City Poker Group has a total of 1797 members.
New York City Poker Group was created in 2002-10-08 17:22:15 and is 15 years older than the newest group that was created.*/

-- Grp_member
SELECT 	
	DISTINCT member_name,
    joined,
    member_status
FROM grp_member
WHERE member_status = "active"
ORDER BY joined
LIMIT 1;

SELECT
	member_name,
    COUNT(*) AS total_groups
FROM grp_member
GROUP BY member_name
ORDER BY total_groups DESC
LIMIT 1;

/* Who was the first LetsMeet member that is still active? What member is a part of the most groups?

The first LetsMeet member that is still active is Christine.
THe member that is part of the most groups is Michael.
Michael is in 350 groups meanwhile Christine is in 32 groups. 
There is no relationship between the duration of the member's active status to the number of groups a member is in.*/

-- City
SELECT
*
FROM city
ORDER BY ranking DESC;

/*What is the ranking column? Is it providing any additional useful information about cities?

The ranking column may be data on each city's ranking. 
However, there is not enough information to draw analytical conclusions from this column.*/

-- Event
SELECT 
	event.venue_id,
    venue_name,
    city,
    COUNT(venue_name) AS total_events
FROM event
JOIN venue_ ON event.venue_id = venue_.venue_id
GROUP BY venue_name
ORDER BY total_events DESC;

/*Which venue is the most popular and how many events were held there?

The Ainsworth, Leela, and Studio 302 are the most popular venue.
There were 370 events held at The Ainsworth.
The Ainsworth is located in New York. Earlier we found that New York has the most venues. 
In continuation, The Ainsworth venue in particular has host the most events and is popular 
compared to the rest of the venues.*/

-- Category
SELECT
    category.category_name,
    COUNT(DISTINCT grp_member.member_id) AS total_members
    FROM category
JOIN grp ON category.category_id = grp.category_id
JOIN grp_member ON grp.group_id = grp_member.group_id
GROUP BY category_name
ORDER BY total_members DESC;
  
/*How can you combine the category data with other data to determine the most popular categories 
based on distinct member_id count?

To find the category data with other data to determine the most popular categories based on distinct member_id count
you can use JOIN to join the category table with other tables with foreign keys.
This involves the tables category, grp, and grp_member.
Tech is the most popular category with a total of 11115 members*/