-------------------------------------------
-- 	       Preminilary Steps         --
-------------------------------------------
-- Load cleaned Airbnb Files from Pig
-- Preprocess each data file 
-- (1) listings
-- (2) reviews
-- (3) calendar
-------------------------------------------

create database if not exists bdm3;

drop table if exists bdm3.listings;
drop table if exists bdm3.reviews;
drop table if exists bdm3.calendar;

show databases;


---------------------------------------------
-- 		  Listings                 --
---------------------------------------------
-- Define Schema for each attribute
-- Ensure the attributes and their data types 
-- aligned with cleaned file
---------------------------------------------

CREATE EXTERNAL TABLE IF NOT EXISTS bdm3.listings
(listing_id INT, listing_url string, scrape_id INT, last_scraped date, name string, description string, neighborhood_overview string, picture_url string, host_id INT, host_url string, host_name string, host_since int, host_location string, host_about string, host_response_time string, host_response_rate float, host_acceptance_rate float, host_is_superhost string, host_thumbnail_url string, host_picture_url string, host_neighbourhood string, host_listings_count int, host_total_listings_count int, host_verifications string, host_has_profile_pic string, host_identity_verified string, neighborhood string, neighborhood_cleansed string, neighborhood_group_cleansed string, latitude float, longitude float, property_type string, room_type string, accommodates int, bathrooms int, bathrooms_text string, bedrooms int, beds int, amenities string, price float, minimum_nights int, maximum_nights int, minimum_minimum_nights int, maximum_minimum_nights int, minimum_maximum_nights int, maximum_maximum_nights int, minimum_nights_avg_ntm int, maximum_nights_avg_ntm int, calendar_updated date, has_availability string, availability_30 int, availability_60 int, availability_90 int, availability_365 int, calendar_last_scraped date, number_of_reviews int, number_of_reviews_ltm int, number_of_reviews_l30d int, first_review date, last_review date, review_scores_rating float, review_scores_accuracy float, review_scores_cleanliness float, review_scores_checkin float, review_scores_communication float, review_scores_location float, review_scores_value float, license string, instant_bookable string, calculated_host_listings_count int, calculated_host_listings_count_entire_homes int, calculated_host_listings_count_private_rooms int, calculated_host_listings_count_shared_rooms int, reviews_per_month float, start_year string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';


load data inpath '/bdm/SINGAPORE/pig/clean_data/listings/part-m-00000' into table bdm3.listings;

-- Optional part
-- select * from bdm3.listings limit 5;
-- describe bdm3.listings;



---------------------------------------------
-- 		  Reviews                 --
---------------------------------------------
-- Define Schema for each attribute
-- Similarly, ensure the attribute titles 
-- aligned to data columns in cleaned data 
-- file from Pig.
---------------------------------------------

CREATE EXTERNAL TABLE IF NOT EXISTS bdm3.reviews
(listing_id INT, review_id INT, date_ DATE, review_year INT, review_month INT, reviewer_id INT, reviewer_name string, comments string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';


load data inpath '/bdm/SINGAPORE/pig/clean_data/reviews/part-m-00000' into table bdm3.reviews;

-- Optional part 
-- select * from bdm3.reviews limit 5;
-- describe bdm3.reviews;



---------------------------------------------
-- 		  Calendar                 --
---------------------------------------------
-- Define Schema for each attribute
-- Also, ensure the attribute titles aligned 
-- to data columns in cleaned data file from Pig.
----------------------------------------------

CREATE EXTERNAL TABLE IF NOT EXISTS bdm3.calendar
(listing_id INT, date_ date, calendar_year INT, calendar_month INT, available string, price float, adjusted_price float, minimum_nights int, maximum_nights int)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';


load data inpath '/bdm/SINGAPORE/pig/clean_data/calendar/part-m-00000' into table bdm3.calendar;

-- Optional part 
-- select * from bdm3.calendar limit 5;
-- describe bdm3.calendar;



alter table bdm3.listings set tblproperties('EXTERNAL' = 'FALSE');
alter table bdm3.reviews set tblproperties('EXTERNAL' = 'FALSE');
alter table bdm3.calendar set tblproperties('EXTERNAL' = 'FALSE');

