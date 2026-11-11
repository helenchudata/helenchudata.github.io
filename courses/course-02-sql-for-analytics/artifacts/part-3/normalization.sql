-- Eliminate redundant columns
ALTER TABLE venue_ 
DROP COLUMN country;
/*The country column in the venue_ table is already present in the city table*/

ALTER TABLE city
DROP COLUMN distance; 
/*The distance column in the city table is uniformative*/

ALTER TABLE event
DROP COLUMN why;
/*The why column in the event table don't add additional value to the data*/

ALTER TABLE category
DROP COLUMN sort_name;
/*The sort_name column in the category table contains repetitive information*/

ALTER TABLE grp_member
DROP COLUMN country;
/* The country column in the grp_member table is redundant because LetsMeet only 
operates in one country*/

-- Split grp_member table
CREATE TABLE group_sign_ups
SELECT DISTINCT group_id, member_id, joined
FROM grp_member;

CREATE TABLE members
SELECT DISTINCT member_id, member_name, city, hometown, member_status
FROM grp_member;

ALTER TABLE members
ADD PRIMARY KEY (member_id);

ALTER TABLE group_sign_ups
ADD FOREIGN KEY (member_id) REFERENCES members(member_id);

ALTER TABLE group_sign_ups
ADD FOREIGN KEY (group_id) REFERENCES grp(group_id);

DROP TABLE grp_member;

-- Create a new ERD