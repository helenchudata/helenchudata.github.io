-- The total numbers of Toastmasters events on LetsMeet
SELECT 
	*
FROM event
WHERE LOWER(event_name) LIKE "%toastmaster%";

SELECT 
	COUNT(event_id) AS total_events
FROM event
WHERE LOWER(event_name) LIKE "%toastmaster%";

-- Toastmasters events alongside the cities hosted
SELECT
	event_name,
    city
FROM event
JOIN grp ON event.group_id = grp.group_id
JOIN city ON grp.city_id = city.city_id
WHERE LOWER(event_name) LIKE "%toastmaster%";

-- The exact counts of Toastmaster events for each particular city
SELECT
	city,
    COUNT(event_id) AS total_events
FROM event
JOIN grp ON event.group_id = grp.group_id
JOIN city ON grp.city_id = city.city_id
WHERE LOWER(event_name) LIKE "%toastmaster%"
GROUP BY city;